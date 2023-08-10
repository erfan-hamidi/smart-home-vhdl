library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FanSpeed is
	generic (Period: Integer := 4);
    Port (
		    clk      : in  std_logic;      -- clock [posedge] 
			rst      : in  std_logic;      -- reset [asynch]  
			speed    : in  std_logic_vector(7 downto 0); -- fan speed  
			pwd_data : out std_logic       -- data [output]
		  );
end entity;

architecture arch of FanSpeed is

	-- signals
	signal duty_cycle : integer := ( to_integer(signed(speed)) ) / 256;
	signal duty_count : integer := ( (duty_cycle * Period) / 100 );
	
	-- temp signals
	signal duty_count_temp : integer := duty_count;
	signal Period_temp : integer := Period;
	signal temp : integer := 0;
begin
        
	process (clk, rst)
	begin
		if (rst = '1') then
			pwd_data <= '0';
		elsif (clk = '1' and clk'event) then
		
			if (temp < period) then
				temp <= temp + 1;
			else
				temp <= 0;
			end if;	
			
			if (temp < duty_count) then
				pwd_data <= '1';
			else
				pwd_data <= '0';
			end if;
			
			
--			if (duty_count_temp > 0) then
--				pwd_data <= '1';
--			else
--				pwd_data <= '0';
--			end if;
			
--			if (Period_temp = 0) then
--				Period_temp <= Period;
--				duty_count_temp <= duty_count;
--			else
--				duty_count_temp <= (duty_count_temp - 1);
--				Period_temp <= (Period_temp - 1);
--			end if;
			
		end if;
		
	end process;
end architecture arch;

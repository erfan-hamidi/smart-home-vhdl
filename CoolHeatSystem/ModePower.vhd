library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ModePower is
    Port (
			chs_conf  : in  std_logic_vector(7 downto 0); -- degree [temperature] 
			chs_power : out std_logic_vector(3 downto 0); -- power  [cooler/heater] 
			chs_mode  : out std_logic                     -- model  [heat=1/cool=0]
		  );
end entity;

architecture arch of ModePower is
	
	-- function to calculate count of '1' 
	function count_ones(s : std_logic_vector) return std_logic_vector is
		variable count : Integer := 0;
		variable result : std_logic_vector(3 downto 0);
	begin
		for i in s'range loop
			if s(i) = '1' then
				count := count + 1; 
			end if;
		end loop;
	
		result := std_logic_vector( to_signed(count, result'length) );
		return result;
	end function count_ones;
	
	-- function to calculate if the input is odd or even 
	function odd_even_calculate(s : std_logic_vector) return std_logic is
		variable result : std_logic;
	begin
		-- even -> cool
		if (s(0) = '0') then
			result := '0';
		-- odd -> heat
		elsif (s(0) = '1') then
			result := '1';
		end if;
		
		return result;
	end function odd_even_calculate;


	-- signals
	signal count : std_logic_vector(3 downto 0);
	signal odd_even : std_logic;
	
begin
    
    -- function calls
	count <= count_ones(chs_conf);
	odd_even <= odd_even_calculate(count);
	
	-- The outputs
	chs_power <= count;
	chs_mode <= odd_even;
	
end architecture arch;

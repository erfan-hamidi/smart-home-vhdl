library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_CoolHeatSystem is
	generic(Period_tb : integer := 4);
end entity tb_CoolHeatSystem;

architecture arch of tb_CoolHeatSystem is
    
    component CoolHeatSystem is
	Generic (Period : Integer);
    Port (
			clk       : in  std_logic;     -- clock [posedge] 
			rst       : in  std_logic;      -- reset [asynch]  
			speed     : in  std_logic_vector(7 downto 0); -- speed
			chs_conf  : in  std_logic_vector(7 downto 0); -- degree [temperature] 
			chs_power : out std_logic_vector(3 downto 0); -- power  [cooler/heater] 
			chs_mode  : out std_logic;                    -- model  [heat=1/cool=0]
			pwd_data  : out std_logic                     -- data  [output]
		   );
	end component;
    
    signal clk, rst, chs_mode, pwd_data : std_logic;
    signal speed, chs_conf : std_logic_vector(7 downto 0);
    signal chs_power : std_logic_vector(3 downto 0);
    
    -- clock signals`
	signal clk_time : time := 10 ns;
    
begin
    -- Unit Under Test
	UUT: CoolHeatSystem generic map (Period => Period_tb)
					   port map (clk, rst, speed, chs_conf, chs_power, chs_mode, pwd_data);
	
	
	clk_process: process
    begin
		while now < 1000 ns loop
            clk <= '0';
            wait for clk_time;
            clk <= '1';
            wait for clk_time;
        end loop;
        wait;
    end process;
    
	
    -- Stimulus process
    main: process
    begin
    
        -- Test Case 1
        speed <= std_logic_vector( to_signed(12800, speed'Length) );
        chs_conf <= "00000101";
        rst <= '0';
		
		-- Test Case 2

      wait;
    end process;
end architecture;

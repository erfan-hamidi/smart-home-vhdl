library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CoolHeatSystem is
	Generic (Period : Integer := 4);
    Port (
			clk       : in  std_logic;     -- clock [posedge] 
			rst      : in  std_logic;     -- reset [asynch]  
			speed     : in  std_logic_vector(7 downto 0); -- speed
			chs_conf  : in  std_logic_vector(7 downto 0); -- degree [temperature] 
			chs_power : out std_logic_vector(3 downto 0); -- power  [cooler/heater] 
			chs_mode  : out std_logic;                    -- model  [heat=1/cool=0]
			pwd_data  : out std_logic                     -- data  [output]
		   );
end entity;

architecture arch of CoolHeatSystem is
	
	component ModePower is
    Port (
			chs_conf  : in  std_logic_vector(7 downto 0); -- degree [temperature] 
			chs_power : out std_logic_vector(3 downto 0); -- power  [cooler/heater] 
			chs_mode  : out std_logic                     -- model  [heat=1/cool=0]
		  );
	end component;
	
	component FanSpeed is
	generic (Period: Integer);
    Port (
		    clk      : in  std_logic;      -- clock [posedge] 
			rst      : in  std_logic;      -- reset [asynch]  
			speed    : in  std_logic_vector(7 downto 0); -- fan speed  
			pwd_data : out std_logic       -- data [output]
		  );
	end component;
	
	
begin
    
    ModePower_unit : ModePower port map (chs_conf, chs_power, chs_mode);
    
    FanSpeed_unit : FanSpeed generic map(Period => Period)
							 port map (clk, rst, speed, pwd_data);
    
end architecture arch;

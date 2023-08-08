
library ieee;
use ieee.std_logic_1164.all;

entity lightsystem_tb is
end entity;

architecture bihavior of lightsystem_tb is

component lightsystem is
		port(
			tcode, user_light, lengthin	:	in	std_logic_vector(3 downto 0);
			wshade, lights_num	:	out	std_logic_vector(3 downto 0);
			light_state	:	out	std_logic_vector(15 downto 0));
	end component;

	signal tcode, user_light, lengthin, wshade, lights_num : std_logic_vector(3 downto 0) := "0000";
	signal light_state : std_logic_vector(15 downto 0) := "0000000000000000";
	
	begin
		UUT: lightsystem port map(tcode, user_light, lengthin, wshade, lights_num, light_state);

		stim_proc: process
		begin
			wait for 10ns;
			tcode <= "0001";
			user_light <= "1010";
			lengthin <= "0110";

			wait for 20ns;
			tcode <= "0010";

			wait for 20ns;
			tcode <= "0100";

			wait for 20ns;
			tcode <= "1000";

			wait for 20ns;
			tcode <= "0000";
		end process;
end;
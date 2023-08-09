library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tb_Temp_Calculator is
end tb_Temp_Calculator;

architecture arch of tb_Temp_Calculator is

	component Temp_Calculator is
		Port ( basee : in STD_LOGIC_VECTOR (31 downto 0);
			   ref : in STD_LOGIC_VECTOR (7 downto 0);
			   adc_data: in STD_LOGIC_VECTOR (15 downto 0);
			   tempc : out STD_LOGIC_VECTOR (31 downto 0)
              );
	end component Temp_Calculator;


	signal basee : std_logic_vector (31 downto 0);
	signal ref : std_logic_vector (7 downto 0);
	signal adc_data : std_logic_vector (15 downto 0);
	signal tempc : std_logic_vector (31 downto 0);

begin

	uut : Temp_Calculator port map(basee, ref, adc_data, tempc);

	process
		begin
		 
		-- Test Case 1
		basee <= "00000000000000000000000000011010"; -- 26  
		ref   <= "00001011"; -- 11  
		adc_data <= "0000000000001110"; -- +14 (sign magnitude)
		-- (11^2 * 14) / 64 = 26.46
		wait for 20 ns;
		
		-- Test Case 2
		basee <= "00000000000000000000000000011010"; -- 26  
		ref   <= "00001011"; -- 11  
		adc_data <= "1000000000001110"; -- -14 (sign magnitude)
		-- (11^2 * 14) / 64 = 26.46
		wait for 20 ns;
		
		-- Test Case 3
		basee <= "00000000000000000000000000101010"; -- 42  
		ref   <= "00010001"; -- 17  
		adc_data <= "1000000000000011"; -- -3 (sign magnitude)
		-- (17^2 * 3) / 64 = 13.54
		wait for 20 ns;
		
		wait;
	end process;

end arch;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tb_Adder_Subtractor is
end tb_Adder_Subtractor;

architecture Behavioral of tb_Adder_Subtractor is

component Adder_Subtractor is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Mode: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (31 downto 0)
          );
end component Adder_Subtractor;



signal A_TB : std_logic_vector (31 downto 0);
signal B_TB : std_logic_vector (31 downto 0);
signal Mode_TB : std_logic;
signal S_TB : std_logic_vector (31 downto 0);

begin

uut : Adder_Subtractor port map(A_TB, B_TB, Mode_TB, S_TB);

process
	begin
	 
	-- Test Case 1
	A_TB <= std_logic_vector( to_signed(35, A_TB'Length) );
	B_TB <= std_logic_vector( to_signed(15, B_TB'Length) );
	Mode_TB <= '0';
	
	wait for 20 ns;
	
	
	-- Test Case 2
	Mode_TB <= '1';
	A_TB <= std_logic_vector( to_signed(44, A_TB'Length) );
	B_TB <= std_logic_vector( to_signed(2, B_TB'Length) );
	Mode_TB <= '1';
	
	wait for 20 ns;

	wait;
end process;


end Behavioral;
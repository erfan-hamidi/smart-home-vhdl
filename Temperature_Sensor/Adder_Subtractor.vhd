library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Adder_Subtractor is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Mode: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (31 downto 0)
          );
end Adder_Subtractor;

architecture Behavioral of Adder_Subtractor is

	component Full_Adder is
		Port ( in1 : in STD_LOGIC;
			   in2 : in STD_LOGIC;
			   fcin : in STD_LOGIC;
			   sum : out STD_LOGIC;
			   fcout : out STD_LOGIC);
	end component Full_Adder;

	signal B_final : std_logic_vector (31 downto 0);
	signal C : std_logic_vector (31+1 downto 0);

begin

	-- Check if mode is 1 then we make 2's complement of B, means we use subtractor (A-B)
	B_final <=  std_logic_vector( (signed(not(B)) + to_signed(1, B_final'length)) ) when Mode = '1' else B;


	C(0) <= '0';
	
	uut0to7: For i in 0 to 31 generate
		uut: Full_Adder port map(A(i), B_final(i), C(i), S(i), C(i+1));
	end generate;	


end Behavioral;
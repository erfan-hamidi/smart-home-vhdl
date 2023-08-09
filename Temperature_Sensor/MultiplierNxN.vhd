library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MultiplierNxN is
	generic(N : natural := 8);
    port (
			A, B : in std_logic_vector(N-1 downto 0);
			Product : out std_logic_vector(2*N-1 downto 0)
		  );
end entity MultiplierNxN;

architecture Behavioral of MultiplierNxN is

begin

	Product <= std_logic_vector( (signed(A)) * (signed(B)) );
	
end architecture Behavioral;

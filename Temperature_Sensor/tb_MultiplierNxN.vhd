library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_MultiplierNxN is
	generic(NN : natural := 16);
end entity tb_MultiplierNxN;

architecture Behavioral of tb_MultiplierNxN is
    
    component MultiplierNxN is
	generic(N : natural);
    port (
			A, B : in std_logic_vector(NN-1 downto 0);
			Product : out std_logic_vector(2*NN-1 downto 0)
		  );
	end component;
    
    signal A, B : std_logic_vector(NN-1 downto 0);
    signal Product : std_logic_vector(2*NN-1 downto 0);
    
begin
    -- Unit Under Test
	UUT: MultiplierNxN generic map (N => NN)
					   port map (A, B, Product);
	
	
    -- Stimulus process
    Stimulus_Process: process
    begin
    
        -- Test Case 1
        A <= std_logic_vector( to_signed(2, A'Length) );
        B <= std_logic_vector( to_signed(5, B'Length) );
		
		wait for 10 ns;
		
		
		-- Test Case 2
		A <= std_logic_vector( to_signed(11, A'Length) );
        B <= std_logic_vector( to_signed(9, B'Length) );
        
        wait for 10 ns;
        
        
        -- Test Case 3
        A <= std_logic_vector( to_signed(-1, A'Length) );
        B <= std_logic_vector( to_signed(6, B'Length) );
        
        wait for 10 ns;
        
        
        -- Test Case 4
		A <= std_logic_vector( to_signed(-2, A'Length) );
        B <= std_logic_vector( to_signed(-3, B'Length) );
        
        wait for 10 ns;
        
      wait;
    end process;
end architecture Behavioral;

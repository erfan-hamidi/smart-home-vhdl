library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Memregister_tb is
		  
end Memregister_tb;


ARCHITECTURE behavior OF Memregister_tb IS

component Memregister is
	port(
			memin	:	in	std_logic_vector(34 downto 0);
			sel	:	in	std_logic_vector(2 downto 0);
			ld  : IN STD_LOGIC; -- load/enable.
			clr : IN STD_LOGIC; 
			clk : IN STD_LOGIC;
			memout	:	out	std_logic_vector(34 downto 0)
			);
end component;
signal   memin	: std_logic_vector(34 downto 0);
signal	sel	:	std_logic_vector(2 downto 0);
signal	ld  : STD_LOGIC; -- load/enable.
signal	clr : STD_LOGIC; 
signal	clk : STD_LOGIC;
signal	memout	:	std_logic_vector(34 downto 0);



constant clk_period : time := 20 ns;

begin
	UUT: Memregister port map(memin, sel, ld, clr, clk, memout);

	clk_process :process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process;

	process 
	begin 
	clr <= '1';
	wait for 40ns;
	clr <= '0';
	ld <= '1';
	sel <= "000";
	memin <= "00000000000000000000000000000000011";
	wait for 20ns;
	ld <= '1';
	sel <= "110";
	memin <= "10000000000000000000000000000000000";	
	wait for 20 ns;
	ld <= '1';
	sel <= "010";
	memin <= "00000000000000001000000000000000000";
	wait for 20 ns;
	ld <= '0';
	wait for 20 ns;
	end process;
end;

library ieee;
use ieee.std_logic_1164.all;


entity Confandpswd_tb is
end entity;



architecture bihavior of Confandpswd_tb is


	component Confandpswd is
		port(
			usermemin	:	in	std_logic_vector(34 downto 0);
			password	:	in	std_logic_vector(1 downto 0);
			confirm  : IN STD_LOGIC;
			request : IN STD_LOGIC; 
			clock : IN STD_LOGIC;
			usermemout	:	out	std_logic_vector(34 downto 0)
			);
	end component;
	
	
	
	signal   usermemin	:	std_logic_vector(34 downto 0);
	signal	password	:	std_logic_vector(1 downto 0);
	signal	confirm  : STD_LOGIC;
	signal	request : STD_LOGIC; 
	signal	clock : STD_LOGIC;
	signal	usermemout	:	std_logic_vector(34 downto 0);



constant clk_period : time := 20 ns;

BEGIN
	UUT: Confandpswd port map(usermemin, password, confirm, request, clock, usermemout);
	
clk_process :process
begin
clock <= '0';

wait for clk_period/2;
clock <= '1';

wait for clk_period/2;
end process;


	process 
	begin 

	usermemin <= "00000000000000000000000000000000000";
	wait for 50 ns;
	request <= '1';
	wait for 20 ns;
	password <= "01";
	confirm <= '1';
	wait for 20 ns;
	usermemin <= "10100000010100001110010100001001101";
	confirm <= '1';
	wait for 40 ns;
	request <= '0';
	
	end process;
end;	
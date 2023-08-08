library ieee;
use ieee.std_logic_1164.all;


entity Confandpswd is
	port(
			usermemin	:	in	std_logic_vector(34 downto 0);
			password	:	in	std_logic_vector(1 downto 0);
			confirm  : IN STD_LOGIC;
			request : IN STD_LOGIC; 
			clock : IN STD_LOGIC;
			usermemout	:	out	std_logic_vector(34 downto 0)
			);
end entity;


architecture bihavior of Confandpswd is


	component Memregister is
		port(
				memin	:	in	std_logic_vector(34 downto 0);
				sel	:	in	std_logic_vector(2 downto 0);
				ld  : IN STD_LOGIC; -- load/enable.
				clr : IN STD_LOGIC; 
				clk : IN STD_LOGIC;
				init : in STD_LOGIC;
				memout	:	out	std_logic_vector(34 downto 0)
				);
	end component;

	TYPE type_fstate IS (A, B, C, D, E);
	signal state : type_fstate;
	signal next_state : type_fstate;
	signal   memin	: std_logic_vector(34 downto 0);
	signal	sel	:	std_logic_vector(2 downto 0);
	signal	ld  : STD_LOGIC; -- load/enable.
	signal	clr : STD_LOGIC; 
	signal	clk : STD_LOGIC;
	signal init : STD_LOGIC;
	signal	memout	:	std_logic_vector(34 downto 0);

	begin
	UUT: Memregister port map(memin, sel, ld, clr, clk, init ,memout);
	
		PROCESS (clock,next_state)
    	BEGIN
			IF (clock='1' AND clock'event) THEN
				state <= next_state;
			END IF;
		END PROCESS;

		PROCESS (state,request)
    	BEGIN
			usermemout <= memout;
			case state is
				when A =>
					if request = '1' then
						next_state <= B;
					else
						next_state <= A;
					end if;
				when B =>
					if confirm = '1' and password = memout(34 downto 33) then
						next_state <= C;
					elsif request = '0' then
						next_state <= A;
					else
					next_state <= E;
					end if;
				when C =>
						if confirm = '1' then
							next_state <= D;
						elsif request = '0' then
							next_state <= A;
						else
						next_state <= C;
						end if;
				when D =>
					memin <= usermemin;
					init <= '1';
					if request = '0' then
						next_state <= A;
					else
					next_state <= A;
					end if;
				when E =>
					if request = '0' then
						next_state <= A;
					else
					next_state <= E;
					end if;
				when others =>
					next_state <= A;
			
			end case;

		end process;

end;
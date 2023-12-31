library ieee;
use ieee.std_logic_1164.all;


entity Memregister is
	port(
			memin	:	in	std_logic_vector(34 downto 0);
			sel	:	in	std_logic_vector(2 downto 0);
			ld  : IN STD_LOGIC; -- load/enable.
			clr : IN STD_LOGIC; 
			clk : IN STD_LOGIC;
			init : in STD_LOGIC;
			memout	:	out	std_logic_vector(34 downto 0)
			);
end entity;


architecture bihavior of Memregister is
	signal mem	:	std_logic_vector(34 downto 0) := "00000000000000000000000000000000000";
BEGIN
	
    process(clk, clr)
    begin
        if clr = '1' then
            memout <= "00000000000000000000000000000000000";
				mem <= "00000000000000000000000000000000000";
		elsif rising_edge(clk) then
			if ld = '1' then
				case sel is
					when "000" =>
						mem(7 downto 0) <= memin(7 downto 0);
					when "001" =>
						mem(15 downto 8) <= memin(15 downto 8);
					when "010" =>
						mem(19 downto 16) <= memin(19 downto 16);
					when "011" =>
						mem(23 downto 20) <= memin(23 downto 20);
					when "100" =>
						mem(31 downto 24) <= memin(31 downto 24);
					when "101" =>
						mem(32) <= memin(32);
					when "110" =>
						mem(34 downto 33) <= memin(34 downto 33);
					when others =>
						mem <= (others => 'X');
				end case; 
			elsif init = '1' then
					mem <= memin;
			end if;
			memout <= mem;
        end if;
		  
		  
    end process;
					

end;
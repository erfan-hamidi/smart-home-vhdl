library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity gassensor_tb is
		  
end gassensor_tb;


ARCHITECTURE behavior OF gassensor_tb IS


COMPONENT gassensor
PORT(
        rst : IN STD_LOGIC := '0';
        clk : IN STD_LOGIC;
        din : IN STD_LOGIC := '0';
        dout : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
);
END COMPONENT;


--Inputs
signal clk : std_logic := '0';
signal din : std_logic := '0';
signal rst : std_logic := '0';
 
--Outputs
signal dout :  STD_LOGIC_VECTOR(2 DOWNTO 0);

constant clk_period : time := 20 ns;

BEGIN



uut: gassensor PORT MAP (
clk => clk,
din => din,
rst => rst,
dout => dout

);


clk_process :process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process;

stim_proc: process
begin
 
rst <= '1';
 
wait for 50 ns;
 
rst <= '0';
 
din <= '1';             --din = 1
 
wait for 20 ns;
 
din <= '0';             --din = 10
 
wait for 20 ns;
 
din <= '1';             --din = 101
 
wait for 20 ns;
 
din <= '1';             --din = 1011
 
wait for 20 ns;
 
din <= '1';             --din = 10111
 
wait for 20 ns;
 
din <= '0';             --din = 101110
 
wait for 20 ns;
 
din <= '1';             --din = 1011101
 
wait for 20 ns;
 
din <= '0';             --din = 10111010
wait for 20 ns;
 
din <= '1';             --din = 101110101
wait for 20 ns;
 
din <= '0';             --din = 1011101010     --dout = 001
wait for 20 ns;
 
din <= '0';             --din = 10111010100
wait for 20 ns;
 
din <= '1';             --din = 101110101001
wait for 20 ns;
 
din <= '0';             --din = 1011101010010
wait for 20 ns;
 
din <= '0';             --din = 10111010100100
wait for 20 ns;
 
din <= '1';             --din = 101110101001001
wait for 20 ns;
 
din <= '1';             --din = 1011101010010011      dout = 010
wait for 20 ns;
 
din <= '1';
wait for 20 ns;
 
din <= '0';
end process;
 
END;



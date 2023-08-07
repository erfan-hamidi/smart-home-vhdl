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
        dout : OUT STD_LOGIC
);
END COMPONENT;


--Inputs
signal clk : std_logic := '0';
signal din : std_logic := '0';
signal rst : std_logic := '0';
 
--Outputs
signal dout : std_logic;

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
 
wait for 100 ns;
 
rst <= '0';
 
din <= '1';
 
wait for 20 ns;
 
din <= '0';
 
wait for 20 ns;
 
din <= '1';
 
wait for 20 ns;
 
din <= '1';
 
wait for 20 ns;
 
din <= '1';
 
wait for 20 ns;
 
din <= '0';
 
wait for 20 ns;
 
din <= '1';
 
wait for 20 ns;
 
din <= '0';
wait for 20 ns;
 
din <= '1';
wait for 20 ns;
 
din <= '0';
wait for 20 ns;
 
din <= '1';
wait for 20 ns;
 
din <= '1';
end process;
 
END;



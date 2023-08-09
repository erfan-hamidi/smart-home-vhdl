library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Temp_Calculator is
    Port ( basee : in STD_LOGIC_VECTOR (31 downto 0);
           ref : in STD_LOGIC_VECTOR (7 downto 0);
           adc_data: in STD_LOGIC_VECTOR (15 downto 0);
           tempc : out STD_LOGIC_VECTOR (31 downto 0)
           );
end Temp_Calculator;

architecture Structural of Temp_Calculator is

	component MultiplierNxN is
	generic(N : natural);
    port (
			A, B : in std_logic_vector(N-1 downto 0);
			Product : out std_logic_vector(2*N-1 downto 0)
		  );
	end component;


	component Adder_Subtractor is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Mode: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (31 downto 0)
          );
	end component;

	signal M8_Out : std_logic_vector (15 downto 0);
	signal M16_Out : std_logic_vector (31 downto 0);
	signal M16_Out_final : std_logic_vector (31 downto 0);
	signal tempc_final : std_logic_vector (31 downto 0);
	
	signal adc_data_sig : std_logic_vector (15 downto 0);

begin
		adc_data_sig <= ("0" & adc_data (14 downto 0));
	
		Mult8x8 : MultiplierNxN generic map(N => 8)
								port map(A => ref, B => ref, Product => M8_Out);
		
		Mult16x16 : MultiplierNxN generic map(N => 16)
								  port map(A => M8_Out, B => adc_data_sig, Product => M16_Out);
		M16_Out_final <= std_logic_vector((signed(M16_Out) / 64));		  
		
		Add_Sub : Adder_Subtractor port map (A => basee, B => M16_Out_final, Mode => adc_data(15), S => tempc_final);
	
		tempc <= tempc_final;
end Structural;
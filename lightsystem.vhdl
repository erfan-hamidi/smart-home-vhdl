LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY lightsystem IS
    PORT (
        tcode, user_light, lengthin : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        wshade, lights_num : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        light_state : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)

    );
END lightsystem;

ARCHITECTURE BEHAVIOR OF lightsystem IS


FUNCTION light_num_to_state(lights_number : IN std_logic_vector(3 DOWNTO 0)) RETURN std_logic_vector IS
    VARIABLE temp : integer;
    VARIABLE light_state : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
BEGIN

    temp := to_integer(unsigned(lights_number));

    IF(temp > 0) THEN
        FOR i IN 0 TO 15 loop
            if i < temp - 1 then
						light_state(i) := '1';
				end if;
        END LOOP;
    END IF;
    RETURN light_state;

END FUNCTION;

shared variable n,x,result : integer;


BEGIN

    process(tcode)
	
    BEGIN
        case tcode is
            when "0001" =>
                wshade <= "1111";
                lights_num <= "0000";
                light_state <= "0000000000000000";


            when "0010" =>
                wshade <= "1011";
                lights_num <= "0000";
                light_state <= "0000000000000000";


            when "0100" =>
                wshade <= "0000";
                n := to_integer(unsigned(lengthin));
                x := n * n;
                result := x / (4 * n);
                lights_num <= std_logic_vector(to_unsigned(result, lengthin'length));
                light_state <= light_num_to_state(std_logic_vector(to_unsigned(result, lengthin'length)));


            when "1000" => 
                wshade <= "0000";
                lights_num <= user_light;
                light_state <= light_num_to_state(user_light);


            when "0000" =>
                wshade <= "0000";
                lights_num <= "0000";
                light_state <= "0000000000000000";
					 
					 
				when others =>
					 wshade <= "0000";
                lights_num <= "0000";
                light_state <= "0000000000000000";
        end case;
    end process;

end BEHAVIOR;
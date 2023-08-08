LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lightsystem IS
    PORT (
        tcode, user_light, length : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        wshade, lights_num : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        light_state : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);

    );
END lightsystem;

ARCHITECTURE BEHAVIOR OF gassensor IS

FUNCTION light_num_to_state(lights_number : IN std_logic_vector(3 DOWNTO 0)) RETURN std_logic_vector IS
    VARIABLE temp : integer;
    VARIABLE light_state : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
BEGIN

    temp := to_integer(unsigned(lights_number));

    IF(temp > 0) THEN
        FOR i IN 0 TO temp-1 loop
            light_state(i) := '1';
        END LOOP;
    END IF;
    RETURN light_state;

END FUNCTION;

variable temp,x,result : integer;

BEGIN

    process(input_signal)
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
                temp := to_integer(unsigned(length))
                x := temp * temp;
                result := x / (4 * remp);
                lights_num <= std_logic_vector(to_unsigned(res, length'length));
                light_state <= light_num_to_state(std_logic_vector(to_unsigned(res, length'length));


            when "1000" => 
                wshade <= "0000";
                lights_num <= user_light;
                light_state <= light_num_to_state(user_light);


            when "0000" or others =>
                wshade <= "0000";
                lights_num <= "0000";
                light_state <= "0000000000000000";
        end case;
    end process;

end BEHAVIOR;
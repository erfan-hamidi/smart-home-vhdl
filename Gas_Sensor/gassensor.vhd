LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gassensor IS
    PORT (
        rst : IN STD_LOGIC := '0';
        clk : IN STD_LOGIC;
        din : IN STD_LOGIC := '0';
        dout : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END gassensor;

ARCHITECTURE BEHAVIOR OF gassensor IS
    TYPE type_fstate IS (state1,state2,state3,state4,state5,state6,state7,state9
    ,state8,state12,state14,state10,state11,state17,state13,state15,state18,state19
    ,state16,state21,state22,state20,state25,Finalstate23,Finalstate24,state23,Finalstate27);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clk,reg_fstate)
    BEGIN
        IF (clk='1' AND clk'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,rst,din)
    BEGIN
        IF (rst='1') THEN
            reg_fstate <= state1;
            dout <= "000";
        ELSE
            dout <= "000";
            CASE fstate IS
                WHEN state1 =>
                    IF ((din = '1')) THEN
                        reg_fstate <= state2;
                    ELSIF (NOT((din = '1'))) THEN
                        reg_fstate <= state1;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state1;
                    END IF;

                    dout <= "000";
                WHEN state2 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= state3;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state2;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state2;
                    END IF;

                    dout <= "000";
                WHEN state3 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= state5;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state4;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state3;
                    END IF;

                    dout <= "000";
                WHEN state4 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= state7;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state6;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state4;
                    END IF;

                    dout <= "000";
                WHEN state5 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= state1;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state8;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state5;
                    END IF;

                    dout <= "000";
                WHEN state6 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= state3;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state9;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state6;
                    END IF;

                    dout <= "000";
                WHEN state7 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= state5;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state10;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state7;
                    END IF;

                    dout <= "000";
                WHEN state9 =>
                    IF ((din = '1')) THEN
                        reg_fstate <= state2;
                    ELSIF (NOT((din = '1'))) THEN
                        reg_fstate <= state12;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state9;
                    END IF;

                    dout <= "000";
                WHEN state8 =>
                    IF ((din = '1')) THEN
                        reg_fstate <= state2;
                    ELSIF (NOT((din = '1'))) THEN
                        reg_fstate <= state11;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state8;
                    END IF;

                    dout <= "000";
                WHEN state12 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= state5;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state15;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state12;
                    END IF;

                    dout <= "000";
                WHEN state14 =>
                    IF ((din = '1')) THEN
                        reg_fstate <= state17;
                    ELSIF (NOT((din = '1'))) THEN
                        reg_fstate <= state1;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state14;
                    END IF;

                    dout <= "000";
                WHEN state10 =>
                    IF ((din = '1')) THEN
                        reg_fstate <= state6;
                    ELSIF (NOT((din = '1'))) THEN
                        reg_fstate <= state13;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state10;
                    END IF;

                    dout <= "000";
                WHEN state11 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= state14;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state4;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state11;
                    END IF;

                    dout <= "000";
                WHEN state17 =>
                    IF ((din = '1')) THEN
                        reg_fstate <= state2;
                    ELSIF (NOT((din = '1'))) THEN
                        reg_fstate <= state20;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state17;
                    END IF;

                    dout <= "000";
                WHEN state13 =>
                    IF ((din = '1')) THEN
                        reg_fstate <= state10;
                    ELSIF (NOT((din = '1'))) THEN
                        reg_fstate <= state16;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state13;
                    END IF;

                    dout <= "000";
                WHEN state15 =>
                    IF ((din = '1')) THEN
                        reg_fstate <= state6;
                    ELSIF (NOT((din = '1'))) THEN
                        reg_fstate <= state18;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state15;
                    END IF;

                    dout <= "000";
                WHEN state18 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= state5;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state21;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state18;
                    END IF;

                    dout <= "000";
                WHEN state19 =>
                    IF ((din = '1')) THEN
                        reg_fstate <= state2;
                    ELSIF (NOT((din = '1'))) THEN
                        reg_fstate <= state22;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state19;
                    END IF;

                    dout <= "000";
                WHEN state16 =>
                    IF ((din = '1')) THEN
                        reg_fstate <= state19;
                    ELSIF (NOT((din = '1'))) THEN
                        reg_fstate <= state1;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state16;
                    END IF;

                    dout <= "000";
                WHEN state21 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= Finalstate24;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state6;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state21;
                    END IF;

                    dout <= "000";
                WHEN state22 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= state25;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state4;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state22;
                    END IF;

                    dout <= "000";
                WHEN state20 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= Finalstate23;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state4;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state20;
                    END IF;

                    dout <= "000";
                WHEN state25 =>
                    IF ((din = '1')) THEN
                        reg_fstate <= state23;
                    ELSIF (NOT((din = '1'))) THEN
                        reg_fstate <= state1;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state25;
                    END IF;

                    dout <= "000";
                WHEN Finalstate23 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= state1;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state17;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Finalstate23;
                    END IF;

                    dout <= "100";
                WHEN Finalstate24 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= state16;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state10;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Finalstate24;
                    END IF;

                    dout <= "001";
                WHEN state23 =>
                    IF ((din = '1')) THEN
                        reg_fstate <= Finalstate27;
                    ELSIF (NOT((din = '1'))) THEN
                        reg_fstate <= state20;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= state23;
                    END IF;

                    dout <= "000";
                WHEN Finalstate27 =>
                    IF (NOT((din = '1'))) THEN
                        reg_fstate <= state3;
                    ELSIF ((din = '1')) THEN
                        reg_fstate <= state2;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Finalstate27;
                    END IF;

                    dout <= "010";
                WHEN OTHERS => 
                    dout <= "XXX";
                    report "Reach undefined state";
            END CASE;
        END IF;
    END PROCESS;
END BEHAVIOR;

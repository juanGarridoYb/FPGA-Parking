library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY SENAL IS 
    PORT (clk: IN STD_LOGIC;
            D: IN integer;  --IR_iN
            S: OUT STD_LOGIC --LED_OUT
            );
END ENTITY;

architecture ARQSENAL OF SENAL is
SIGNAL CUENTA : INTEGER RANGE 0 TO 1000 := 0;
BEGIN 
    PROCESS (clk)
        BEGIN 
            IF (rising_edge(clk)) THEN
                IF(CUENTA = 1000) THEN
                   CUENTA <= 0;
                ELSE
                    CUENTA <= CUENTA + 1;
                END IF;
                IF CUENTA < D THEN
                    S <= '1';
                ELSE
                    S<= '0';
                    END IF;
             END IF;
     END PROCESS;
END architecture;
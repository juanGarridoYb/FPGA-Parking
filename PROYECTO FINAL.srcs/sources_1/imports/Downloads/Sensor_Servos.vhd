library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY servo_SG90 IS 
    PORT (
          clk: IN STD_LOGIC;
          ENTRADA : IN std_logic;
          SALIDA : BUFFER STD_LOGIC
           );
END ENTITY;

architecture ARQSERVO OF servo_SG90 is
    SIGNAL CLK1, CLK2: STD_LOGIC;
    SIGNAL CT: INTEGER;
BEGIN 
      U0: ENTITY WORK.divisor_freq(Behavioral) GENERIC MAP (500) PORT MAP (clk, CLK1);
      U1: ENTITY WORK.divisor_freq(Behavioral) GENERIC MAP (5000000) PORT MAP (clk, CLK2);
      U2: ENTITY WORK.posicion_servoSG90(Behavioral) PORT MAP (CLK2 ,ENTRADA,  CT);
      U3: ENTITY WORK.SENAL(ARQSENAL) PORT MAP (CLK1, CT, SALIDA);
      
  
END architecture;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY servo_negro IS 
    PORT (
          clk: IN STD_LOGIC;
          senal_sensorInfrarrojos: in std_logic;
          pin_servo_negro: out STD_LOGIC
          );
END ENTITY;

architecture ARQSERVO OF servo_negro is
    SIGNAL CLK1, CLK2: STD_LOGIC;
    SIGNAL CT: INTEGER;
BEGIN 
      U0: ENTITY WORK.divisor_freq(Behavioral) GENERIC MAP (500) PORT MAP (clk, CLK1);
      U1: ENTITY WORK.divisor_freq(Behavioral) GENERIC MAP (5000000) PORT MAP (clk, CLK2);
      U2: ENTITY WORK.posicion_servo_negro(Behavioral) PORT MAP (CLK2, senal_sensorInfrarrojos, CT);
      U3: ENTITY WORK.SENAL(ARQSENAL) PORT MAP (CLK1, CT, pin_servo_negro);
      
  
END architecture;
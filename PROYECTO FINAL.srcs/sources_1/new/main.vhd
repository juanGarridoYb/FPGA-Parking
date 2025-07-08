


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity main is
  Port ( 
      IR_IN     : in  STD_LOGIC;
      IR_INentrada     : in  STD_LOGIC;  -- Señal del receptor infrarrojo
      IR_INsalida     : in  STD_LOGIC;
      clk       : in STD_LOGIC;
      LED_OUT   : inout STD_LOGIC;   -- Salida para el LED verde
      LED_OUT_NEG : out std_logic;   -- Salida para el LED rojo
      object_detectedent   : inout STD_LOGIC; -- Señal del segundo sensor
      object_detectedsal   : inout STD_LOGIC;
      SALIDA :  out STD_LOGIC;  -- Señal para el servo motor
      clr : in std_logic; 
      an       : out STD_LOGIC_VECTOR(3 downto 0);
      counter : out STD_LOGIC_VECTOR(6 downto 0)
    );
end main;

architecture Behavioral of main is

begin

A0 : entity work.IR_Sensor(Behavioral) PORT MAP(IR_IN,clk,LED_OUT, LED_OUT_NEG);
A1 : entity work.Servo_interface(Behavioral) PORT MAP (object_detectedent, clr, clk, SALIDA);
A2 : entity work.sensor_entrada(Behavioral) PORT MAP (IR_INentrada, clk, object_detectedent);
A3 : entity work.sensor_salida(Behavioral) PORT MAP (IR_INsalida, clk, object_detectedsal);
A4 : entity work.Counter7s(Behavioral) PORT MAP (clk, object_detectedsal, object_detectedent, counter, an);

end Behavioral;

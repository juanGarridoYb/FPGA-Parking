library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity IR_Sensor is
    Port (
        IR_IN     : in  STD_LOGIC;  -- Señal del receptor infrarrojo
        clk       : in STD_LOGIC;
        LED_OUT   : out STD_LOGIC;   -- Salida para el LED
        LED_OUT_NEG : out std_logic
    );
end IR_Sensor;

architecture Behavioral of IR_Sensor is
 
begin
    
    process(clk)
    begin
    if rising_edge(clk)then
        LED_OUT <= IR_IN;
        LED_OUT_NEG <= NOT IR_IN;
        end if;
     
    end process;

    
end Behavioral;

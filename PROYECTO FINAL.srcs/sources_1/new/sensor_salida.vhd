library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sensor_salida is
    Port (
        IR_INsalida     : in  STD_LOGIC;  -- Señal del receptor infrarrojo
        clk       : in STD_LOGIC;
        object_detected   : out STD_LOGIC   -- Salida para el LED
    );
end sensor_salida;

architecture Behavioral of sensor_salida is
 
begin
    
    process(clk)
    begin
    if rising_edge(clk)then
        object_detected <= IR_INsalida;
        end if;
     
    end process;

    
end Behavioral;

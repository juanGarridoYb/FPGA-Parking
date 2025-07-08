library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sensor_entrada is
    Port (
        IR_INentrada     : in  STD_LOGIC;  -- Señal del receptor infrarrojo
        clk       : in STD_LOGIC;
        object_detected   : out STD_LOGIC   -- Salida para el LED
    );
end sensor_entrada;

architecture Behavioral of sensor_entrada is
 
begin
    
    process(clk)
    begin
    if rising_edge(clk)then
        object_detected <= IR_INentrada;
        end if;
     
    end process;

    
end Behavioral;

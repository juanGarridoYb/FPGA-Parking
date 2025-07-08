library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use UNISIM.VComponents.all;

entity posicion_servoSG90 is
  Port( 
        clk: in std_logic;   
        ENTRADA : IN std_logic;     
        conteo: buffer integer
  );
end posicion_servoSG90;

architecture Behavioral of posicion_servoSG90 is

begin
    process(clk)
        begin
        if rising_edge(clk) then 
        IF ENTRADA = '0' THEN
               conteo <= 100;
        --IF ENTRADA = '1' THEN
             --   conteo <= 0;
              --  end if;      
        end if;
        END IF;
      end process;                        

end Behavioral;

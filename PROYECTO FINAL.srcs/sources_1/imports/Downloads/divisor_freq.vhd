library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.ALL;
use UNISIM.VComponents.all;

entity divisor_freq is
  Generic(
          num: integer := 25000000
   );
  Port(
       clk : in std_logic ;
       clk1 : buffer std_logic := '0'
   );
end divisor_freq;

architecture Behavioral of divisor_freq is

    signal cuenta : integer range 0 to num;

begin

    process(clk)
    begin 
        if rising_edge(clk) then
            if (cuenta = num) then
                cuenta <= 0;
                clk1 <= not clk1;
            else
                cuenta <= cuenta + 1;
            end if;
        end if;
    end process;

end Behavioral;

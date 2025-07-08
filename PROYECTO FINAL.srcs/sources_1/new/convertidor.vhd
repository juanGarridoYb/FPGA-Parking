library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sw_to_angle is
    Port ( sw : inout std_logic;
           angle : out STD_LOGIC_VECTOR(8 downto 0));
end sw_to_angle;

architecture Behavioral of sw_to_angle is
begin
    process(sw)
    begin
    case sw is
     when '1' =>    
        angle <= std_logic_vector(to_unsigned(98, 9));
     when others =>
        angle <= std_logic_vector(to_unsigned(0, 9));
     end case;
    end process;
end Behavioral;

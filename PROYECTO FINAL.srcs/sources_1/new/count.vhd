----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2024 14:22:15
-- Design Name: 
-- Module Name: count - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    Port ( clr : in STD_LOGIC;
           clk : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR(19 downto 0));
end counter;

architecture Behavioral of counter is
    signal count_reg : unsigned(19 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if clr = '1' or count_reg = 1000000 then
                count_reg <= (others => '0');
            else
                count_reg <= count_reg + 1;
            end if;
        end if;
    end process;

    count <= std_logic_vector(count_reg);

end Behavioral;
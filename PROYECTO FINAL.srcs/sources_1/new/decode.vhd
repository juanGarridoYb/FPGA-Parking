----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2024 14:21:43
-- Design Name: 
-- Module Name: decode - Behavioral
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

entity angle_decoder is
    Port ( angle : in STD_LOGIC_VECTOR(8 downto 0);
           value : out STD_LOGIC_VECTOR(19 downto 0));
end angle_decoder;

architecture Behavioral of angle_decoder is
begin
    process(angle)
        variable angle_int : integer;
        variable value_int : integer;
    begin
        -- Convert angle from std_logic_vector to integer
        angle_int := to_integer(unsigned(angle));

        -- Perform the calculation
        value_int := (944 * angle_int) + 60000;

        -- Convert the result back to std_logic_vector
        value <= std_logic_vector(to_unsigned(value_int, 20));
    end process;
end Behavioral;

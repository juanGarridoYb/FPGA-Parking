----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2024 14:15:32
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
    Port ( A : in STD_LOGIC_VECTOR(19 downto 0);
           B : in STD_LOGIC_VECTOR(19 downto 0);
           PWM : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is
begin
    process(A, B)
    begin
        -- If A is less than B, set PWM to '1'
        if unsigned(A) < unsigned(B) then
            PWM <= '1';
        -- If A is greater than or equal to B, set PWM to '0'
        else
            PWM <= '0';
        end if;
    end process;
end Behavioral;

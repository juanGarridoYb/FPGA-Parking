----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2024 14:10:19
-- Design Name: 
-- Module Name: servo - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Servo_interface is
    Port ( sw : inout STD_LOGIC;
           clr : in STD_LOGIC;
           clk : in STD_LOGIC;
           PWM : out STD_LOGIC);
end Servo_interface;

architecture Behavioral of Servo_interface is
    signal A_net : STD_LOGIC_VECTOR(19 downto 0);
    signal value_net : STD_LOGIC_VECTOR(19 downto 0);
    signal angle_net : STD_LOGIC_VECTOR(8 downto 0);
begin

    -- Convert the incoming switch value to an angle.
    convertidor: entity work.sw_to_angle
        port map (
            sw => sw,
            angle => angle_net
        );

    -- Convert the angle value to the constant value needed for the PWM.
    decode: entity work.angle_decoder
        port map (
            angle => angle_net,
            value => value_net
        );

    -- Compare the count value from the counter, with the constant value set by the switches.
    compare: entity work.comparator
        port map (
            A => A_net,
            B => value_net,
            PWM => PWM
        );

    -- Counts up to a certain value and then resets.
    -- This module creates the refresh rate of 20ms.
    counter: entity work.counter
        port map (
            clr => clr,
            clk => clk,
            count => A_net
        );

end Behavioral;


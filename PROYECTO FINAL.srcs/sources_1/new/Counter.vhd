library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Counter7s is
Generic(
          num: integer := 25000000
   );
    Port (
        clk      : in  STD_LOGIC;
        IR_INsalida    : in  STD_LOGIC;
        IR_INentrada     : in  STD_LOGIC;
        seg      : out STD_LOGIC_VECTOR(6 downto 0);
        an       : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Counter7s;

architecture Behavioral of Counter7s is
    signal count : STD_LOGIC_VECTOR(2 downto 0) := "100";
    signal ir_in_prev : STD_LOGIC := '0';
    signal ir_in_prev2 : STD_LOGIC := '0';
    signal clk1 : std_logic;
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
        
        if rising_edge(clk1) then
            ir_in_prev <= IR_INentrada;
            
            if IR_INentrada = '1' and ir_in_prev = '0' then

               if count = "000" then
                   count <= "000";
                else
                   count <= count - 1;
                end if;
            end if;

            ir_in_prev2 <= IR_INsalida;

            if IR_INsalida = '1' and ir_in_prev2 = '0' then

               if count = "100" then
                   count <= "100";
                else
                   count <= count + 1;
                end if;
            end if;

        end if;
    end process;

    process(count)
    begin
        case count is
            when "000" => seg <= "1000000"; -- 0
            when "001" => seg <= "1111001"; -- 1
            when "010" => seg <= "0100100"; -- 2
            when "011" => seg <= "0110000"; -- 3
            when "100" => seg <= "0011001"; -- 4
            when others => seg <= "0011001"; -- Blank
        end case;
    end process;
  
    an <= "1110"; -- Activate the first 7-segment display
end Behavioral;

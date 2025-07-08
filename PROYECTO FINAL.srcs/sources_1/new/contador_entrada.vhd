library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contador_entrada is
Generic(
          num: integer := 25000000
   );
    Port (
        clk      : in  STD_LOGIC;
        IR_INentrada     : in  STD_LOGIC;
        seg_entrada      : out STD_LOGIC_VECTOR(6 downto 0);
        an_entrada       : out STD_LOGIC_VECTOR(3 downto 0)
    );
end contador_entrada;

architecture Behavioral of contador_entrada is
    signal count_enter : STD_LOGIC_VECTOR(2 downto 0) := "100";
    signal ir_in_prev : STD_LOGIC := '0';
    signal clk1 : std_logic;
    signal cuenta : integer range 0 to num;
    
    
begin
    process(clk)
    begin
    count_enter <= "100";
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
                    if count_enter = "000" then
                        count_enter <= "000"; 
                    else 
                        count_enter <= count_enter - 1;
                    end if;
            end if;
        end if;
    end process;

    process(count_enter)
    begin
        case count_enter is
            when "000" => seg_entrada <= "1000000"; -- 0
            when "001" => seg_entrada <= "1111001"; -- 1
            when "010" => seg_entrada <= "0100100"; -- 2
            when "011" => seg_entrada <= "0110000"; -- 3
            when "100" => seg_entrada <= "0011001"; -- 4
            when others => seg_entrada <= "1000000"; -- Blank
        end case;
    end process;
  
    an_entrada <= "1110"; -- Activate the first 7-segment display
end Behavioral;

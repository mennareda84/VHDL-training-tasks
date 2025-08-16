library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_to_7seg is
port(
        A : in  std_logic_vector(3 downto 0);
        BCD_out : out std_logic_vector(6 downto 0)
    );
end bcd_to_7seg;

architecture Behavioral of bcd_to_7seg is
begin
BCD_out <=    "0000001" when A = "0000" else
              "1001111" when A = "0001" else
              "0010010" when A = "0010" else
              "0000110" when A = "0011" else
              "1001100" when A = "0100" else
              "0100100" when A = "0101" else
              "0100000" when A = "0110" else
              "0001111" when A = "0111" else
              "0000000" when A = "1000" else
              "0001100" when A = "1001" else
              "1111111";
end Behavioral;

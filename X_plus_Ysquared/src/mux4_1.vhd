
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_1 is
Port (A, B, C, D: in std_logic;
      Sel: in std_logic_vector(1 downto 0);
      F: out std_logic);
end mux4_1;

architecture Behavioral of mux4_1 is
begin
    process(A,B,C,D,Sel)
    begin
    case Sel is
        when "00" => F <= A;
        when "01" => F <= B;
        when "10" => F <= C;
        when "11" => F <= D;
        when others => F <= '0';
    end case;
    end process;
end Behavioral;

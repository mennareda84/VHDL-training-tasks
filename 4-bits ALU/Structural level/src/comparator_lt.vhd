library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_lt is
port (A: in std_logic_vector (3 downto 0);
      B: in std_logic_vector (3 downto 0);
      LT: out std_logic
      ); 
end comparator_lt;

architecture Structural of comparator_lt is
signal bits_equal: std_logic_vector (3 downto 0);
signal A_less_than_B: std_logic_vector (3 downto 0);
signal lt_msb, lt_bit2, lt_bit1, lt_bit0: std_logic;
begin
    bits_equal <= A xnor B;
    A_less_than_B <= not(A) and B;
    lt_msb <= A_less_than_B(3);
    lt_bit2 <= bits_equal(3) and A_less_than_B(2);
    lt_bit1 <= bits_equal(3) and bits_equal(2) and A_less_than_B(1);
    lt_bit0 <= bits_equal(3) and bits_equal(2) and bits_equal(1) and A_less_than_B(0);
    LT <= lt_msb or lt_bit2 or lt_bit1 or lt_bit0;

end Structural;

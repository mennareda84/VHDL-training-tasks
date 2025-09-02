library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_gt is
port (A: in std_logic_vector (3 downto 0);
      B: in std_logic_vector (3 downto 0);
      GT: out std_logic
      ); 
end comparator_gt;

architecture Structural of comparator_gt is
signal bits_equal: std_logic_vector (3 downto 0);
signal a_greater_than_b: std_logic_vector (3 downto 0);
signal gt_msb, gt_bit2, gt_bit1, gt_bit0: std_logic;
begin
   bits_equal <= A xnor B;
   a_greater_than_b <= A and not(B);
   gt_msb <= a_greater_than_b(3);
   gt_bit2 <= bits_equal(3) and a_greater_than_b(2);
   gt_bit1 <= bits_equal(3) and bits_equal(2) and a_greater_than_b(1);
   gt_bit0 <= bits_equal(3) and bits_equal(2) and bits_equal(1) and a_greater_than_b(0);
   GT <= gt_msb or gt_bit2 or gt_bit1 or gt_bit0;
end Structural;

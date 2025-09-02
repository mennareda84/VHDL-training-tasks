library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity full_adder is
  port(  A: in std_logic;
         B: in std_logic;
         Cin: in std_logic;
         SUM: out std_logic;
         Cout: out std_logic
);
end full_adder;

architecture Structural of full_adder is
begin
SUM <= A xor B xor Cin;
Cout <= (A and B) or (A and Cin) or (B and Cin);
end Structural;

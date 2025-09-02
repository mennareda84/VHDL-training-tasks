library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity subtractor_4bit is
port( A: in std_logic_vector (3 downto 0);
      B : in std_logic_vector(3 downto 0);
      Diff: out std_logic_vector(3 downto 0);
      Bout: out std_logic);  -- borrow out
end subtractor_4bit;

architecture Structural of subtractor_4bit is
component full_adder_4bits is
 port( A: in std_logic_vector (3 downto 0);
       B: in std_logic_vector (3 downto 0);
       Cin: in std_logic;
       Sum: out std_logic_vector (3 downto 0);
       Cout: out std_logic);
end component;
signal carry_out: std_logic;
signal carry_in: std_logic:= '1';
begin
sub: full_adder_4bits port map (A, not(B), carry_in, Diff, carry_out);
Bout <= not(carry_out);
end Structural;

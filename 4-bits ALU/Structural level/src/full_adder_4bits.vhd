library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity full_adder_4bits is
 port( A,B: in std_logic_vector (3 downto 0);
       Cin: in std_logic;
       SUM: out std_logic_vector (3 downto 0);
       Cout: out std_logic);
end full_adder_4bits;

architecture Structural of full_adder_4bits is
component full_adder is
  port(  A: in std_logic;
         B: in std_logic;
         Cin: in std_logic;
         SUM: out std_logic;
         Cout: out std_logic);
end component;
signal C: std_logic_vector (3 downto 1);
begin
FA0: full_adder port map ( A(0), B(0), Cin, SUM(0), C(1));
FA1: full_adder port map ( A(1), B(1), C(1), SUM(1), C(2));
FA2: full_adder port map ( A(2), B(2), C(2), SUM(2), C(3));
FA3: full_adder port map ( A(3), B(3), C(3), SUM(3), Cout);
end Structural;

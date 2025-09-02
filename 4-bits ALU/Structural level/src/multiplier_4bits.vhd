library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity multiplier_4bits is
port (A: in std_logic_vector (3 downto 0);
      B: in std_logic_vector (3 downto 0);
      MULT: out std_logic_vector (7 downto 0));
end multiplier_4bits;
architecture Structural of multiplier_4bits is
component full_adder_4bits is
 port( A: in std_logic_vector (3 downto 0);
       B: in std_logic_vector (3 downto 0);
       Cin: in std_logic;
       SUM: out std_logic_vector (3 downto 0);
       Cout: out std_logic);
end component;
signal FA0_first_in, FA1_first_in,FA2_first_in: std_logic_vector (3 downto 0);
signal FA0_second_in, FA1_second_in, FA2_second_in: std_logic_vector (3 downto 0);
begin
MULT(0) <= A(0) and B(0);
FA0_first_in <=  '0' & (A(3) and B(0)) & (A(2) and B(0)) & (A(1) and B(0));
FA0_second_in <= (A(3) and B(1)) & (A(2) and B(1)) & (A(1) and B(1)) & (A(0) and B(1));
FA1_second_in <= (A(3) and B(2)) & (A(2) and B(2)) & (A(1) and B(2)) & (A(0) and B(2));
FA2_second_in <= (A(3) and B(3))& (A(2) and B(3)) & (A(1) and B(3)) & (A(0) and B(3));

FA0_4bits: full_adder_4bits port map ( A => FA0_first_in, B => FA0_second_in, Cin => '0',
 SUM(0) => MULT(1), SUM(3 DOWNTO 1)=> FA1_first_in(2 DOWNTO 0), Cout => FA1_first_in(3));  
FA1_4bits: full_adder_4bits port map ( A => FA1_first_in, B => FA1_second_in, Cin => '0',
 SUM(0) => MULT(2), SUM(3 DOWNTO 1)=> FA2_first_in(2 DOWNTO 0), Cout => FA2_first_in(3));  
FA2_4bits: full_adder_4bits port map ( A => FA2_first_in, B => FA2_second_in, Cin => '0',
 SUM => MULT(6 downto 3), Cout => MULT(7));  
end Structural;

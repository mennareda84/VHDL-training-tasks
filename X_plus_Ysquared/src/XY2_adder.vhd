library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XY2_adder is
port (Y: in std_logic_vector(1 downto 0);
      X: in std_logic_vector(1 downto 0);
      Z: out std_logic_vector(3 downto 0));
end XY2_adder;

architecture Structural of XY2_adder is
component mux4_1 is
Port ( A,B,C,D: in std_logic;
      Sel: in std_logic_vector (1 downto 0);
      F: out std_logic );
end component;

component decoder4_16 is
port ( EN: in std_logic;
       A: in std_logic_vector(3 downto 0);
       D: out std_logic_vector(15 downto 0)
);
end component;

-- signals
signal selector: std_logic_vector (1 downto 0);
signal x1_and_x0: std_logic;
signal x1_xor_x0: std_logic;
signal decoder_input: std_logic_vector (3 downto 0);
signal decoder_output: std_logic_vector (15 downto 0);
signal en: std_logic := '1';

begin
selector <= Y(1) & Y(0);
x1_and_x0 <= X(1) and X(0);
x1_xor_x0 <= X(1) xor X(0);
decoder_input <= Y & X;

-- The equation: Z = X + (Y)**2
decoder: decoder4_16 port map (en, decoder_input, decoder_output);
Z(0) <= decoder_output(1) or decoder_output(3) or decoder_output(4) or decoder_output(6) or decoder_output(9) or decoder_output(11) or decoder_output(12) or decoder_output(14);
mux1: mux4_1 port map (X(1), x1_xor_x0, X(1), x1_xor_x0, selector, Z(1));
mux2: mux4_1 port map ('0', x1_and_x0, '1', x1_and_x0, selector, Z(2));
Z(3) <= Y(1) and Y(0);

end Structural;

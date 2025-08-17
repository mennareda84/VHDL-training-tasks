library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder is
Port (Y: in std_logic;
      X: in std_logic_vector(1 downto 0 );
      Z: out std_logic_vector(2 downto 0));
end adder;

architecture Structural of adder is
-- components
component mux4_1 is
Port (A, B, C, D: in std_logic;
      Sel: in std_logic_vector(1 downto 0);
      F: out std_logic);
end component;

component dec3_8 is
Port ( A : in  std_logic_vector(2 downto 0);
       EN: in std_logic;
       D : out std_logic_vector (7 downto 0));
end component;

-- signals
signal not_x0: std_logic;
signal selector: std_logic_vector(1 downto 0);
signal en : std_logic := '1';
signal decoder_out: std_logic_vector( 7 downto 0);
signal inputs: std_logic_vector(2 downto 0);

begin
selector <= Y & X(1);   
not_x0 <= not(X(0));
inputs <= Y & X(1)& X(0);

mux: mux4_1 port map (X(0), X(0), not_x0, not_x0, selector, Z(0));
decoder: dec3_8 port map (inputs, en, decoder_out);
Z(1) <= decoder_out(2) or decoder_out(3) or decoder_out(5) or decoder_out(6);
Z(2) <= X(0) and X(1) and Y;

end Structural;

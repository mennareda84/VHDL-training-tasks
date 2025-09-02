library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ALU_4bit is
  Port (Operand1, Operand2: in std_logic_vector (3 downto 0);
        Opcode: in std_logic_vector (2 downto 0);
        Result: out std_logic_vector (7 downto 0)
   );
end ALU_4bit;

architecture Structural of ALU_4bit is
-- components
component full_adder_4bits is
 port( A: in std_logic_vector (3 downto 0);
       B: in std_logic_vector (3 downto 0);
       Cin: in std_logic;
       SUM: out std_logic_vector (3 downto 0);
       Cout: out std_logic
 );
end component;
component subtractor_4bit is
port( A: in std_logic_vector (3 downto 0);
      B : in std_logic_vector(3 downto 0);
      Diff: out std_logic_vector(3 downto 0);
      Bout: out std_logic
      );
end component;
component multiplier_4bits is
port (A: in std_logic_vector (3 downto 0);
      B: in std_logic_vector (3 downto 0);
      MULT: out std_logic_vector (7 downto 0));
end component;
component comparator_gt is
port (A: in std_logic_vector (3 downto 0);
      B: in std_logic_vector (3 downto 0);
      GT: out std_logic); 
end component;
component comparator_lt is
port (A: in std_logic_vector (3 downto 0);
      B: in std_logic_vector (3 downto 0);
      LT: out std_logic); 
end component;

-- signals
signal F_adder, F_subtractor: std_logic_vector(4 downto 0);
signal F_multiplier: std_logic_vector (7 downto 0);
signal F_greater_than, F_less_than: std_logic;
signal carry_in: std_logic:= '0';
begin

Addition: full_adder_4bits port map(Operand1, Operand2, carry_in, F_adder(3 downto 0), F_adder(4));
Subtraction: subtractor_4bit port map(Operand1, Operand2, F_subtractor(3 downto 0), F_subtractor(4));
Multiplication: multiplier_4bits port map (Operand1, Operand2, F_multiplier);
greater_than: comparator_gt port map (Operand1, Operand2, F_greater_than);
less_than: comparator_lt port map (Operand1, Operand2, F_less_than);

process(Operand1, Operand2,Opcode, F_adder, F_subtractor, F_multiplier, F_greater_than, F_less_than)
begin
    case Opcode is
    when "000" => Result <= "000" & F_adder; -- addition
    when "001" => Result <= "000" & F_subtractor; -- subtraction 
    when "010" => Result <= F_multiplier;  -- multiplication
    when "011" => Result <= "0000000" &F_greater_than; -- greater_than
    when "100" => Result <= "0000000" &F_less_than; -- less_than
    when others => Result <= (others => '0'); -- no operation
    end case;
end process;
end Structural;

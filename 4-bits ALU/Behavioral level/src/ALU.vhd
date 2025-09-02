library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
port( Operand1 ,Operand2: in std_logic_vector(3 downto 0);
      Opcode: in std_logic_vector(2 downto 0);
      Result: out std_logic_vector(7 downto 0));
end ALU;

architecture Behavioral of ALU is
signal sum, diff, product: unsigned(7 downto 0);
signal gt_result, lt_result: std_logic;
begin
sum <= resize(unsigned(Operand1), 8) + resize(unsigned(Operand2), 8);
diff <= resize(unsigned(Operand1), 8) - resize(unsigned(Operand2), 8);
product <= resize(unsigned(Operand1) * unsigned(Operand2), 8);
gt_result <= '1' when unsigned(Operand1) > unsigned(Operand2) else '0';
lt_result <= '1' when unsigned(Operand1) < unsigned(Operand2) else '0';
process (Operand1, Operand2, Opcode, sum, diff, product, gt_result, lt_result)
begin
     case Opcode is
          when "000" => Result <= std_logic_vector(sum);
          when "001" => Result <= std_logic_vector(diff);
          when "010" => Result <= std_logic_vector(product);
          when "011" => Result <= (7 downto 1 => '0') & gt_result; 
          when "100" => Result <= (7 downto 1 => '0') & lt_result; 
          when others => Result <= (others => '0');
          end case;
end process;
end Behavioral;

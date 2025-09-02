library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is
  component ALU is
    Port (Operand1, Operand2: in std_logic_vector(3 downto 0);
          Opcode: in std_logic_vector(2 downto 0);
          Result: out std_logic_vector(7 downto 0)
    );
  end component;

  signal Operand1, Operand2 : std_logic_vector(3 downto 0):= "0000";
  signal Opcode : std_logic_vector(2 downto 0) := "000";
  signal Result : std_logic_vector(7 downto 0);
  
begin
  DUT: ALU port map(
    Operand1 => Operand1,
    Operand2 => Operand2,
    Opcode => Opcode,
    Result => Result
  );

  stimulus: process
  begin
    -- case 1
    Operand1 <= "1101"; -- 13
    Operand2 <= "0011"; -- 3
    for I in 0 to 7 loop
        Opcode <= std_logic_vector(to_unsigned(I, 3));
        wait for 100 ps;
    end loop;
    
     -- case 2 
    Operand1 <= "0111"; -- 7
    Operand2 <= "1000"; -- 8
    for I in 0 to 7 loop
        Opcode <= std_logic_vector(to_unsigned(I, 3));
        wait for 100 ps;
    end loop;
    
    -- case 3
    Operand1 <=  "1111"; --15
    Operand2 <=  "1111"; --15
    for I in 0 to 7 loop
        Opcode <= std_logic_vector(to_unsigned(I, 3));
        wait for 100 ps;
    end loop;
    wait;
    end process;
end Behavioral;
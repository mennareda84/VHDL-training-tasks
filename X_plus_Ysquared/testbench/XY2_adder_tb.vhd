library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity XY2_adder_tb is
end XY2_adder_tb;

architecture Behavioral of XY2_adder_tb is
component XY2_adder is
port (Y: in std_logic_vector(1 downto 0);
      X: in std_logic_vector(1 downto 0);
      Z: out std_logic_vector(3 downto 0));
end component;
-- signals
signal Y,X: std_logic_vector(1 downto 0);
signal Z: std_logic_vector(3 downto 0);
signal input: std_logic_vector(3 downto 0);
begin
uut: XY2_adder port map(Y => Y, 
                        X => X, 
                        Z => Z);
                        
stim_proc: process
           begin
                for i in 0 to 16 loop
                    input <= std_logic_vector(to_unsigned(i, 4));
                    Y <= input(3 downto 2);
                    X <= input(1 downto 0);
                    wait for 10 ns;
                end loop;
                wait;
            end process;     
end Behavioral;

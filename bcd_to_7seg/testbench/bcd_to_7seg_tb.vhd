library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bcd_to_7seg_tb is
end bcd_to_7seg_tb;

architecture Behavioral of bcd_to_7seg_tb is

component bcd_to_7seg is
port(
        A : in  std_logic_vector(3 downto 0);
        BCD_out : out std_logic_vector(6 downto 0)
    );
end component;

signal A : std_logic_vector(3 downto 0) := (others => '0');
signal BCD_out : std_logic_vector(6 downto 0);

begin
uut: bcd_to_7seg port map (
        A => A,
        BCD_out => BCD_out);
stim_proc: process
        begin
          for i in 0 to 15 loop
                  A <= std_logic_vector(to_unsigned(i, 4));
                  wait for 10 ns;
              end loop;
              wait;
        end process;
end Behavioral;

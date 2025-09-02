library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tri_state_bus_tb is
end tri_state_bus_tb;

architecture Behavioral of tri_state_bus_tb is
component tri_state_bus is
  Port (I0, I1, I2, I3: in std_logic_vector(7 downto 0);
        src_select: in std_logic_vector( 1 downto 0);
        EN: in std_logic;
        F: out std_logic_vector(7 downto 0) 
  );
end component;
signal I0, I1, I2, I3, F: std_logic_vector(7 downto 0);
signal src_select: std_logic_vector(1 downto 0):= "00";
signal EN: std_logic := '0';
begin
DUT: tri_state_bus port map(I0, I1, I2, I3, src_select, EN, F);
stimulus: process
 begin
     I0 <= "10101010";
     I1 <= "11001100";
     I2 <= "11110000";
     I3 <= "11111111";
     
     EN <= '0';
     wait for 10 ns;
     EN <= '1';
     for i in 0 to 3 loop
         src_select <= std_logic_vector(to_unsigned(i, 2));
         wait for 10 ns;
     end loop;
     
     wait;
 end process;       
end Behavioral;

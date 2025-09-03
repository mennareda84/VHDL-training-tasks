library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity even_odd_detection_tb is
end even_odd_detection_tb;

architecture Behavioral of even_odd_detection_tb is
component even_odd_detection is
  Port (clk, reset: in std_logic;
        x: in std_logic;
        y: out std_logic );
end component;
signal clk      : std_logic := '0';
signal reset    : std_logic := '1';
signal x   : std_logic := '0';
signal y    : std_logic;
constant clk_period : time := 10 ns;
begin
DUT: even_odd_detection port map (clk, reset, x, y);
clk_process: process
   begin
       clk <= '0';
       wait for clk_period/2;
       clk <= '1';
       wait for clk_period/2;
   end process;
stim_proc: process
   variable test_pattern : std_logic_vector(15 downto 0) := "0110100110011010"; 
   begin
       reset <= '1';
       wait for clk_period*2;
       reset <= '0';
       
       for i in test_pattern'range loop
           x <= test_pattern(i);
           wait for clk_period;
       end loop;   
       wait;
end process;
end Behavioral;

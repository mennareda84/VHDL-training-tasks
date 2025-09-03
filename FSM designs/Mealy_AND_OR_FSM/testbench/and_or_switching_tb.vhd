library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_or_switching_tb is
end and_or_switching_tb;

architecture Behavioral of and_or_switching_tb is
component and_or_switching is
  Port (clk, reset: in std_logic;
        A,B: in std_logic;
        Z: out std_logic);
end component;
signal clk      : std_logic := '0';
signal reset    : std_logic := '1';
signal A   : std_logic := '0';
signal B   : std_logic := '0';
signal Z    : std_logic;
constant clk_period : time := 10 ns;
begin
DUT: and_or_switching port map(clk, reset, A, B, Z);
clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
stim_proc: process
      begin
          reset <= '1';
          wait for clk_period;
          reset <= '0';
          
          A <= '0'; B <= '0'; wait for clk_period;  
          A <= '0'; B <= '1'; wait for clk_period;  
          A <= '1'; B <= '0'; wait for clk_period;  
          A <= '1'; B <= '1'; wait for clk_period;  
      wait;
      end process;
end Behavioral;

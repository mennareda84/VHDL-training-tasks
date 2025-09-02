library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_tb is
end counter_tb;

architecture Behavioral of counter_tb is
    component counter is
        Port ( clk: in std_logic;
               reset: in std_logic;
               counter: out std_logic_vector(3 downto 0) );
    end component;
    
    signal clk, reset: std_logic := '0';
    signal count: std_logic_vector(3 downto 0);
    constant clk_period : time := 10 ns;
begin
    DUT: counter port map (clk, reset, count);
    
    clk_process: process
    begin
       loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;
    
    Stimulus: process
    begin
        -- Reset at start
        reset <= '1';
        wait for clk_period;
        reset <= '0';
        -- let counter run
        wait for 8 * clk_period;
        -- reset again
        reset <= '1';
        wait for clk_period;
        reset <= '0';
        wait;
    end process;
end Behavioral;
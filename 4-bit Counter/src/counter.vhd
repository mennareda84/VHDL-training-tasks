library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    Port ( clk: in std_logic;
           reset: in std_logic;
           counter: out std_logic_vector(3 downto 0) );
end counter;

architecture Behavioral of counter is
    signal counter_reg: unsigned(3 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter_reg <= (others => '0');
        elsif rising_edge(clk) then
                counter_reg <= counter_reg + 1;
        end if;
    end process;
    
    counter <= std_logic_vector(counter_reg);
end Behavioral;
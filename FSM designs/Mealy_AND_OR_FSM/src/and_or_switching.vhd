library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_or_switching is
  Port (clk, reset: in std_logic;
        A,B: in std_logic;
        Z: out std_logic);
end and_or_switching;

architecture Behavioral of and_or_switching is
type state_type is (S0, S1, S2, S3);
signal current_state: state_type:= S0;
signal next_state : state_type;
signal input: std_logic_vector(1 downto 0);
begin
input <= A & B;
process(clk, reset)
begin
     if reset = '1' then
         current_state <= S0;  
     elsif rising_edge(clk) then
         current_state <= next_state;
     end if;
 end process;
 process(current_state, input)
 begin
    case (current_state) is
    when S0 =>
        if input = "00" then
            next_state <= S0;
            Z <= '0';
        elsif input = "01" then
            next_state <= S1;
            Z <= '0';
        elsif input = "10" then
            next_state <= S2;
            Z <= '0';
        elsif input = "11" then
            next_state <= S3;
            Z <= '1';
        end if;
    when S1 =>
            if input = "00" then
                next_state <= S0;
                Z <= '0';
            elsif input = "01" then
                next_state <= S1;
                Z <= '1';
            elsif input = "10" then
                next_state <= S2;
                Z <= '1';
            elsif input = "11" then
                next_state <= S3;
                Z <= '1';
            end if;
    when S2 =>
            if input = "00" then
               next_state <= S2;
               Z <= '0';
            elsif input = "01" then
               next_state <= S3;
               Z <= '1';
            elsif input = "10" then
               next_state <= S0;
               Z <= '0';
            elsif input = "11" then
               next_state <= S1;
               Z <= '0';
            end if;
    when S3 =>
            if input = "00" then
               next_state <= S2;
               Z <= '1';
            elsif input = "01" then
               next_state <= S3;
               Z <= '1';
            elsif input = "10" then
               next_state <= S0;
               Z <= '0';
            elsif input = "11" then
               next_state <= S1;
               Z <= '1';
            end if;            
    end case;
end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity even_odd_detection is
  Port (clk, reset: in std_logic;
        x: in std_logic;
        y: out std_logic );
end even_odd_detection;

architecture Behavioral of even_odd_detection is
type state_type is (S0, S1, S2, S3);
signal current_state, next_state : state_type;
begin
  process(clk, reset)
  begin
      if reset = '1' then
          current_state <= S0;  
      elsif rising_edge(clk) then
          current_state <= next_state;
      end if;
  end process;
process(current_state, x)
  begin
      case current_state is
       when S0 =>
            if x = '0' then
               next_state <= S1;  
            else
               next_state <= S2;  
            end if;
     
       when S1 =>
            if x = '0' then
               next_state <= S0;  
            else
               next_state <= S3;  
            end if;
                     
       when S2 =>
            if x = '0' then
               next_state <= S3;  
            else
               next_state <= S0;  
            end if;
                     
      when S3 =>
           if x = '0' then
              next_state <= S2;  
           else
              next_state <= S1;  
           end if;
      end case;
  end process;
y <= '1' when (current_state = S1) else '0';
end Behavioral;

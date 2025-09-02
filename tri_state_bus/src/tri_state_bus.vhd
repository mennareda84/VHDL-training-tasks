library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_bus is
  Port (I0, I1, I2, I3: in std_logic_vector(7 downto 0);
        src_select: in std_logic_vector( 1 downto 0);
        EN: in std_logic;
        F: out std_logic_vector(7 downto 0) 
  );
end tri_state_bus;
architecture Behavioral of tri_state_bus is
signal Dec_out: std_logic_vector(3 downto 0);
signal buffer_out: std_logic_vector(7 downto 0);
begin
process(I0, I1, I2, I3, src_select, EN)
begin
    if (EN = '1') then
        case src_select is
            when "00" => Dec_out <= "0001";
            when "01" => Dec_out <= "0010";
            when "10" => Dec_out <= "0100";
            when "11" => Dec_out <= "1000";
            when others => Dec_out <= (others => '0');
        end case;
    else 
        Dec_out <= (others => '0');
    end if;
end process;
with Dec_out select
  buffer_out <= I0 when "0001",
                I1 when "0010",
                I2 when "0100",
                I3 when "1000",
                (others => 'Z') when others;
  F <= buffer_out;
end Behavioral;

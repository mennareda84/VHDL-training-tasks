library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decoder4_16 is
port ( EN: in std_logic;
       A: in std_logic_vector(3 downto 0);
       D: out std_logic_vector(15 downto 0)
);
end decoder4_16;

architecture Behavioral of decoder4_16 is
begin
    process(EN, A)
    begin
        D <= (others => '0');  
        if EN = '1' then
            case A is
                when "0000" => D(0) <= '1';
                when "0001" => D(1) <= '1'; 
                when "0010" => D(2) <= '1';
                when "0011" => D(3) <= '1'; 
                when "0100" => D(4) <= '1';
                when "0101" => D(5) <= '1';
                when "0110" => D(6) <= '1';
                when "0111" => D(7) <= '1';
                when "1000" => D(8) <= '1';
                when "1001" => D(9) <= '1';
                when "1010" => D(10) <= '1';
                when "1011" => D(11) <= '1';
                when "1100" => D(12) <= '1';
                when "1101" => D(13) <= '1';
                when "1110" => D(14) <= '1';
                when "1111" => D(15) <= '1';
                when others => D <= (others => '0');
            end case;
        end if;
    end process;
end Behavioral;

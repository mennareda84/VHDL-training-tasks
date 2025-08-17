library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dec3_8 is
Port ( A : in  std_logic_vector(2 downto 0);
       EN: in std_logic;
       D : out std_logic_vector (7 downto 0));
end dec3_8;

architecture Behavioral of dec3_8 is

begin
 process (EN, A)
 begin
     D <= (others => '0');  
     if EN = '1' then  
         case A is
             when "000" => D(0) <= '1';
             when "001" => D(1) <= '1';
             when "010" => D(2) <= '1';
             when "011" => D(3) <= '1';
             when "100" => D(4) <= '1';
             when "101" => D(5) <= '1';
             when "110" => D(6) <= '1';
             when "111" => D(7) <= '1';
             when others => D <= (others => '0');  
         end case;
     end if;
 end process;

end Behavioral;

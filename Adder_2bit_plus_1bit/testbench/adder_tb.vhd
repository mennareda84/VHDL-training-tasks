library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder_tb is
end adder_tb;

architecture Behavioral of adder_tb is
component adder is
Port (Y: in std_logic;
      X: in std_logic_vector(1 downto 0 );
      Z: out std_logic_vector(2 downto 0));
end component;

signal Y : std_logic;
signal X : std_logic_vector(1 downto 0);
signal Z : std_logic_vector(2 downto 0); 
signal inputs : std_logic_vector(2 downto 0);

begin
uut: adder port map(Y => Y, 
                    X => X,
                    Z => Z);
stim_proc: process
           begin
                for i in 0 to 8 loop  
                    inputs <= std_logic_vector(to_unsigned(i, 3));  
                    Y <= inputs(2);
                    X <= inputs(1 downto 0);
                    wait for 10 ns;
                end loop;  
                wait; 
           end process;
end Behavioral;

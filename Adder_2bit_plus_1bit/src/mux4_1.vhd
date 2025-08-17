----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/16/2025 10:02:56 PM
-- Design Name: 
-- Module Name: mux4_1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux4_1 is
Port (A, B, C, D: in std_logic;
      Sel: in std_logic_vector(1 downto 0);
      F: out std_logic);
end mux4_1;

architecture Behavioral of mux4_1 is
begin
    process(A,B,C,D,Sel)
    begin
    case Sel is
        when "00" => F <= A;
        when "01" => F <= B;
        when "10" => F <= C;
        when "11" => F <= D;
        when others => F <= '0';
    end case;
    end process;
end Behavioral;

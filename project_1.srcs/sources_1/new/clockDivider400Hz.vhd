----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2017 04:04:57
-- Design Name: 
-- Module Name: clockDivider400Hz - Behavioral
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

entity ClockDivider400Hz is
    Port ( clockin : in STD_LOGIC;
           clk400Hz : out STD_LOGIC);
end ClockDivider400Hz;

architecture Behavioral of ClockDivider400Hz is
signal count : integer range 0 to 249999 := 0;
signal temporary : std_logic := '0';
begin
process(clockin)
begin
if rising_edge(clockin) then
    if(count = 249999) then
        count <= 0;
        temporary <= not temporary;
    else
        count <= count + 1;
    end if;
end if;
end process;
clk400Hz <= temporary;            


end Behavioral;

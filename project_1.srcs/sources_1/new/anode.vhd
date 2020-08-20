----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2017 23:43:06
-- Design Name: 
-- Module Name: anode - Behavioral
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

entity anode is
    Port ( clockd : in STD_LOGIC;
           an1 : in STD_LOGIC_VECTOR (6 downto 0);
           an2 : in STD_LOGIC_VECTOR (6 downto 0);
           an3 : in STD_LOGIC_VECTOR (6 downto 0);
           an4 : in STD_LOGIC_VECTOR (6 downto 0);
           anout : out STD_LOGIC_VECTOR (6 downto 0);
           outlight : out STD_LOGIC_VECTOR (3 downto 0));
end anode;

architecture Behavioral of anode is

signal counter : integer range 0 to 3 := 0;
signal anoutsignal : STD_LOGIC_VECTOR(0 to 6) := "1111111";
signal outlightsignal : STD_LOGIC_VECTOR(0 to 3) := "1111"; 

begin
process(clockd)
begin
    if( rising_edge(clockd) ) then
        if( counter = 0 ) then
            outlightsignal <= "1110";
            anoutsignal <= an1;
            counter <= counter + 1;
        elsif( counter = 1 ) then
            outlightsignal <= "1101";
            anoutsignal <= an2;
            counter <= counter + 1;
        elsif( counter = 2 ) then
            outlightsignal <= "1011";
            anoutsignal <= an3;
            counter <= counter + 1;
        elsif( counter = 3 ) then
            outlightsignal <= "0111";
            anoutsignal <= an4;
            counter <= counter + 1;
        end if;
    end if;
end process;
anout <= anoutsignal;
outlight <= outlightsignal;
end Behavioral;

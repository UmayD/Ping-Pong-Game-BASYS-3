----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2017 23:31:47
-- Design Name: 
-- Module Name: ssdclck - Behavioral
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

entity ssdclck is
    Port ( clckin : in STD_LOGIC;
           clckout : out STD_LOGIC);
end ssdclck;

architecture Behavioral of ssdclck is

signal temporal : STD_LOGIC := '0';
signal counter : integer range 0 to 249999 := 0;

begin
process(clckin)
begin
    if( rising_edge(clckin) ) then
        if( counter = 249999 ) then
            temporal <= not temporal;
            counter <= 0;
        else
            counter <= counter + 1;
        end if;
    end if;
end process;
clckout <= temporal;
end Behavioral;

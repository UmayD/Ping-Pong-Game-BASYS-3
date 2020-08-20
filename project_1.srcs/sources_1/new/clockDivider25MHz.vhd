----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2017 04:39:09
-- Design Name: 
-- Module Name: clockDivider25MHz - Behavioral
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

entity clockDivider25MHz is
Port ( clockin : in STD_LOGIC;
clk25MHz : out STD_LOGIC
);
end clockDivider25MHz;

architecture Behavioral of clockDivider25MHz is
signal temporal : STD_LOGIC := '0';
signal counter: integer := 0;

begin
process (clockin)
begin
if (rising_edge (clockin)) then
    if (counter = 1) then
        temporal <= not(temporal);
        counter <= 0;
    else    
        counter <= counter + 1;
    end if;
end if;
end process;

clk25MHz <= temporal;


end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2017 18:37:42
-- Design Name: 
-- Module Name: clockDivider - Behavioral
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

entity clockDivider is
Port ( clockin : in STD_LOGIC;
       vgaclock : out STD_LOGIC);
end clockDivider;

architecture Behavioral of clockDivider is
signal temporal : STD_LOGIC := '0';
signal counter : integer := 0;

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

vgaclock <= temporal;

end Behavioral;

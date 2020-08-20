----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2017 05:26:02
-- Design Name: 
-- Module Name: levelCreation - Behavioral
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

entity levelCreation is
    Port(score1: in integer;
         counter: out integer);
end levelCreation;

architecture Behavioral of levelCreation is
signal tcounter: integer := 80000;
begin
tcounter <= 80000 when score1 >= 0 and score1 < 5 else
            50000 when score1 > 4 and score1 < 10 else
            30000 when score1 > 9 and score1 < 20 else
            20000;
            
counter <= tcounter;
end Behavioral;

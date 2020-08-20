----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2017 03:18:37
-- Design Name: 
-- Module Name: scorecond - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity scorecond is
  Port ( clockin: in STD_LOGIC;
         ballX : in integer;
         ballY: in integer;
         barX: in integer;
         barY : in integer;
         check1: out std_logic;
         check2: out std_logic
        );
end scorecond;

architecture Behavioral of scorecond is

signal ballMoveClock : integer := 0;
signal ballClock : STD_LOGIC := '0';
signal tempcheck1, tempcheck2 : std_logic;
begin

tempcheck1 <= '1' when ( ballX >= (barX -3) and (ballY < barY + 25) and (ballY > barY - 25)) else
            '0';
check1 <= tempcheck1;

tempcheck2 <= '1' when( ballX >= (barX -3) and ((ballY > barY + 25) or (ballY < barY - 25))) else
            '0';
check2 <= tempcheck2;
        
end Behavioral;

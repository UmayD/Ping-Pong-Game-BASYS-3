----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2017 23:52:47
-- Design Name: 
-- Module Name: ssd - Behavioral
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

entity ssd is
    Port ( clckd : in STD_LOGIC;
           score: in integer;
           ss1 : out STD_LOGIC_VECTOR (6 downto 0);
           ss2 : out STD_LOGIC_VECTOR (6 downto 0);
           ss3 : out STD_LOGIC_VECTOR (6 downto 0);
           ss4 : out STD_LOGIC_VECTOR (6 downto 0));
end ssd;

architecture Behavioral of ssd is

signal score1 : integer range 0 to 100 := 0;
signal logicss1 : STD_LOGIC_VECTOR(6 downto 0) := "1111111"; 
signal logicss2 : STD_LOGIC_VECTOR(6 downto 0) := "1111111";
signal logicss3 : STD_LOGIC_VECTOR(6 downto 0) := "1111111";
signal logicss4 : STD_LOGIC_VECTOR(6 downto 0) := "1111111";

--signal score2: integer range 0 to 100 := 0;

begin
process(clckd)
begin
    if( rising_edge(clckd) ) then
        if( score = 0) then
            logicss1 <= "1000000";
            logicss2 <= "1000000";
            logicss3 <= "1000000";
            logicss4 <= "1000000";
            score1 <= score1 + 1;
        elsif( score = 1 ) then
            logicss1 <= "1000000";
            logicss2 <= "1011100";
            logicss3 <= "1000000";
            logicss4 <= "1011100";
            score1 <= score1 + 1;
        elsif( score = 2 ) then
            logicss1 <= "1000000";
            logicss2 <= "1000000";
            logicss3 <= "1001100";
            logicss4 <= "1001100"; 
            score1 <= score1 + 1;
        end if;
    end if;
end process;
ss1 <= logicss1;
ss2 <= logicss2;
ss3 <= logicss3;
ss4 <= logicss4;
end Behavioral;

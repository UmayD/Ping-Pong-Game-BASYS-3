----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2017 03:50:02
-- Design Name: 
-- Module Name: ssgModule - Behavioral
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


entity ssgModule is
    Port ( clockin : in STD_LOGIC;
           check1, check2 : in STD_LOGIC;
           resetSwitch: in std_logic;
           a1 : out STD_LOGIC_VECTOR (3 downto 0);
           a2 : out STD_LOGIC_VECTOR (3 downto 0);
           a3 : out std_logic_vector(3 downto 0);
           a4 : out std_logic_vector (3 downto 0);
           score1, score2 : out integer);
end ssgModule;

architecture Behavioral of ssgModule is

signal a1tmp : std_logic_vector := "0000";
signal a2tmp : std_logic_vector := "0000";
signal a3tmp : std_logic_vector := "0000";
signal a4tmp : std_logic_vector := "0000";
signal xcheck1, xcheck2 : std_logic;
signal tscore1, tscore2 : integer := 0;

begin
process(clockin)
begin
if rising_edge(clockin) then
    if(xcheck1 = '0' and check1 = '1') then
        tscore1 <= tscore1 + 1;
        if(a1tmp /= "1001") then
            a1tmp <= a1tmp + "0001";
        else
            a1tmp <= "0000";
            if(a2tmp /= "1001") then
                a2tmp <= a2tmp + "0001";
            else
                a2tmp <= "0000";
            end if;
        end if;
    end if;
    xcheck1 <= check1;
    if(xcheck2 = '0' and check2 = '1') then
            tscore2 <= tscore2 + 1;
            if(a3tmp /= "1001") then
                a3tmp <= a3tmp + "0001";
            else
                a3tmp <= "0000";
                if(a4tmp /= "1001") then
                    a4tmp <= a4tmp + "0001";
                else
                    a4tmp <= "0000";
                end if;
            end if;
    end if;
    xcheck2 <= check2;
    if(resetSwitch= '1') then
            tscore1 <= 0;
            tscore2 <= 0;
            a1tmp <= "0000";
            a2tmp <= "0000";
            a3tmp <= "0000";
            a4tmp <= "0000";
        end if;
end if;
end process;

score1 <= tscore1;
score2 <= tscore2;
a1 <= a1tmp;
a2 <= a2tmp;
a3 <= a3tmp;
a4 <= a4tmp;
end Behavioral;

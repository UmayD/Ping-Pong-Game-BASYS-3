----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2017 03:58:02
-- Design Name: 
-- Module Name: anodeSsg - Behavioral
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

entity anodeSsg is
    Port ( clk400Hz : in std_logic;
           a1 : in STD_LOGIC_VECTOR (3 downto 0);
           a2 : in STD_LOGIC_VECTOR (3 downto 0);
           a3 : in STD_LOGIC_VECTOR (3 downto 0);
           a4 : in STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end anodeSsg;

architecture Behavioral of anodeSsg is
signal x : integer range 0 to 3 := 0;
signal anode : std_logic_vector(3 downto 0) := "0000";
signal segment : std_logic_vector(6 downto 0) := "0000000";
begin
process(clk400Hz)
begin
if rising_edge(clk400Hz) then
    if(x = 0) then
        anode <= "1110";
        if(a1 = "0000") then
            segment <= "1000000";
        elsif(a1 = "0001") then
            segment <= "1111001";
        elsif(a1 = "0010") then
            segment <= "0100100";
        elsif(a1 = "0011") then
            segment <= "0110000";
        elsif(a1 = "0100") then
            segment <= "0011001";  
        elsif(a1 = "0101") then
            segment <= "0010010";
        elsif(a1 = "0110") then
            segment <= "0000010";
        elsif(a1 = "0111") then
            segment <= "1111000";
        elsif(a1 = "1000") then
            segment <= "0000000";
        elsif(a1 = "1001") then
            segment <= "0011000";
        end if;                                                           
    elsif(x = 1) then
        anode <= "1101";
       if(a2 = "0000") then
            segment <= "1000000";
        elsif(a2 = "0001") then
            segment <= "1111001";
        elsif(a2= "0010") then
            segment <= "0100100";
        elsif(a2 = "0011") then
            segment <= "0110000";
        elsif(a2 = "0100") then
            segment <= "0011001";  
        elsif(a2 = "0101") then
            segment <= "0010010";
        elsif(a2 = "0110") then
            segment <= "0000010";
        elsif(a2 = "0111") then
            segment <= "1111000";
        elsif(a2 = "1000") then
            segment <= "0000000";
        elsif(a2 = "1001") then
            segment <= "0011000";
        end if;     
    elsif(x = 2) then
        anode <= "1011";
        if(a3 = "0000") then
            segment <= "1000000";
        elsif(a3 = "0001") then
            segment <= "1111001";
        elsif(a3 = "0010") then
            segment <= "0100100";
        elsif(a3 = "0011") then
            segment <= "0110000";
        elsif(a3 = "0100") then
            segment <= "0011001";  
        elsif(a3 = "0101") then
            segment <= "0010010";
        elsif(a3 = "0110") then
            segment <= "0000010";
        elsif(a3 = "0111") then
            segment <= "1111000";
        elsif(a3 = "1000") then
            segment <= "0000000";
        elsif(a3 = "1001") then
            segment <= "0011000";
        end if;      
    elsif(x = 3) then 
        anode <= "0111";
        if(a4 = "0000") then
            segment <= "1000000";
        elsif(a4 = "0001") then
            segment <= "1111001";
        elsif(a4 = "0010") then
            segment <= "0100100";
        elsif(a4 = "0011") then
            segment <= "0110000";
        elsif(a4 = "0100") then
            segment <= "0011001";  
        elsif(a4 = "0101") then
            segment <= "0010010";
        elsif(a4 = "0110") then
            segment <= "0000010";
        elsif(a4 = "0111") then
            segment <= "1111000";
        elsif(a4 = "1000") then
            segment <= "0000000";
        elsif(a4 = "1001") then
            segment <= "0011000";
        end if;         
    end if;
    if(x = 3) then
        x <= 0;
    else
        x <= x + 1;
    end if;
end if;
end process;
seg <= segment;
an <= anode;
end Behavioral;

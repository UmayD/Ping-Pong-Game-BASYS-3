----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2017 18:36:47
-- Design Name: 
-- Module Name: vga - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topModule is

Port(clockin: in STD_LOGIC;
     resetSwitch: in std_logic;
     center: in STD_LOGIC;
     left: in STD_LOGIC;
     up: in STD_LOGIC;
     right: in STD_LOGIC;
     down: in STD_LOGIC;
     horizon: out STD_LOGIC;
     vertical: out STD_LOGIC;
     red: out STD_LOGIC_VECTOR(3 downto 0);
     blue: out STD_LOGIC_VECTOR(3 downto 0);
     green: out STD_LOGIC_VECTOR(3 downto 0);
     seg : out STD_LOGIC_VECTOR (6 downto 0);
     an : out STD_LOGIC_VECTOR (3 downto 0));

end topModule;

architecture Behavioral of topModule is

signal clk400Hz: STD_LOGIC := '0';
signal clckdsign : STD_LOGIC := '0';
signal clockdsign : STD_LOGIC := '0';
signal a1, a2, a3, a4 : std_logic_vector(3 downto 0);
signal check1, check2: std_logic;
signal ballX, ballY, barX, barY : integer := 0;
signal score1, score2: integer := 0;
signal clk25MHz: std_logic;
signal counter : integer := 0;
signal ballMoveClock : integer := 0;

component graph is 
Port (  clk25MHz: in STD_LOGIC;
        ballMoveClock: in integer;
        center: in STD_LOGIC;
        left: in STD_LOGIC;
        up: in STD_LOGIC;
        right: in STD_LOGIC;
        down: in STD_LOGIC;
        horizon: out STD_LOGIC; 
        vertical: out STD_LOGIC;
        red: out STD_LOGIC_VECTOR(3 downto 0);
        green: out STD_LOGIC_VECTOR(3 downto 0);
        blue: out STD_LOGIC_VECTOR(3 downto 0);
        ballX, ballY, barX, barY: out integer);

end component graph;

component clockDivider25MHz is
Port ( clockin : in STD_LOGIC;
clk25MHz : out STD_LOGIC
);
end component;

component scorecond is
Port ( clockin: in STD_LOGIC;
         ballX : in integer;
         ballY: in integer;
         barX: in integer;
         barY : in integer;
         check1: out std_logic;
         check2: out std_logic);
end component scorecond;

component anodeSsg is
Port ( clk400Hz : in std_logic;
           a1 : in STD_LOGIC_VECTOR (3 downto 0);
           a2 : in STD_LOGIC_VECTOR (3 downto 0);
           a3 : in STD_LOGIC_VECTOR (3 downto 0);
           a4 : in STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end component anodeSsg;

component ssgModule is
Port ( clockin : in STD_LOGIC;
           check1, check2 : in STD_LOGIC;
           resetSwitch: in std_logic;
           a1 : out STD_LOGIC_VECTOR (3 downto 0);
           a2 : out STD_LOGIC_VECTOR (3 downto 0);
           a3 : out std_logic_vector(3 downto 0);
           a4 : out std_logic_vector (3 downto 0);
           score1, score2 : out integer);
end component ssgModule;

component clockDivider400Hz is
Port ( clockin : in STD_LOGIC;
       clk400Hz : out STD_LOGIC);
end component clockDivider400Hz;

component levelCreation is
Port(score1: in integer;
     counter: out integer);
end component levelCreation;

begin

U1 : graph Port Map (clk25MHz, counter, center, left, up, right, down, horizon, vertical, red, green, blue,ballX, ballY, barX, barY);
U2 : scorecond Port Map (clockin, ballX, ballY, barX, barY, check1, check2);
U3 : ssgModule Port Map(clockin, check1, check2, resetSwitch, a1, a2, a3, a4, score1, score2);
U4 : clockDivider400Hz Port Map(clockin, clk400Hz);
U5 : anodeSsg Port Map(clk400Hz, a1, a2, a3, a4, an, seg);
U6 : clockDivider25MHz Port Map(clockin, clk25MHz);
U7 : levelCreation Port Map(score1, counter);

end Behavioral;

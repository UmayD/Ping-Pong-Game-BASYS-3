----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2017 18:24:30
-- Design Name: 
-- Module Name: graph - Behavioral
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

entity graph is
Port(   clk25MHz: in STD_LOGIC;
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

end graph;

architecture Behavioral of graph is

signal pixelx: integer range 0 to 800;
signal pixely: integer range 0 to 525;

signal ballClock : STD_LOGIC := '0';

signal tballX : integer range -100 to 799 := 320;
signal tballY : integer range -100 to 520 := 240;
signal ballmoveX : integer range -100 to 100 := 1;
signal ballmoveY : integer range -100 to 100 := 1;

signal barMove : integer range 0 to 1000000 := 0;
signal barClock : STD_LOGIC := '0';
signal tballMoveClock: integer := 0;

signal tbarX : integer range -100 to 799 := 789;
signal tbarY : integer range -100 to 520 := 200;
signal barmoveX : integer range -100 to 100 := 1;
signal barmoveY : integer range -100 to 100 := 1;

signal bar2X : integer range -100 to 799 := 200;
signal bar2Y : integer range - 100 to 520 := 200;
signal bar2moveY : integer range -100 to 100 := 1;

signal counter : integer range 0 to 100 := 0;

begin

--vga
process( clk25MHz)
begin
if( rising_edge( clk25MHz ) ) then
    
    --bar1 code 
    if( ( pixelx > tbarX - 3 and pixelx < tbarX + 3 ) and ( pixely > tbarY - 25 and pixely < tbarY + 25 ) ) then
        red <= "1111";
        green <= "1111";
        blue <= "1111";
    --bar2 code
    elsif( (pixelx > bar2X - 3 and pixelx < bar2X + 3 ) and ( pixely > bar2Y - 25 and pixely < bar2Y + 25 )) then
        red <= "1111";
        green <= "1111";
        blue <= "1111";
     
     
     elsif ( (pixelx >= tballX - 2 and pixelx <= tballX + 2) and (pixely >= tballY - 2 and pixely <= tballY + 2) ) then
        red <= "1111";
        green <= "1111";
        blue <= "1111";
     
     --middle line   
     elsif( pixelx > 469 and pixelx <= 470 ) then
        red <= "1111";
        green <= "1111";
        blue <= "1111";
     
     --score C-U
     elsif( (pixelx <= 445 and pixelx > 442) and (pixely > 50 and pixely <= 80) ) then
        red <= "1111";
        green <= "1111";
        blue <= "1111";
     elsif( (pixelx <= 460 and pixelx > 445) and (pixely > 50 and pixely <= 55 ) ) then
        red <= "1111";
        green <= "1111";
        blue <= "1111";
     elsif( (pixelx <= 460 and pixelx > 445) and (pixely > 75 and pixely <= 80) ) then
        red <= "1111";
        green <= "1111";
        blue <= "1111";
        
     elsif( (pixelx <= 482 and pixelx > 479) and (pixely > 50 and pixely <= 80) ) then
        red <= "1111";
        green <= "1111";
        blue <= "1111";
     elsif( (pixelx <= 497 and pixelx > 494) and (pixely > 50 and pixely <= 80) ) then
        red <= "1111";
        green <= "1111";
        blue <= "1111";
     elsif( (pixelx <= 497 and pixelx > 479) and (pixely > 75 and pixely <= 80) ) then
        red <= "1111";
        green <= "1111";
        blue <= "1111";
     --C-U ends
                
     else
        red <= "0000";
        green <= "0000";
        blue <= "0000";
     end if;
     
    --horizontal pixel
    if(pixelx < 800) then
        pixelx <= pixelx +1;
    else
        pixelx <= 0;
    
    --vertical pixel
    if(pixely < 525) then
        pixely <= pixely + 1;
    else
        pixely <= 0;
    end if; 
    end if;
    
    --Synchronization part begins
    if(pixelx > 16 and pixelx < 112 ) then
        horizon <= '0';
    else
        horizon <= '1'; 
    end if;
    
    if(pixely > 0 and pixely < 12) then
        vertical <= '0';
    else
        vertical <= '1';
    end if;
    
    if(( pixelx > 0 and pixelx < 160) or ( pixely > 0 and pixely < 45)) then
        red <= "0000";
        green <= "0000";
        blue <= "0000";
    end if;
    --Synchronization part ends
    
    --ball clock 
	tballMoveClock <= tballMoveClock + 1;	
	if (tballMoveClock > ballMoveClock) then
	   ballClock <= not ballClock;
	   tballMoveClock <= 0;
	end if;
	
	--bar clock 
     barMove <= barMove + 1;    
     if (barMove = 25000) then
         barClock <= not barClock;
         barMove <= 0;
     end if;
	
end if;
end process;

--ball movement code
process(ballClock)
begin 
	if( rising_edge( ballClock ) ) then
	  tballX <= tballX + ballmoveX;
	  tballY <= tballY + ballmoveY;
	  
	  --if statements for bouncing from the walls
	  if( tballX >= 798 ) then
	      ballmoveX <= -1;
	  
	  elsif( tballX < 160 ) then
	      ballmoveX <= 1;
	      
	  elsif( tballY >= 500 ) then
          ballmoveY <= -1;
                
      elsif( tballY < 50 ) then
          ballmoveY <= 1;
          
      elsif( tballX + 2 > tbarX - 3 and tballY + 2 > tbarY - 25 and tballY - 2 < tbarY + 25 ) then
          ballmoveX <= -1;
                
      elsif( tballX - 2 < bar2X + 3 and tballY + 2 > bar2Y - 25 and tballY-2 < bar2Y + 25 ) then
          ballmoveX <= 1;                                                      
           
      end if;
      --if's end
    end if;
end process;

--bot bar movement code
process(barClock)
begin 
    if( rising_edge(barClock) ) then
        bar2Y <= tballY + bar2moveY;         
    end if;
end process;

--bar movement code
process(barClock)
begin
    if( rising_edge(barClock)) then
    
        if( left = '1' and tbarX - 25 > 471 ) then
            tbarX <= tbarX - 1;
        
        elsif( right = '1' and tbarX + 25 < 798 ) then
            tbarX <= tbarX + 1; 
    
        elsif( up = '1' and tbarY + 3 > 50 ) then
            
            tbarY <= tbarY - 1;
    
        elsif( down = '1' and tbarY - 3 < 500 ) then
            tbarY <= tbarY + 1;
         
        elsif( center = '1' ) then
            tbarX <= 789;
            tbarY <= 200;
        end if;
        
    end if;
end process;

barY <= tbarY;
barX <= tbarX;
ballX <= tballX;
ballY <= tballY;
end Behavioral;
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2017 11:00:24
-- Design Name: 
-- Module Name: ball - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ball is
     Port( clockin : in STD_LOGIC;
           left : in STD_LOGIC;
           right : in STD_LOGIC;
           controlx : in STD_LOGIC_VECTOR(9 downto 0);
           controly : in STD_LOGIC_VECTOR(9 downto 0);
           video_on : in STD_LOGIC; 
           rgb : out STD_LOGIC_VECTOR(2 downto 0));
end ball;

architecture Behavioral of ball is

--bar
signal bar_l,bar_l_next: integer := 100; --the distance between bar and left side of screen
constant bar_t: integer := 420; --the distance between bar and top side of screen
constant bar_k: integer := 10; --bar thickness
constant bar_w: integer := 120; --bar width
constant bar_v: integer := 10; --velocity of the bar
signal bar_on: STD_LOGIC;
signal rgb_bar: STD_LOGIC_VECTOR(3 downto 0); 

--ball
signal ball_l,ball_l_next:integer :=100;--the distance between ball and left side of screen
signal ball_t,ball_t_next:integer :=100; --the distance between ball and top side of screen
constant ball_w:integer :=20;--ball Height
constant ball_u:integer :=20;--ball width
constant x_v,y_v:integer:=3;-- horizontal and vertical speeds of the ball 
signal ball_on: STD_LOGIC;ignal rgb_ball: STD_LOGIC_VECTOR(2 downto 0); 

--refreshing(1/60)
signal refresh_reg,refresh_next:integer;
constant refresh_constant:integer:=830000;
signal refresh_tick: STD_LOGIC;

--ball animation
signal xv_reg,xv_next:integer:=3;--variable of the horizontal speed
signal yv_reg,yv_next:integer:=3;--variable of the vertical speed

--x,y pixel cursor
signal x,y:integer range 0 to 650;

--mux
signal vdbt:STD_LOGIC_VECTOR(3 downto 0);

--buffer
signal rgb_reg,rgb_next:STD_LOGIC_VECTOR(2 downto 0);

begin

--x,y pixel cursor
x <= conv_integer(controlx);
y <= conv_integer(controly);

--refreshing
process(clockin)
begin
     if clockin'event and clockin ='1' then
          refresh_reg<=refresh_next; 
     end if;
end process;
refresh_next<= 0 when refresh_reg= refresh_constant else
refresh_reg+1;
refresh_tick<= '1' when refresh_reg = 0 else
                           '0';
--register part
process(clockin)
begin
     if clockin'event and clockin ='1' then
         ball_l<=ball_l_next;
         ball_t<=ball_t_next;
         xv_reg<=xv_next;
         yv_reg<=yv_next;
         bar_l<=bar_l_next;
      end if;
end process;

--bar animation
process(bar_l,refresh_tick,right,left)
begin
    bar_l_next<=bar_l;
    if refresh_tick= '1' then
       if left='1' and bar_l > bar_v then 
          bar_l_next<=bar_l- bar_v;
       elsif right ='1' and bar_l < (639- bar_v-bar_w) then
           bar_l_next<=bar_l+ bar_v;
      end if;
    end if;
end process;

--ball animation
process(refresh_tick,ball_l,ball_t,xv_reg,yv_reg)
begin
     ball_l_next <=ball_l;
     ball_t_next <=ball_t;
     xv_next<=xv_reg;
     yv_next<=yv_reg;
     if refresh_tick = '1' then
        if ball_t> 400 and ball_l > (bar_l -ball_u) and ball_l < (bar_l +120) then --the ball hits the bar
           yv_next<= -y_v ;
       elsif ball_t< 35 then--The ball hits the wall
           yv_next<= y_v;
       end if;
       if ball_l < 10 then --The ball hits the left side of the screen
          xv_next<= x_v;
       elsif ball_l> 600 then 
          xv_next<= -x_v ; --The ball hits the right side of the screen
       end if; 
       ball_l_next <=ball_l +xv_reg;
       ball_t_next <=ball_t+yv_reg; 
    end if;
end process;

--bar object
bar_on <= '1' when x > bar_l and x < (bar_l+bar_w) and y> bar_t and y < (bar_t+ bar_k) else
                    '0'; 
rgb_bar<="001";--blue

--ball object
ball_on <= '1' when x > ball_l and x < (ball_l+ball_u) and y> ball_t and y < (ball_t+ ball_w) else
                     '0'; 
rgb_ball<="010"; --Green

--buffer
process(clockin)
begin
     if clockin'EVENT and clockin ='1' then
         rgb_reg<=rgb_next;
     end if;
end process;

--mux
vdbt<=video_on & bar_on & ball_on; 
with vdbt select
     rgb_next <= "100" when "100",--Background of the screen is red 
     rgb_bar when "1010",
     rgb_bar when "1011",
     rgb_ball when "1001",
      "000" when others;
--output
rgb<=rgb_reg;

end Behavioral;
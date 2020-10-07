----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:47:34 09/18/2020 
-- Design Name: 
-- Module Name:    counter7 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--led blink program
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter7 is
	port(
		clk:in std_logic;	--clock 
		ena:in std_logic;		--enable=1, status up or down
		reset:in std_logic;		--reset
		display:out std_logic_vector(6 downto 0);
		hh:out std_logic
		);
end counter7;

architecture behavioral of counter7 is
	signal clk_counter:natural range 0 to 12000000:=0;
	signal count:std_logic_vector(6 downto 0):="0000000";
begin
	process(clk,reset)
	begin
	if(ena='1') then
		if(rising_edge(clk)) then
			clk_counter<=clk_counter+1;
			if(clk_counter>=12000000) then
				--blinker<=not blinker;
				if(reset='1') then 
					count<="0000000";
				elsif(clk'event and clk='1') then
			
					count<=count+1;
					if(count="1111111") then
						count<="0000000";
					end if;
				end if;
				
				--
				clk_counter<=0;
			end if;
		end if;
	end if;
	end process;
	display<=count;
end behavioral;

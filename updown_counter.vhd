----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:10:59 08/18/2020 
-- Design Name: 
-- Module Name:    fpgaled - Behavioral 
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

entity blink is
	port(
		clk:in std_logic;	--clock 
		ena:in std_logic;		--enable=1, status up or down
		reset:in std_logic;		--reset
		display:out std_logic_vector(3 downto 0)
		);
end blink;

architecture behavioral of blink is
	signal clk_counter:natural range 0 to 12000000:=0;
	signal count:std_logic_vector(3 downto 0):="0000";
begin
	process(clk,reset)
	begin
	if(ena='1') then
		if(rising_edge(clk)) then
			clk_counter<=clk_counter+1;
			if(clk_counter>=12000000) then
				--blinker<=not blinker;
				if(reset='1') then 
					count<="0000";
				elsif(clk'event and clk='1') then
			
					count<=count+1;
					if(count="1111") then
						count<="0000";
					end if;
				end if;
				
				--
				clk_counter<=0;
			end if;
		end if;
	--end if;
	else
		if(rising_edge(clk)) then
			clk_counter<=clk_counter+1;
			if(clk_counter>=12000000) then
				--blinker<=not blinker;
				if(reset='1') then 
					count<="1111";
				elsif(clk'event and clk='1') then
			
					count<=count-1;
					if(count="0000") then
						count<="1111";
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

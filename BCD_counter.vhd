----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:02:46 08/24/2020 
-- Design Name: 
-- Module Name:    BCD_counter - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_counter is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data : out  STD_LOGIC_VECTOR (3 downto 0));
end BCD_counter;

architecture Behavioral of BCD_counter is
	signal clkdiv:std_logic;
begin
--process 1
	process(clk,reset)
	variable temp_data:std_logic_vector(23 downto 0);
	begin
		if(reset='1') then
			temp_data:=(others=>'0');
		elsif(clk'event and clk='1') then
			temp_data:=temp_data+1;
		end if;
		
		clkdiv<=temp_data(23);
	end process;
--process 2
		process(clkdiv,reset)
		signal temp:std_logic_vector(3 downto 0);
		begin
			if(reset='1') then
				temp<="0000";
			elsif(clkdiv'event and clkdiv='1') then
				temp<=temp+1;
				if(temp<="1001") then
					temp<="0000";
				end if;
			end if;
		end process;
		--temp<=tostd_logic_vector(
	--data<=temp;
	
end Behavioral;

























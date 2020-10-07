--Hexadecial counter on FPGA by Ninad Waingankar

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
--use ieee.std_logic_signed.all;

entity bincounter is
port(clk:in std_logic;
		rst:in std_logic;
		bin:out std_logic_vector(3 downto 0));
end bincounter;

architecture bincounter of bincounter is
	signal divider:std_logic_vector(23 downto 0);	--clock divider signal
	
	signal count:std_logic_vector(3 downto 0):="0000";
		
begin
	process(clk,rst) 
	begin
		if(rst='1') then
			divider<=(others=>'0');
			
		elsif(rising_edge(clk)) then
			divider<=divider+'1';
		end if;
	end process;
	--developed by Ninad Waingankar

	process(divider(22),rst)
	
	begin
		if(rst='1') then
			count<="0000";
		elsif(rising_edge(divider(22))) then
			count<=count+'1';
			if(count<="1111") then
				count<="0000";				
			end if;
		end if;
	end process;
	bin<=count;
end bincounter;

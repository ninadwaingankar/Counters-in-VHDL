--Decial counter on FPGA (0 to 9 counter)

-- by Ninad Waingankar

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decimalcounter is
port(clk:in std_logic;
		rst:in std_logic;
		decimal:out std_logic_vector(6 downto 0));
end decimalcounter;


-- developed by Ninad Waingankar

architecture dec of decimalcounter is
	signal divider:std_logic_vector(23 downto 0);	--clock divider signal
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
		variable count:natural range 0 to 10:=0;
		
	begin
		if(rst='1') then
			count:=0;
			
		elsif(rising_edge(divider(22))) then
			count:=count+1;
			if(count=10) then
				count:=0;				
			end if;
		end if;
		
	--codes for Common anode 7 segment display	abcdefg format
	
	--for decimal counter (0 to 9) on common anode 7 seg display
		case count is 
			when 0=>decimal<="0000001";-- shows 0
			when 1=>decimal<="1001111";-- shows 1
			when 2=>decimal<="0010010";-- shows 2
			when 3=>decimal<="0000110";-- shows 3
			when 4=>decimal<="1001100";-- shows 4
			when 5=>decimal<="0100100";-- shows 5
			when 6=>decimal<="0100000";-- shows 6
			when 7=>decimal<="0001111";-- shows 7
			when 8=>decimal<="0000000";-- shows 8 
			when 9=>decimal<="0000100";-- shows 9
			when others=>null;
		end case;	
	end process;	
end dec;

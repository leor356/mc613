library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clock_divisor is
	port (clock 		: in std_logic;
			clock_out	: out std_logic);
			
end clock_divisor;

architecture logic of clock_divisor is
	signal count : std_logic_vector(3 downto 0);
begin
	with clock_out & count select
		clock_out <=	'1' when count = "1011", else '0';
	
	process (clock)
	begin
		if clock'event and clock = '1' then
			count <= count + 1;
		end if;
		
		if count = "1011" then
			count <= "0000";
		end if;
	end process;
end logic;
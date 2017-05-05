library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clock_divisor is
	port (clock 		: in std_logic;
			clock_out	: out std_logic);
			
end clock_divisor;

architecture logic of clock_divisor is
	signal count : std_logic_vector(24 downto 0);
	signal cout	: std_logic;
begin
	process (clock)
	begin
		if clock'event and clock = '1' then	
			-- o certo eh 10111110101111000010000000
			if count = "1011111010111100001000000" then
				cout <= not(cout);
				count <= "0000000000000000000000000";
			else
				count <= count + 1;
			end if;
		end if;
	end process;
	
	clock_out <= cout;
end logic;

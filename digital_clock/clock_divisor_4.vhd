library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clock_divisor_4 is
	port (clock 		: in std_logic;
			clock_out	: out std_logic);
			
end clock_divisor_4;

architecture logic of clock_divisor_4 is
	signal count : std_logic_vector(2 downto 0);
	signal cout	: std_logic;
begin
	process (clock)
	begin
		if clock'event and clock = '1' then	
			if count = "001" then
				cout <= not(cout);
				count <= "000";
			else
				count <= count + 1;
			end if;
		end if;
	end process;
	
	clock_out <= cout;
end logic;

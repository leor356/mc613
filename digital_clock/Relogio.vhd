library ieee;
library work;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.clock_divisor_package.all;
use work.counter_mod10_package.all;

entity Relogio is
	port (modo : in std_logic;
			hs	: in std_logic;
			dig : in std_logic_vector(1 downto 0);
			value_loaded : in std_logic_vector(3 downto 0);
			load : in std_logic;
			clock : in std_logic;
			hour1 : buffer std_logic_vector(1 downto 0);
			hour2 : buffer std_logic_vector(3 downto 0);
			min1 : buffer std_logic_vector(3 downto 0);
			min2 : buffer std_logic_vector(3 downto 0);
			sec1 : buffer std_logic_vector(3 downto 0);
			sec2 : buffer std_logic_vector(3 downto 0));
end Relogio;

architecture logic of Relogio is
	signal second_clock : std_logic;
begin
	div: clock_divisor port map (clock, second_clock);
	cnt: counter_mod10 port map (second_clock, sec2);
	
	process (sec2)
	begin
		if sec2 = "1010" then
			sec2 <= "0000";
			sec1 <= sec1 + 1;
			if sec1 = "1010" then
				sec1 <= "0000";
				min2 <= min2 + 1;
				if min2 = "1010" then
					min2 <= "0000";
					min1 <= min1 + 1;
					if min1 = "1010" then
						min1 <= "0000";
						hour1 <= hour1 + 1;
						if hour1 = "1010" then
							hour1 <= "0000";
							hour2 <= hour2 + 1;
						end if;
						if (hour2 = "10" and hour1 = "1000") then
							hour2 <= "00";
							hour1 <= "0000";
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
end logic;
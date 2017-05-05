library ieee;
library work;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.clock_divisor_package.all;
use work.display7seg_package.all;

entity Relogio is
	port (modo : in std_logic;
			hs	: in std_logic;
			dig : in std_logic_vector(1 downto 0);
			value_loaded : in std_logic_vector(3 downto 0);
			load : in std_logic;
			cclock : in std_logic;
			display3 : out std_logic_vector(6 downto 0);
			display2 : out std_logic_vector(6 downto 0);
			display1 : out std_logic_vector(6 downto 0);
			display0 : out std_logic_vector(6 downto 0));
end Relogio;

architecture logic of Relogio is
	signal clock : std_logic;
	signal hour1 : std_logic_vector(3 downto 0);
	signal hour2 : std_logic_vector(3 downto 0);
	signal min1 : std_logic_vector(3 downto 0);
	signal min2 : std_logic_vector(3 downto 0);
	signal sec1 : std_logic_vector(3 downto 0);
	signal sec2 : std_logic_vector(3 downto 0);
	signal display_number0 : std_logic_vector(3 downto 0);
	signal display_number1 : std_logic_vector(3 downto 0);
	signal display_number2 : std_logic_vector(3 downto 0);
	signal display_number3 : std_logic_vector(3 downto 0);
begin
	div: clock_divisor port map (cclock, clock);
	
	process (clock)
	begin
		if clock'event and clock = '1' then
			if modo = '0' then
				-- if xx:xx:x9 
				if sec2 = "1001" then
					sec2 <= "0000";
					
					-- if xx:xx:59
					if sec1 = "0101" then
						sec1 <= "0000";
						
						-- if xx:x9:59
						if min2 = "1001" then
							min2 <= "0000";
							
							-- if xx:59:59
							if min1 = "0101" then
								min1 <= "0000";
								
								-- if 23:59:59
								if hour1 = "0010" and hour2 = "0011" then
									hour1 <= "0000";
									hour2 <= "0000";
								
								-- else if x9:59:59
								elsif hour2 = "1001" then
									hour1 <= hour1 + 1;
									hour2 <= "0000";
								else
									hour2 <= hour2 + 1;
								end if;
							else
								min1 <= min1 + 1;
							end if;
						else
							min2 <= min2 + 1;
						end if;
					else
						sec1 <= sec1 + 1;
					end if;
				else
					sec2 <= sec2 + 1;
				end if;
			elsif modo = '1' and load = '1' then
				sec2 <= "0000";
				sec1 <= "0000";
				if dig = "00" then
					min2 <= value_loaded;
				elsif dig = "01" then
					min1 <= value_loaded;
				elsif dig = "10" then
					hour2 <= value_loaded;
				elsif dig = "11" then
					hour1 <= value_loaded;
				end if;
			end if;
		end if;
		
		
	end process;
	
	display_number3 <= hour1 when hs = '0' else min1;
	display_number2 <= hour2 when hs = '0' else min2;
	display_number1 <= min1 when hs = '0' else sec1;
	display_number0 <= min2 when hs = '0' else sec2;
	
	display_out3: display7seg port map(display_number3(3 downto 0), display3(6 downto 0));
	display_out2: display7seg port map(display_number2(3 downto 0), display2(6 downto 0));
	display_out1: display7seg port map(display_number1(3 downto 0), display1(6 downto 0));
	display_out0: display7seg port map(display_number0(3 downto 0), display0(6 downto 0));
	
end logic;
library ieee;
use ieee.std_logic_1164.all;

entity Maquina1 is
	port (Reset, Clock, w: in std_logic;
			z: out std_logic);
end Maquina1;

architecture Comportamento of Maquina1 is
type state_type is (a, b, c, d);
signal y : state_type;
begin
	process (Clock, Reset)
	begin
		if Reset = '1' then
			y <= a;
		elsif Clock'event and Clock = '1' then
			case y is
				when a =>
					z <= '1';
					if w = '0' then
						y <= c;
					else
						y <= b;
					end if;
				when b =>
					if w = '0' then
						y <= d;
						z <= '1';
					else
						y <= c;
						z <= '0';
					end if;
				when c =>
					if w = '0' then
						y <= b;
						z <= '0';
					else
						y <= c;
						z <= '0';
					end if;
				when d =>
					if w = '0' then
						y <= a;
						z <= '0';
					else
						y <= c;
						z <= '1';
					end if;
			end case;
		end if;
	end process;
end Comportamento;

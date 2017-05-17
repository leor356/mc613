library ieee;
use ieee.std_logic_1164.all;

entity Maquina2 is
	port (Reset, Clock, w: in std_logic;
			z: out std_logic);
end Maquina2;

architecture Comportamento of Maquina2 is
type state_type is (a, b, c, d);
signal y: state_type;
begin
	process (Reset, Clock)
	begin
		if Reset = '1' then
			y <= a;
		elsif Clock'event and Clock = '1' then
			case y is
				when a =>
					z <= '0';
					if w = '0' then
						y <= a;
					else
						y <= b;
					end if;
				when b =>
					z <= '1';
					if w = '0' then
						y <= c;
					else
						y <= b;
					end if;
				when c =>
					z <= '0';
					if w = '0' then
						y <= c;
					else
						y <= d;
					end if;
				when d =>
					z <= '0';
					if w = '0' then
						y <= a;
					else
						y <= d;
					end if;
			end case;
		end if;
	end process;
end Comportamento;

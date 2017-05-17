library ieee;
use ieee.std_logic_1164.all;

entity Maquina3 is
	port (Reset, Clock, w: in std_logic;
			z: out std_logic);
end Maquina3;

architecture Comportamento of Maquina3 is
type state_type is (a, b, c, d);
signal y : state_type;
begin
	process(Reset, Clock)
	begin
		if Reset = '1' then
			y <= a;
			z <= '0';
		elsif Clock'event and Clock = '1' then
			case y is
				when a =>
					z <= '0';
					if w = '0' then
						y <= b;
					else
						y <= a;
					end if;
				when b =>
					z <= '0';
					if w = '1' then
						y <= c;
					else 
						y <= b;
					end if;
				when c =>
					z <= '0';
					if w = '0' then
						y <= d;
					else
						y <= a;
					end if;
				when d =>
					if w = '1' then
						y <= c;
						z <= '1';
					else
						y <= a;
					end if;
			end case;
		end if;
	end process;
end Comportamento;
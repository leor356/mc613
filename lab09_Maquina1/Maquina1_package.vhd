library ieee;
use ieee.std_logic_1164.all;

package Maquina1_package is
	component Maquina1 is
		port (Reset, Clock, w:	in std_logic;
				z: 					out std_logic);
	end component;
end Maquina1_package;
library ieee;
use ieee.std_logic_1164.all;

package Maquina3_package is
	component Maquina3 is
		port (Reset, Clock, w: in std_logic;
				z: out std_logic);
	end component;
end Maquina3_package;
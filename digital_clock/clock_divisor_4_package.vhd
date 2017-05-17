library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package clock_divisor_4_package is
	component clock_divisor_4 is
		port (clock 		: in std_logic;
				clock_out	: out std_logic);
	end component;
end clock_divisor_4_package;
library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package Relogio_package is
	component Relogio is
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
	end component;
end Relogio_package;
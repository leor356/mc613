LIBRARY ieee;
USE ieee.std_logic_1164.all;

package dec3to8_package is
	component dec3to8 is
		port (w 	: in std_logic_vector(2 DOWNTO 0);
				En	: in std_logic;
				y	: out std_logic_vector(7 DOWNTO 0));
	end component;
end dec3to8_package;
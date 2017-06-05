LIBRARY ieee;
USE ieee.std_logic_1164.all;

package dec5to32_package is
	component dec5to32 is
		port (w 	: in std_logic_vector(4 DOWNTO 0);
				En	: in std_logic;
				y	: out std_logic_vector(31 DOWNTO 0));
	end component;
end dec5to32_package;
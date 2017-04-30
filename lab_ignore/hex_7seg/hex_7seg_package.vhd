LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE hex_7seg_package IS
	COMPONENT hex_7seg IS
		PORT(num : IN std_logic_vector(3 DOWNTO 0);
			  seg : OUT std_logic_vector(6 DOWNTO 0));
	END COMPONENT;
END hex_7seg_package;

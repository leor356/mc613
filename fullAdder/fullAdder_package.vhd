LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE fullAdder_package IS
	COMPONENT fullAdder IS
		PORT (x, y, cin : IN std_logic;
				s, cout : OUT std_logic);
	END COMPONENT;
END fullAdder_package;

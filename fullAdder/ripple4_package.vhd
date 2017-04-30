LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE ripple4_package IS
	COMPONENT ripple4 IS
		PORT (x, y : IN std_logic_vector(3 DOWNTO 0);
				cin : IN std_logic;
				s: OUT std_logic_vector(3 DOWNTO 0);
				cout : OUT std_logic;
				v : OUT std_logic);	
	END COMPONENT;
END ripple4_package;

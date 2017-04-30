LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE work.fullAdder_package.all;

PACKAGE cla4_package IS
	COMPONENT cla4 IS
		PORT (x : IN std_logic_vector(3 downto 0);
				y : IN std_logic_vector(3 downto 0);
				cin : IN std_logic;
				cout : OUT std_logic;
				s : OUT std_logic_vector(3 downto 0));
	END COMPONENT;
END cla4_package;
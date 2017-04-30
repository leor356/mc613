LIBRARY ieee;
LIBRARY work;

USE ieee.std_logic_1164.all;
USE work.fullAdder_package.all;
USE work.ripple4_package.all;

PACKAGE alu_package IS
	COMPONENT alu IS
		PORT (x, y : IN std_logic_vector(3 DOWNTO 0);
			s : IN std_logic_vector(1 DOWNTO 0);
			res: OUT std_logic_vector(3 DOWNTO 0);
			z : OUT std_logic;
			c : OUT std_logic;
			v : OUT std_logic;
			n : OUT std_logic);
	END COMPONENT;
END alu_package;
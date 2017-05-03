LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE ffd_package IS
	COMPONENT ffd IS
		PORT (D, CLK: IN std_logic;
				S: OUT std_logic);
	END COMPONENT;
END ffd_package;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE barrelShifter_package IS
	COMPONENT barrelShifter IS
		PORT (s : IN std_logic_vector(1 DOWNTO 0);
				y : IN std_logic_vector(3 DOWNTO 0);
				w : OUT std_logic_vector(3 DOWNTO 0));
	END COMPONENT;
END barrelShifter_package;
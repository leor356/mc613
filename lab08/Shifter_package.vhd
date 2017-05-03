LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE Shifter_package IS
	COMPONENT Shifter IS
		GENERIC (n : INTEGER := 8);
		PORT (clk, SerIn: IN std_logic;
					ParIn: IN std_logic_vector(n-1 DOWNTO 0);
					modo: IN std_logic_vector(1 DOWNTO 0);
					ParOut: BUFFER std_logic_vector(n-1 DOWNTO 0));
	END COMPONENT;
END Shifter_package;
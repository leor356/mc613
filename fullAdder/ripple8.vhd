LIBRARY ieee;
LIBRARY work;

USE ieee.std_logic_1164.all;
USE work.fullAdder_package.all;

ENTITY ripple8 IS
	PORT (x, y : IN std_logic_vector(7 DOWNTO 0);
			cin : IN std_logic;
			s: OUT std_logic_vector(7 DOWNTO 0);
			cout : OUT std_logic;
			v : OUT std_logic);
END ripple8;

ARCHITECTURE add OF ripple8 IS
	SIGNAL c : std_logic_vector(7 DOWNTO 0);
BEGIN
	adder0: fullAdder PORT MAP (x(0), y(0), cin, s(0), c(0));
	G1: FOR i IN 1 TO 7 GENERATE
		adder: fullAdder PORT MAP (x(i), y(i), c(i-1), s(i), c(i));
	END GENERATE;
	cout <= c(7);
	v <= c(7) XOR c(6);
END add;	

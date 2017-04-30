LIBRARY ieee;
LIBRARY work;

USE ieee.std_logic_1164.all;
USE work.fullAdder_package.all;

ENTITY ripple4 IS
	PORT (x, y : IN std_logic_vector(3 DOWNTO 0);
			cin : IN std_logic;
			s: OUT std_logic_vector(3 DOWNTO 0);
			cout : OUT std_logic;
			v : OUT std_logic);
END ripple4;

ARCHITECTURE add OF ripple4 IS
	SIGNAL c : std_logic_vector(3 DOWNTO 0);
BEGIN
	adder0: fullAdder PORT MAP (x(0), y(0), cin, s(0), c(0));
	adder1: fullAdder PORT MAP (x(1), y(1), c(0), s(1), c(1));
	adder2: fullAdder PORT MAP (x(2), y(2), c(1), s(2), c(2));
	adder3: fullAdder PORT MAP (x(3), y(3), c(2), s(3), c(3));
	cout <= c(3);
	v <= c(3) XOR c(2);
END add;	

LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.crossbarC_package.all;

ENTITY crossbarF IS
	GENERIC (n : INTEGER := 8);
	PORT (VCC, GND : IN std_logic;
			s		 	: IN std_logic_vector(n-1 DOWNTO 0);
			y1, y2 	: OUT std_logic);
END crossbarF;

ARCHITECTURE logic OF crossbarF IS

SIGNAL f1 : STD_logic_vector(n-1 DOWNTO 0);
SIGNAL f2 : STD_logic_vector(n-1 DOWNTO 0);

BEGIN
	xbar1: crossbarC PORT MAP (VCC, GND, s(0), f1(0), f2(0));
	
	G1: FOR i IN 1 TO n-1 GENERATE
		xbars: crossbarC PORT MAP(f1(i-1), f2(i-1), s(i), f1(i), f2(i));
	END GENERATE;
		
	y1 <= f1(n-1);
	y2 <= f2(n-1);
END logic;
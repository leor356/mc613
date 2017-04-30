LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY crossbarA IS
	PORT (x1, x2 : IN std_logic;
			s		 : IN std_logic;
			y1, y2 : OUT std_logic);
END crossbarA;

ARCHITECTURE logic OF crossbarA IS
BEGIN
	WITH s SELECT
		y1 <= x1 WHEN '0',
				x2 WHEN '1';
	WITH s SELECT
		y2 <= x2 WHEN '0',
				x1 WHEN '1';
END logic;
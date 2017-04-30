LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY crossbarB IS
	PORT (x1, x2 : IN std_logic;
			s0		 : IN std_logic;
			y1, y2 : OUT std_logic);
END crossbarB;

ARCHITECTURE logic OF crossbarB IS
BEGIN
		y1 <= x1 WHEN s0 = '0' ELSE x2;
		y2 <= x2 WHEN s0 = '0' ELSE x1;
END logic;
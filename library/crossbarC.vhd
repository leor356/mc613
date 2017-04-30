LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY crossbarC IS
	PORT (x1, x2 : IN std_logic;
			s1		 : IN std_logic;
			y1, y2 : OUT std_logic);
END crossbarC;

ARCHITECTURE logic OF crossbarC IS
BEGIN
	PROCESS (x1, x2, s1)
	BEGIN
		IF s1 = '0' THEN
			y1 <= x1;
		ELSE
			y1 <= x2;
		END IF;
		
		IF s1 = '0' THEN
			y2 <= x2;
		ELSE
			y2 <= x1;
		END IF;
	END PROCESS;
END logic;
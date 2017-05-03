LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ffd IS 
	PORT (D, CLK: IN std_logic;
			S: OUT std_logic);
END ffd;

ARCHITECTURE comportamento OF ffd IS
BEGIN
	PROCESS (CLK)
	BEGIN
		IF CLK'EVENT AND CLK = '1' THEN
			S <= D;
		END IF;
	END PROCESS;
END comportamento;
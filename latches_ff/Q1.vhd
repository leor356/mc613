LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Q1 IS -- latch SR NAND
	PORT ( A, B : IN STD_LOGIC ;
			 Q1 : OUT STD_LOGIC);
END Q1;

ARCHITECTURE logic OF Q1 IS
BEGIN
	PROCESS(A, B)
	BEGIN
		IF NOT(B) = '1' THEN
			Q1 <= '0';
		END IF;
		IF NOT(A) = '1' THEN
			Q1 <= '1';
		END IF;
	END PROCESS;
END logic;
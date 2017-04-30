LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Q5 IS -- FF JK Subida
	PORT ( A, B, clk : IN STD_LOGIC ;
			 m, n : IN STD_LOGIC;
			 Q5 : OUT STD_LOGIC);
END Q5;

ARCHITECTURE logic OF Q5 IS
BEGIN
	PROCESS(A, B, clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN
			IF A = '1' THEN
				Q5 <= '1';
			END IF;
			IF B = '1' THEN
				Q5 <= '0';
			END IF;
		END IF;
		IF m = '0' THEN
			Q5 <= '1';
		END IF;
		IF n = '0' THEN
			Q5 <= '0';
		END IF;
	END PROCESS;
END logic;
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Q4 IS -- FF T Descida
	PORT ( A, clk : IN STD_LOGIC ;
			 m, n : IN STD_LOGIC;
			 Q4 : OUT STD_LOGIC);
END Q4;

ARCHITECTURE logic OF Q4 IS
BEGIN
	PROCESS(A, clk)
	BEGIN
		IF clk'EVENT AND clk = '0' THEN
			Q4 <= A;
		END IF;
		IF m = '0' THEN
			Q4 <= '1';
		END IF;
		IF n = '0' THEN
			Q4 <= '0';
		END IF;
	END PROCESS;
END logic;
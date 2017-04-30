LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Q2 IS -- latch SR Chaveado
	PORT ( A, B, clk : IN STD_LOGIC ;
			 Q2 : OUT STD_LOGIC);
END Q2;

ARCHITECTURE logic OF Q2 IS
BEGIN
	PROCESS(A, B, clk)
	BEGIN
		IF clk = '1' THEN
			IF B = '1' THEN
				Q2 <= '1';
			END IF;
			IF A = '1' THEN
				Q2 <= '0';
			END IF;
		END IF;
	END PROCESS;
END logic;
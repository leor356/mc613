LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Q3 IS -- latch D Chaveado
	PORT ( A, clk : IN STD_LOGIC ;
			 Q3 : OUT STD_LOGIC);
END Q3;

ARCHITECTURE logic OF Q3 IS
BEGIN
	PROCESS(A, clk)
	BEGIN
		IF clk = '1' THEN
			Q3 <= A;
		END IF;
	END PROCESS;
END logic;
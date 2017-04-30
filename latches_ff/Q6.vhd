LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Q6 IS -- FF D
	PORT ( B, Clk : IN STD_LOGIC ;
			 m, n : IN STD_LOGIC;
			 Q6 : BUFFER STD_LOGIC);
END Q6;

ARCHITECTURE logic OF Q6 IS
BEGIN
	PROCESS(B, Clk)
	BEGIN
		IF Clk'EVENT AND Clk = '1' THEN			
			IF B = '1' THEN
				Q6 <= NOT(Q6);
			END IF;
		END IF;
		IF m = '0' THEN
			Q6 <= '1';
		END IF;
		IF n = '0' THEN
			Q6 <= '0';
		END IF;
	END PROCESS;
END logic;
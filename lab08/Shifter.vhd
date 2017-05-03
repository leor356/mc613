LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE work.ffd_package.all;

ENTITY Shifter IS
	GENERIC (n : INTEGER := 8);
	PORT (clk, SerIn: IN std_logic;
			ParIn: IN std_logic_vector(n-1 DOWNTO 0);
			modo: IN std_logic_vector(1 DOWNTO 0);
			ParOut: BUFFER std_logic_vector(n-1 DOWNTO 0));
END Shifter;

ARCHITECTURE behavior OF Shifter IS
	SIGNAL Qmid: std_logic_vector(n-1 DOWNTO 0);
BEGIN
	WITH modo SELECT
		Qmid(0) <=	ParOut(0) 	WHEN "00",
						SerIn 		WHEN "01",
						ParOut(1) 	WHEN "10",
						ParIn(0) 	WHEN "11";
				
	WITH modo SELECT		
		Qmid(n-1) <=	ParOut(n-1) WHEN "00",
							ParOut(n-2) WHEN "01",
							SerIn 		WHEN "10",
							ParIn(n-1) 	WHEN "11";
						
	G1: FOR i IN 1 TO n-2 GENERATE
		WITH modo SELECT
			Qmid(i) <=	ParOut(i) 	WHEN "00",
							ParOut(i-1) WHEN "01",
							ParOut(i+1) WHEN "10",
							ParIn(i) 	WHEN "11";
	END GENERATE;

	G2: FOR i IN 0 TO n-1 GENERATE
		ffds: ffd PORT MAP (Qmid(i), clk, ParOut(i));
	END GENERATE;
	
END behavior;
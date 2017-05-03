LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY work;
USE work.muxffd_package.all;

ENTITY Shifter IS
	GENERIC (n : INTEGER := 8);
	PORT (clk, SerIn: IN std_logic;
			ParIn: IN std_logic_vector(n-1 DOWNTO 0);
			modo: IN std_logic_vector(1 DOWNTO 0);
			ParOut: BUFFER std_logic_vector(n-1 DOWNTO 0));
END Shifter;

ARCHITECTURE behavior OF Shifter IS
	SIGNAL LS : std_logic;
	SIGNAL direcao: std_logic;
	SIGNAL Qmid: std_logic_vector(n-1 DOWNTO 0);
BEGIN
	WITH modo SELECT
		LS <= '1' WHEN "11",
				'0' WHEN OTHERS;
				
	WITH modo SELECT
		direcao <=	'0' WHEN "01",
						'1' WHEN OTHERS;
	
	PROCESS(clk)
	ffd_inicial: ffd PORT MAP (SerIn0, LS, ParIn(0), clk);
	ffd_final: ffd PORT MAP (SerInn, LS, ParIn(0), clk);
	
	
	G1: FOR i IN 1 TO n-2 GENERATE
		ffd_intermediario: ffd PORT MAP (, LS, ParIn(i), clk, );
	END GENERATE;
	--PROCESS()
		--IF modo = "01" THEN
			
		
	--END PROCESS;
	
END behavior;
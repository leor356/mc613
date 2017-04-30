LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE work.fullAdder_package.all;

ENTITY cla4 IS
	PORT (x : IN std_logic_vector(3 downto 0);
			y : IN std_logic_vector(3 downto 0);
			cin : IN std_logic;
			cout : OUT std_logic;
			s : OUT std_logic_vector(3 downto 0));
END cla4;

ARCHITECTURE logic OF cla4 IS
	SIGNAL g : std_logic_vector(3 downto 0);
	SIGNAL p : std_logic_vector(3 downto 0);
	SIGNAL cmid : std_logic_vector(4 downto 0);
BEGIN
	PROCESS (x, y)
	BEGIN
		FOR i IN 0 TO 3 LOOP
			p(i) <= x(i) OR y(i);
			g(i) <= x(i) AND y(i);
		END LOOP;
	END PROCESS;
	
	cmid(0) <= cin;
	cmid(1) <= g(0) OR (p(0) AND cin);
	cmid(2) <= g(1) OR (p(1) AND g(0)) OR (p(1) AND p(0) AND cin);
	cmid(3) <= g(2) OR (p(2) AND g(1)) OR (p(2) AND p(1) AND g(0)) OR (p(2) AND p(1) AND p(0) AND cin);
	cmid(4) <= g(3) OR (p(3) AND g(2)) OR (p(3) AND p(2) AND g(1)) OR (p(3) AND p(2) AND p(1) AND g(0)) OR (p(3) AND p(2) AND p(1) AND p(0) AND cin);
	
	G1 : FOR i IN 0 TO 3 GENERATE
		fA : fullAdder PORT MAP (x(i), y(i), cmid(i), s(i), open);
	END GENERATE;
	
	cout <= cmid(4);
END logic;
LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE work.fullAdder_package.all;

ENTITY cla8 IS
	PORT (x : IN std_logic_vector(7 downto 0);
			y : IN std_logic_vector(7 downto 0);
			cin : IN std_logic;
			cout : OUT std_logic;
			s : OUT std_logic_vector(7 downto 0));
END cla8;

ARCHITECTURE logic OF cla8 IS
	SIGNAL g : std_logic_vector(7 downto 0);
	SIGNAL p : std_logic_vector(7 downto 0);
	SIGNAL cmid : std_logic_vector(8 downto 0);
BEGIN
	PROCESS (x, y)
	BEGIN
		FOR i IN 0 TO 7 LOOP
			p(i) <= x(i) OR y(i);
			g(i) <= x(i) AND y(i);
		END LOOP;
	END PROCESS;
	
	cmid(0) <= cin;
	cmid(1) <= g(0) OR (p(0) AND cin);
	cmid(2) <= g(1) OR (p(1) AND g(0)) OR (p(1) AND p(0) AND cin);
	cmid(3) <= g(2) OR (p(2) AND g(1)) OR (p(2) AND p(1) AND g(0)) OR (p(2) AND p(1) AND p(0) AND cin);
	cmid(4) <= g(3) OR (p(3) AND g(2)) OR (p(3) AND p(2) AND g(1)) OR (p(3) AND p(2) AND p(1) AND g(0)) OR (p(3) AND p(2) AND p(1) AND p(0) AND cin);
	cmid(5) <= g(4) OR (p(4) AND g(3)) OR (p(4) AND p(3) AND g(2)) OR (p(4) AND p(3) AND p(2) AND g(1)) OR (p(4) AND p(3) AND p(2) AND p(1) AND g(0)) OR (p(4) AND p(3) AND p(2) AND p(1) AND p(0) AND cin);
	cmid(6) <= g(5) OR (p(5) AND g(4)) OR (p(5) AND p(4) AND g(3)) OR (p(5) AND p(4) AND p(3) AND g(2)) OR (p(5) AND p(4) AND p(3) AND p(2) AND g(1)) OR (p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND g(0)) OR (p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND p(0) AND cin);
	cmid(7) <= g(6) OR (p(6) AND g(5)) OR (p(6) AND p(5) AND g(4)) OR (p(6) AND p(5) AND p(4) AND g(3)) OR (p(6) AND p(5) AND p(4) AND p(3) AND g(2)) OR (p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND g(1)) OR (p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND g(0)) OR (p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND p(0) AND cin);
	cmid(8) <= g(7) OR (p(7) AND g(6)) OR (p(7) AND p(6) AND g(5)) OR (p(7) AND p(6) AND p(5) AND g(4)) OR (p(7) AND p(6) AND p(5) AND p(4) AND g(3)) OR (p(7) AND p(6) AND p(5) AND p(4) AND p(3) AND g(2)) OR (p(7) AND p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND g(1)) OR (p(7) AND p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND g(0)) OR (p(7) AND p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND p(0) AND cin);
	
	G1 : FOR i IN 0 TO 7 GENERATE
		fA : fullAdder PORT MAP (x(i), y(i), cmid(i), s(i), open);
	END GENERATE;
	
	cout <= cmid(8);
END logic;
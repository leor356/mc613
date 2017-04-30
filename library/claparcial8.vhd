LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE work.cla4_package.all;

ENTITY claparcial8 IS
	PORT (x : IN std_logic_vector(7 downto 0);
			y : IN std_logic_vector(7 downto 0);
			cin : IN std_logic;
			cout : OUT std_logic;
			s : OUT std_logic_vector(7 downto 0));
END claparcial8;

ARCHITECTURE logic OF claparcial8 IS
	signal cmid : std_logic;
BEGIN
	cl1 : cla4 PORT MAP (x(3 downto 0), y(3 downto 0), cin, cmid, s(3 downto 0));
	cl2 : cla4 PORT MAP (x(7 downto 4), y(7 downto 4), cmid, cout, s(7 downto 4));
END logic;
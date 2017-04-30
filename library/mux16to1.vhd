LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.mux4to1_package.all;

ENTITY mux16to1 IS
	PORT (s 	: IN std_logic_vector(3 DOWNTO 0);
			w 	: IN std_logic_vector(15 DOWNTO 0);
			En	: IN std_logic;
			F  : OUT std_logic);
END mux16to1;

ARCHITECTURE Logic OF mux16to1 IS
SIGNAL m	: std_logic_vector(3 DOWNTO 0);
BEGIN
	Mux1: mux4to1 PORT MAP (s(1 DOWNTO 0), w(3 DOWNTO 0), '1', m(0));
	Mux2: mux4to1 PORT MAP (s(1 DOWNTO 0), w(7 DOWNTO 4), '1', m(1));
	Mux3: mux4to1 PORT MAP (s(1 DOWNTO 0), w(11 DOWNTO 8), '1', m(2));
	Mux4: mux4to1 PORT MAP (s(1 DOWNTO 0), w(15 DOWNTO 12), '1', m(3));
	Mux5: mux4to1 PORT MAP (s(3 DOWNTO 2), m(3 DOWNTO 0), '1', F);
END Logic;
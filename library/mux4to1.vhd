LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.dec2to4_package.all;
USE work.caixaPontilhada_package.all;

ENTITY mux4to1 IS
	PORT (s 	: IN std_logic_vector(1 DOWNTO 0);
			w 	: IN std_logic_vector(3 DOWNTO 0);
			En	: IN std_logic;
			F  : OUT std_logic);
END mux4to1;

ARCHITECTURE Logic OF mux4to1 IS
SIGNAL y	: std_logic_vector(3 DOWNTO 0);
BEGIN
	decoder: dec2to4 PORT MAP (s, En,  y);
	caixa: caixaPontilhada PORT MAP (w, y, F);
END Logic;
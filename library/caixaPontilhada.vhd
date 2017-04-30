LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY caixaPontilhada IS
	PORT (w 	: IN std_logic_vector(3 DOWNTO 0);
			y	: IN std_logic_vector(3 DOWNTO 0);
			F  : OUT std_logic);
END caixaPontilhada;

ARCHITECTURE logic OF caixaPontilhada IS
BEGIN
	F <= (w(0) AND y(0)) OR (w(1) AND y(1)) OR (w(2) AND y(2)) OR (w(3) AND y(3));
END logic;
LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY work;
USE work.ffd_package.all;

ENTITY muxffd IS
	PORT (SI, LS, PB, clk: IN std_logic;
			Q: OUT std_logic);
END muxffd;

ARCHITECTURE behavior OF muxffd IS
SIGNAL s1, s2 : std_logic; 
BEGIN
	s1 <= SI AND NOT(LS);
	s2 <= LS AND PB;
	
	ffd1: ffd PORT MAP(s1 OR s2, clk, Q);

END behavior;
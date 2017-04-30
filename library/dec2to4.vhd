LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dec2to4 IS
	PORT (w 	: IN std_logic_vector(1 DOWNTO 0);
			En	: IN std_logic;
			y	: OUT std_logic_vector(3 DOWNTO 0));
END dec2to4;

ARCHITECTURE logic OF dec2to4 IS
BEGIN
	WITH En & w SELECT
		y <= "0001" WHEN "100",
			"0010" WHEN "101",
			"0100" WHEN "110",
			"1000" WHEN "111",
			"0000" WHEN OTHERS;
END logic;
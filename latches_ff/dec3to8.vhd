LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dec3to8 IS
	PORT (w 	: IN std_logic_vector(2 DOWNTO 0);
			En	: IN std_logic;
			y	: OUT std_logic_vector(7 DOWNTO 0));
END dec3to8;

ARCHITECTURE logic OF dec3to8 IS
BEGIN
	WITH En & w SELECT
		y <=	"00000001" WHEN "1000",
				"00000010" WHEN "1001",
				"00000100" WHEN "1010",
				"00001000" WHEN "1011",
				"00010000" WHEN "1100",
				"00100000" WHEN "1101",
				"01000000" WHEN "1110",
				"10000000" WHEN "1111",
				"00000000" WHEN OTHERS;
END logic;
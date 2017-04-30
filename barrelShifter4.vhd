LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY barrelShifter4 IS
	PORT (s : IN std_logic_vector(1 DOWNTO 0);
			y : IN std_logic_vector(3 DOWNTO 0);
			w : OUT std_logic_vector(3 DOWNTO 0));
END barrelShifter4;

ARCHITECTURE logic OF barrelShifter4 IS
BEGIN
	WITH s SELECT
		w(3) <=	y(3) WHEN "00",
					y(2) WHEN "01",
					y(1) WHEN "10",
					y(0) WHEN "11";
	WITH s SELECT
		w(2) <=	y(2) WHEN "00",
					y(1) WHEN "01",
					y(0) WHEN "10",
					y(3) WHEN "11";
	WITH s SELECT
		w(1) <=	y(1) WHEN "00",
					y(0) WHEN "01",
					y(3) WHEN "10",
					y(2) WHEN "11";
	WITH s SELECT
		w(0) <=	y(0) WHEN "00",
					y(3) WHEN "01",
					y(2) WHEN "10",
					y(1) WHEN "11";
END logic;

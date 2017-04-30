LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fullAdder IS
	PORT (x, y, cin : IN std_logic;
			s, cout : OUT std_logic);
END fullAdder;

ARCHITECTURE add OF fullAdder IS
	SIGNAL smid, cmid1, cmid2 : std_logic;
BEGIN
	smid <= x XOR y;
	cmid1 <= x AND y;
	s <= smid XOR cin;
	cmid2 <= smid AND cin;
	cout <= cmid1 OR cmid2;
END add;
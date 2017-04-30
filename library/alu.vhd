LIBRARY ieee;
LIBRARY work;

USE ieee.std_logic_1164.all;
USE work.fullAdder_package.all;
USE work.ripple4_package.all;

ENTITY alu IS
	PORT (x, y : IN std_logic_vector(3 DOWNTO 0);
			s : IN std_logic_vector(1 DOWNTO 0);
			res: OUT std_logic_vector(3 DOWNTO 0);
			z : OUT std_logic;
			c : OUT std_logic;
			v : OUT std_logic;
			n : OUT std_logic);
END alu;

ARCHITECTURE add OF alu IS
	SIGNAL cmid : std_logic_vector(3 DOWNTO 0);
	SIGNAL yk : std_logic_vector(3 DOWNTO 0);
	SIGNAL tmp1 : std_logic_vector(3 DOWNTO 0);
	SIGNAL tmp2 : std_logic_vector(3 DOWNTO 0);
BEGIN
	yk(0) <= y(0) XOR s(0);
	yk(1) <= y(1) XOR s(0);
	yk(2) <= y(2) XOR s(0);
	yk(3) <= y(3) XOR s(0);

	ripple: ripple4 PORT MAP (x, yk, s(0), tmp1, c, v);

	PROCESS (x, y, cmid, s, tmp1, tmp2) IS 
	BEGIN
		IF s(1) = '0' THEN
			res <= tmp1;
			n <= tmp1(3);
			z <= NOT (tmp1(0) OR tmp1(1) OR tmp1(2) OR tmp1(3));
		ELSE
			IF s(0) = '0' THEN
				tmp2 <= x AND y;
				z <= NOT (tmp2(0) OR tmp2(1) OR tmp2(2) OR tmp2(3));
				res <= tmp2;
			ELSE
				tmp2 <= x OR y;
				z <= NOT (tmp2(0) OR tmp2(1) OR tmp2(2) OR tmp2(3));
				res <= tmp2;
			END IF;
		END IF;
	END PROCESS;
END add;	

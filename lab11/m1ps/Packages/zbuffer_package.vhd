LIBRARY ieee;
USE ieee.std_logic_1164.all;

package zbuffer_package is
	component zbuffer is
		GENERIC ( N : INTEGER := 8 ) ;
		PORT ( X  : IN   STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
				 E  : IN   STD_LOGIC ;
				 F  : OUT  STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
	end component;
end zbuffer_package;
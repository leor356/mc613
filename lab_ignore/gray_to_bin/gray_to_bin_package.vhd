LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE gray_to_bin_package IS
	COMPONENT gray_to_bin IS
		PORT(gray : IN std_logic_vector(3 DOWNTO 0);
			  bin : OUT std_logic_vector(3 DOWNTO 0));
	END COMPONENT;
END gray_to_bin_package;
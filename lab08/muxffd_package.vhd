LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE muxffd_package IS
	COMPONENT muxffd IS
		PORT (SI, LS, PB, clk: IN std_logic;
			Q: OUT std_logic);
	END COMPONENT;
END muxffd_package;


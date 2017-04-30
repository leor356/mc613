LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.crossbarF_package.all;

ENTITY demo_setup IS
	PORT(SW : IN std_logic_vector(9 DOWNTO 0);
		  KEY : IN std_logic_vector(3 DOWNTO 0);
		  LEDR : OUT std_logic_vector(9 DOWNTO 0); 
		  LEDG : OUT std_logic_vector(7 DOWNTO 0);
		  HEX0 : OUT std_logic_vector(6 DOWNTO 0);
		  HEX1 : OUT std_logic_vector(6 DOWNTO 0);
		  HEX2 : OUT std_logic_vector(6 DOWNTO 0);
		  HEX3 : OUT std_logic_vector(6 DOWNTO 0);
		  CLOCK_27 : IN std_logic;
		  CLOCK_50 : IN std_logic;
		  CLOCK_24 : IN std_logic);
END demo_setup;

ARCHITECTURE test OF demo_setup IS
BEGIN
	xbar8: crossbarF
	GENERIC MAP(n => 8)
	port map ('1', '0', SW(7 DOWNTO 0), LEDR(0), OPEN);
END test;
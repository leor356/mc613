LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.hex_7seg_package.all;
USE work.gray_to_bin_package.all;

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
	SIGNAL binout : std_logic_vector(3 DOWNTO 0);
BEGIN
	gray2bin: gray_to_bin
	port map (SW(3 DOWNTO 0), binout);
	sevenseg: hex_7seg
	port map (binout, HEX0);
END test;
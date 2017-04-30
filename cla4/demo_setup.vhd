library ieee;
use ieee.std_logic_1164.all;

library work;
use work.cla4_package.all;
use work.display7seg_package.all;

entity demo_setup is
	port (SW : in std_logic_vector(9 downto 0);
			KEY : in std_logic_vector(3 downto 0);
			LEDR : out std_logic_vector(9 downto 0);
			LEDG : out std_logic_vector(7 downto 0);
			HEX0 : out std_logic_vector(6 downto 0);
			HEX1 : out std_logic_vector(6 downto 0);
			HEX2 : out std_logic_vector(6 downto 0);
			HEX3 : out std_logic_vector(6 downto 0);
			CLOCK_50 : in std_logic);
end demo_setup;

architecture Comportamento of demo_setup is
	signal num : std_logic_vector(3 downto 0);
begin
	cla : cla4 PORT MAP (SW(3 downto 0), SW(7 downto 4), SW(8), LEDG(0), num);
	display: display7seg PORT MAP (num, hex0);
end Comportamento;

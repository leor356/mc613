library ieee;
library work;
use ieee.std_logic_1164.all;
use work.ripple4_package.all;
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
	ripple: ripple4 PORT MAP (SW(7 DOWNTO 4), SW (3 DOWNTO 0), '0', num, LEDG(1), LEDG(0));
	display: display7seg PORT MAP (num, HEX0);
end Comportamento;

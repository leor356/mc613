library ieee;
library work;

use ieee.std_logic_1164.all;
use work.Shifter_package.all;

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
begin
	shifter1: Shifter GENERIC MAP(n => 6) PORT MAP (NOT(KEY(0)), SW(7), SW(5 DOWNTO 0), SW(9 DOWNTO 8), LEDR(5 DOWNTO 0));
end Comportamento;

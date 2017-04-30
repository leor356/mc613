library ieee;
use ieee.std_logic_1164.all;

library work;
use work.display7seg_package.all;
use work.alu_package.all;

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
	HEX2 <= "1111111";
	HEX3 <= "1111111";
	al: alu port map (SW(7 DOWNTO 4), SW(3 DOWNTO 0), SW(9 DOWNTO 8), num, LEDR(3), LEDR(2), LEDR(1), LEDR(0));
	disp: display7seg port map (num, HEX0, HEX1);
	--disp: display7seg port map (SW(3 DOWNTO 0), HEX0, HEX1);
end Comportamento;

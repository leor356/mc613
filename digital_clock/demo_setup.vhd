library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Relogio_package.all;


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
	clock: Relogio port map (SW(9), SW(8), SW(6 downto 5), SW(3 downto 0), not(KEY(1)), CLOCK_50, HEX3, HEX2, HEX1, HEX0);
end Comportamento;

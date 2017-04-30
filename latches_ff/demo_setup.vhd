library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Banco_package.all;
use work.hex_7seg_package.all;

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
	signal numout : std_logic_vector(3 downto 0);
begin
	bank : Banco port map (SW(2 downto 0), SW(5 downto 3), SW(9 downto 6), KEY(0), KEY(1), numout);
	seg  : hex_7seg port map (numout, HEX0);
	HEX1 <= "1111111";
	HEX2 <= "1111111";
	HEX3 <= "1111111";
end Comportamento;
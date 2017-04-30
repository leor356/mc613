library ieee;
use ieee.std_logic_1164.all;

package RegN_package is
	component RegN is
		generic (n : integer := 8);
		port (D : in std_logic_vector(n-1 downto 0);
				Load, Clear : in std_logic;
				Clk : in std_logic;
				Q : out std_logic_vector(n-1 downto 0));
	end component;
end RegN_package;
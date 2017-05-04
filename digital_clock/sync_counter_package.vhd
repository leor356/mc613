library ieee;
library work;

use ieee.std_logic_1164.all;
use work.ffd_package.all;

package sync_counter_package is
	component sync_counter is
		generic (n : integer := 4);
		port (enable : in std_logic;
				load : in std_logic;
				clock : in std_logic;
				d : in std_logic_vector(n-1 downto 0);
				q : buffer std_logic_vector(n-1 downto 0));
	end component;
end sync_counter_package;
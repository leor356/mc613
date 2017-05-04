library ieee;
library work;

use ieee.std_logic_1164.all;
use work.ffd_package.all;

entity sync_counter is
	generic (n : integer := 4);
	port (enable : in std_logic;
			load : in std_logic;
			clock : in std_logic;
			d : in std_logic_vector(n-1 downto 0);
			q : buffer std_logic_vector(n-1 downto 0));
end sync_counter;

architecture count of sync_counter is
	signal input : std_logic_vector(n-1 downto 0);
	signal mid	 : std_logic_vector(n-1 downto 0);
begin
	-- signal to "distribute" enable and do the counting
	mid(0) <= enable;
	g1: for i in 1 to n-1 generate
		mid(i) <= mid(i-1) and q(i-1);
	end generate;
	
	-- mux to select load or count
	g2: for i in 0 to n-1 generate
		with load select
			input(i) <= mid(i) xor q(i) when '0',
							d(i) when '1';
	end generate;
	
	-- flip-flop d to get output
	g3: for i in 0 to n-1 generate
		ffds: ffd port map (input(i), clock, q(i));
	end generate;
end count;
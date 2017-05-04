library ieee;
library work;

use ieee.std_logic_1164.all;
use work.sync_counter_package.all;

entity counter_mod10 is
	port (clock : in std_logic;
			q		: buffer std_logic_vector(3 downto 0));
end entity;

architecture count of counter_mod10 is
begin
	-- uses a sync counter with load data set to 0
	-- when gets to 10, loads the data set
	counter: sync_counter
				generic map (n => 4)
				port map ('1', q(0) and (not q(1)) and (not q(2)) and q(3), clock, "0000", q);
end count;
LIBRARY ieee;
USE ieee.std_logic_1164.all;

package reg_package IS
	component reg is
		GENERIC (
			WORDSIZE	: NATURAL := 32
		);
		PORT (
			clock,
			load,
			clear	: IN	STD_LOGIC;
			datain	: IN	STD_LOGIC_VECTOR(WORDSIZE-1 DOWNTO 0);
			dataout : OUT	STD_LOGIC_VECTOR(WORDSIZE-1 DOWNTO 0)
		);
	end component;
end package;
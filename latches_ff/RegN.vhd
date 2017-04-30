library ieee;
use ieee.std_logic_1164.all;

entity RegN is
	generic (n : integer := 8);
	port (D : in std_logic_vector(n-1 downto 0);
			Load, Clear : in std_logic;
			Clk : in std_logic;
			Q : out std_logic_vector(n-1 downto 0));
end RegN;

architecture Logic of RegN is
begin
	process(Clk, Clear)
	begin
		if Clk'event AND Clk = '1' then
			if Load = '1' then
				Q <= D;
			end if;
		end if;
		if Clear = '1' then
			Q <= (OTHERS => '0');
		end if;
	end process;
end Logic;
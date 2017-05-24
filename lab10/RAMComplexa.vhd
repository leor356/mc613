library ieee;
use ieee.std_logic_1164.all;
use work.RAM;

entity RAMComplexa is
	port(Clock, WrEn : in std_logic;
		Address : in std_logic_vector(9 downto 0);
		DataIn : in std_logic_vector(31 downto 0);
		DataOut : out std_logic_vector(31 downto 0));
end RAMComplexa;

architecture Comportamento of RAMComplexa is
	signal rams_wren : std_logic_vector(1 downto 0);
	
	type memory_t is array(1 downto 0) of std_logic_vector(31 downto 0);
	
	signal M : memory_t;
	signal D : std_logic_vector(63 downto 0);
begin
	with Address(7) select
		rams_wren <= "01" when '0',
						 "10" when others;

	g1: for i in 0 to 1 generate
		g2: for j in 0 to 3 generate
			--D <= M(i);
			rams: ram port map(Clock, WrEn and rams_wren(i), Address(6 downto 0), DataIn(8*j + 7 downto 8*j), D(32*i + 8*j + 7 downto 32*i + 8*j));
		end generate;
	end generate;
	
	with Address(9 downto 7) select
		DataOut <=	D(31 downto 0) when "000",
						D(63 downto 32) when "001",
						(others => 'Z') when others;
	
end Comportamento;

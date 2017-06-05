library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Memory is
	generic (
		WORDSIZE		: natural	:= 8;
		BITS_OF_ADDR	: natural	:= 16;
		MIF_FILE		: string	:= "Fibonacci.mif"
	);
	port (
		clock   : in	std_logic;
		we      : in	std_logic;
		address : in	std_logic_vector(BITS_OF_ADDR-1 downto 0);
		datain  : in	std_logic_vector(WORDSIZE-1 downto 0);
		dataout : out	std_logic_vector(WORDSIZE-1 downto 0)
	);
end Memory;

architecture Comportamento of Memory is
	type MatrizT is array (0 to BITS_OF_ADDR-1) of std_logic_vector(WORDSIZE-1 downto 0);
	signal Matriz : MatrizT;
	signal Add : std_logic_vector(BITS_OF_ADDR-1 downto 0);
	attribute ram_init_file : string;
	attribute ram_init_file of Matriz : signal is MIF_FILE;
	
begin
	process(clock)
	begin
		if (clock'event and clock='1') then
			if (we='1') then
				Matriz(to_integer(unsigned(address))) <= datain;
			end if;
			Add <= address;
		end if;
	end process;
	dataout <= Matriz(to_integer(unsigned(Add)));
	
end Comportamento;

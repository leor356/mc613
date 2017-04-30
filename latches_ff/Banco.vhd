library ieee;
library work;

use ieee.std_logic_1164.all;
use work.RegN_package.all;
use work.zbuffer_package.all;
use work.dec3to8_package.all;

entity Banco is
	port (IRS 	: in std_logic_vector(2 downto 0);	 -- input register selection
			ORS 	: in std_logic_vector(2 downto 0);	 -- output register selection
			DataI : in std_logic_vector(3 downto 0);	 -- data input
			Clk 	: in std_logic;							 -- clock
			clear : in std_logic;							 -- clear data
			DataO : out std_logic_vector(3 downto 0)); -- data output
end Banco;

architecture behavior of Banco is
	signal d2r : std_logic_vector(7 downto 0);
	signal r2d : std_logic_vector(7 downto 0);
	signal aux : std_logic_vector(31 downto 0);
begin
	dec_in  : dec3to8 port map (IRS, '1', d2r);
	dec_out : dec3to8 port map (ORS, '1', r2d);
	
	g1: for i in 0 to 7 generate
		reg : RegN 
				generic map (N => 4)
				port map (DataI, d2r(i), clear, Clk, aux((4*(i+1)-1) downto 4*i));
	end generate;
	
	g2: for i in 0 to 7 generate
		zbf : zbuffer
				generic map (N => 4)
				port map (aux((4*(i+1)-1) downto 4*i), r2d(i), DataO);
	end generate;
end behavior;
LIBRARY ieee;
USE ieee.std_logic_1164.all;

package Banco_package is
	component Banco is
		port (IRS 	: in std_logic_vector(2 downto 0);	 -- input register selection
				ORS 	: in std_logic_vector(2 downto 0);	 -- output register selection
				DataI : in std_logic_vector(3 downto 0);	 -- data input
				Clk 	: in std_logic;							 -- clock
				clear : in std_logic;							 -- clear data
				DataO : out std_logic_vector(3 downto 0)); -- data output
	end component;
end Banco_package;
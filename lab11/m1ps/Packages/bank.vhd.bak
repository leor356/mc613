library ieee;
library work;

use ieee.std_logic_1164.all;
use work.RegN_package.all;
use work.zbuffer_package.all;
use work.dec3to8_package.all;

entity bank is
    generic (
        WORDSIZE : NATURAL := 32
    );
    port (
        WR_EN, RD_EN,
        clear,
        clock		: IN 	STD_LOGIC;
        WR_ADDR,
        RD_ADDR1,
        RD_ADDR2	: IN	STD_LOGIC_VECTOR (4 DOWNTO 0);
        DATA_IN		: IN	STD_LOGIC_VECTOR (WORDSIZE-1 DOWNTO 0);
        DATA_OUT1,
        DATA_OUT2	: OUT	STD_LOGIC_VECTOR (WORDSIZE-1 DOWNTO 0)
    );
end entity;

architecture behavior of bank is
    signal ivec : std_logic_vector(4 downto 0);
    signal d2r1 : std_logic_vector(31 downto 0);
    signal d2r2 : std_logic_vector(31 downto 0);
    signal r2d  : std_logic_vector(31 downto 0);
    signal aux  : std_logic_vector(1023 downto 0);
begin
    dec_in   : dec5to32 port map (WR_ADDR, '1', r2d);
    dec_out1 : dec5to32 port map (RD_ADDR1, '1', d2r1);
    dec_out2 : dec5to32 port map (RD_ADDR2, '1', d2r1);
    
    reg1 : reg
        generic map (WORDSIZE => WORDSIZE)
        port map (clock, '0', open, open, aux((32*(i+1)-1) downto 32*i);

    g1: for i in 1 to 31 generate
        regs : reg
            generic map (WORDSIZE => WORDSIZE)
            port map (clock, dec_in(i), clear, DATA_IN, aux((32*(i+1)-1) downto 32*i);
    end generate;
    
    g2: for i in 0 to 31 generate
        zbf1 : zbuffer
            generic map (N => WORDSIZE-1)
            port map (aux((32*(i+1)-1) downto 32*i), r2d1(i), DATA_OUT1);
        zbf2 : zbuffer
            generic map (N => WORDSIZE-1)
            port map (aux((32*(i+1)-1) downto 32*i), r2d2(i), DATA_OUT2);
    end generate;
end behavior;

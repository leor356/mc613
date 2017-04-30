transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/ec2015/ra171941/Downloads/mc613/latches_ff/RegN.vhd}
vcom -93 -work work {/home/ec2015/ra171941/Downloads/mc613/latches_ff/dec3to8.vhd}
vcom -93 -work work {/home/ec2015/ra171941/Downloads/mc613/latches_ff/zbuffer.vhd}
vcom -93 -work work {/home/ec2015/ra171941/Downloads/mc613/latches_ff/RegN_package.vhd}
vcom -93 -work work {/home/ec2015/ra171941/Downloads/mc613/latches_ff/dec3to8_package.vhd}
vcom -93 -work work {/home/ec2015/ra171941/Downloads/mc613/latches_ff/zbuffer_package.vhd}
vcom -93 -work work {/home/ec2015/ra171941/Downloads/mc613/latches_ff/Banco.vhd}


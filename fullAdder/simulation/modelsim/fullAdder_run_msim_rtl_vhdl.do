transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/ec2015/ra175281/MC613/fullAdder/fullAdder.vhd}
vcom -93 -work work {/home/ec2015/ra175281/MC613/fullAdder/fullAdder_package.vhd}
vcom -93 -work work {/home/ec2015/ra175281/MC613/fullAdder/ripple8.vhd}


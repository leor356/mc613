onerror {quit -f}
vlib work
vlog -work work lab08.vo
vlog -work work lab08.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Shifter_vlg_vec_tst
vcd file -direction lab08.msim.vcd
vcd add -internal Shifter_vlg_vec_tst/*
vcd add -internal Shifter_vlg_vec_tst/i1/*
add wave /*
run -all

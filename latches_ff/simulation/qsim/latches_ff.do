onerror {quit -f}
vlib work
vlog -work work latches_ff.vo
vlog -work work latches_ff.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Q4_vlg_vec_tst
vcd file -direction latches_ff.msim.vcd
vcd add -internal Q4_vlg_vec_tst/*
vcd add -internal Q4_vlg_vec_tst/i1/*
add wave /*
run -all

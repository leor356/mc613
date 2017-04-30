onerror {quit -f}
vlib work
vlog -work work gray_to_bin.vo
vlog -work work gray_to_bin.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.gray_to_bin_vlg_vec_tst
vcd file -direction gray_to_bin.msim.vcd
vcd add -internal gray_to_bin_vlg_vec_tst/*
vcd add -internal gray_to_bin_vlg_vec_tst/i1/*
add wave /*
run -all

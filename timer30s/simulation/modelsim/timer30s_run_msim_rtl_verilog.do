transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Gaby/Desktop/timer30s {C:/Users/Gaby/Desktop/timer30s/timer30.sv}
vlog -sv -work work +incdir+C:/Users/Gaby/Desktop/timer30s {C:/Users/Gaby/Desktop/timer30s/tb_timer30.sv}


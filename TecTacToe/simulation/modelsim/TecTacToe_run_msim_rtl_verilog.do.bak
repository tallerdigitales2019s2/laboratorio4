transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/gsegura/Documents/taller/laboratorio4/TecTacToe {/home/gsegura/Documents/taller/laboratorio4/TecTacToe/CursorController.sv}
vlog -sv -work work +incdir+/home/gsegura/Documents/taller/laboratorio4/TecTacToe {/home/gsegura/Documents/taller/laboratorio4/TecTacToe/CursorController_tb.sv}


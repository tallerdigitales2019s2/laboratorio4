module CursorController_tb();
logic btn_confirm_i, btn_down_i, btn_right_i;
logic [3:0] position_o = 4'b0000;
logic confirm_o;

CursorController DUT (.*);

always #1 btn_confirm_i = ~btn_confirm_i;

initial
begin
btn_confirm_i=0;
btn_down_i=0;
btn_right_i=0;
#0 $display("Inicio de la simulacion para controlador de cursor");
#1 btn_down_i = 1;
#1 btn_down_i = 0;

#1 btn_down_i = 1;
#1 btn_down_i = 0;

#1 btn_down_i = 1;
#1 btn_down_i = 0;

#1 btn_down_i = 1;
#1 btn_down_i = 0;



#1 btn_right_i = 1;
#1 btn_right_i = 0;

#1 btn_right_i = 1;
#1 btn_right_i = 0;

#1 btn_right_i = 1;
#1 btn_right_i = 0;

#1 btn_right_i = 1;
#1 btn_right_i = 0;

#1 btn_right_i = 1;
#1 btn_right_i = 0;

#1 btn_right_i = 1;
#1 btn_right_i = 0;

end






endmodule
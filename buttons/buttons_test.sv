module buttons_test(btn_confirm_i,btn_i,position_o,confirm_o);
input logic btn_confirm_i, btn_i;
logic btn_confirm, btn;
output logic[3:0] position_o;
output logic confirm_o;

not(btn,btn_i);
not(btn_confirm,btn_confirm_i);

CursorController(btn,btn_confirm, position_o, confirm_o);

endmodule
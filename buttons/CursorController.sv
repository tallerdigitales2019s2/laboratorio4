module CursorController(btn_i, btn_confirm_i, position_o, confirm_o);
input logic btn_confirm_i, btn_i;
output logic[3:0] position_o = 4'b0000;
output logic confirm_o;
logic [1:0] buttons ;

assign confirm_o = btn_confirm_i;
always@(posedge btn_i )
begin
if(position_o == 4'b1000)
position_o = 4'b0000;
else
position_o = position_o+1;

end

endmodule
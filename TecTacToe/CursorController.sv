module CursorController(btn_right_i, btn_down_i, btn_confirm_i, position_o, confirm_o);
input logic btn_confirm_i, btn_down_i, btn_right_i;
output logic[3:0] position_o = 4'b0000;
output logic confirm_o;
logic [1:0] buttons ;

assign confirm_o = btn_confirm_i;
assign buttons = {btn_down_i,btn_right_i};

always@(posedge btn_down_i or posedge btn_right_i )begin

case (buttons) 
		  2'b01 : 
		  case (position_o)
		  4'b0010 : position_o <= 4'b0000;
		  4'b0101 : position_o <= 4'b0011;
		  4'b1000 : position_o <= 4'b0110;
		  default:position_o<=position_o+4'b0001;
		endcase
		2'b10 :
		case (position_o)
		  4'b0110 : position_o <= 4'b0000;
		  4'b0111 : position_o <= 4'b0001;
		  4'b1000 : position_o <= 4'b0010;
		  default:position_o<=position_o+4'b0011;
		endcase
		
		  default: begin end
		endcase

end

endmodule
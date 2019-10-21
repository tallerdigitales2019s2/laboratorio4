module Board(cursor_i, confirm_pos_i, current_player_i, reset, enable_i, board_status_o, current_pos_available_o, valid_move_o);
input logic [3:0]cursor_i;
input logic confirm_pos_i, current_player_i, reset, enable_i;
output logic [8:0][1:0] board_status_o ;
output logic current_pos_available_o,valid_move_o;

always @*
	begin
	valid_move_o=0;
	if(reset)
		begin
//			generate
//			begin
//			genvar i;
//			for (i=0; i<9; i=i+1) begin : gen_reset
//			board_status_o[i] = 0;
//			end
//			end
//		endgenerate
			board_status_o[0] = 0;
			board_status_o[1] = 0;
			board_status_o[2] = 0;
			board_status_o[3] = 0;
			board_status_o[4] = 0;
			board_status_o[5] = 0;
			board_status_o[6] = 0;
			board_status_o[7] = 0;
			board_status_o[8] = 0;
		end
	

	if(enable_i)
	begin
		if(board_status_o[cursor_i] == 2'b00)//posicion disponible
			case(confirm_pos_i)
				1'b0:current_pos_available_o = 1;
				1'b1:
				begin
				board_status_o[cursor_i] = {1'b1,current_player_i };
				current_pos_available_o = 0;
				valid_move_o=1;
				end
				default:begin end
			endcase
		else
			current_pos_available_o = 0;
		
		
//		if( board_status_o[cursor_i] == 2'b00)
		
		
		
	end
		
		
		
	end
endmodule
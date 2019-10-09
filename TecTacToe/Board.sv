module Board(cursor_i, confirm_pos_i, current_player_i, reset, enable_i, board_status, current_pos_available, valid_move);
input logic [3:0]cursor_i;
input logic confirm_pos_i, current_player_i, reset, enable_i;
output logic [1:0] board_status [0:8];
output logic current_pos_available,valid_move;

always@(*)
	begin
	valid_move=0;
	if(reset)
		begin
//			generate
//			genvar i;
//			for (i=0; i<9; i=i+1) begin : gen_reset
//			board_status[i] = 0;
//			end
//		endgenerate
			board_status[0] = 0;
			board_status[1] = 0;
			board_status[2] = 0;
			board_status[3] = 0;
			board_status[4] = 0;
			board_status[5] = 0;
			board_status[6] = 0;
			board_status[7] = 0;
			board_status[8] = 0;
		end
	

	if(enable_i)
	begin
		if(board_status[cursor_i] == 2'b00)
			case(confirm_pos_i)
				1'b0:current_pos_available = 1;
				1'b1:
				begin
				board_status[cursor_i] = {1'b1,current_player_i };
				current_pos_available = 0;
				valid_move=1;
				end
				default:begin end
			endcase
		else
			current_pos_available = 0;
		
		
//		if( board_status[cursor_i] == 2'b00)
		
		
		
	end
		
		
		
	end
endmodule
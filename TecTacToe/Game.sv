module Game(clk, btn_i, btn_confirm_i,
				board_status_o, winner_move_o,tie_o ,current_screen_o,current_player_o,cursor_pos_o);
input logic clk, btn_confirm_i, btn_i;
output logic [8:0][1:0] board_status_o ;
output logic [8:0] winner_move_o;
output logic tie_o,current_player_o;
output logic [2:0] current_screen_o;
output logic [3:0]cursor_pos_o;
assign cursor_pos_o=position_o;
logic pressed_button;
assign pressed_button = btn_i||btn_confirm_i;


//cursor controller
CursorController cc(.btn_i(btn_i), .btn_confirm_i(btn_confirm_i), .position_o(position_o), .confirm_o(confirm_o));
//random
RandomPosition rp(.current_pos_available(current_pos_available), .clk(clk), .reset(reset), .out(out_random),  .confirm(confirm_random));
//mux cursor
logic [3:0] cursor;
logic confirm_position;
assign cursor = position_o;
//assign cursor = (cursor_select_o)? position_o:out_random;
assign confirm_position = (cursor_select_o)? confirm_o:confirm_random;
//board
Board b (.cursor_i(cursor), .confirm_pos_i(confirm_position), .current_player_i(current_player_o), 
			.reset(reset_board_o), .enable_i(enable_board_o), .board_status_o(board_status_o), 
			.current_pos_available_o(current_pos_available_o), .valid_move_o(valid_move_o));

//game end
DetectGameEnd ge(.current_board_i(board_status_o), .game_end_o(game_end_o), .tie_o(tie_o), .winner_o(winner_o), .winner_move_o(winner_move_o));


//game controller
GameController gc(.clk(clk),	.game_ended_i(game_end_o), .tie_i(tie_o), .winner_i(winner_o), .pressed_button_i(pressed_button), .timer_30s_i(timer_30s_i),
								.valid_move_i(valid_move_o), 
								.reset_board_o(reset_board_o), .current_player_o(current_player_o), .enable_board_o(enable_board_o), .cursor_select_o(cursor_select_o), 
								.current_screen_o(current_screen_o) );
								

//30s timer
timer30 t30s(.clk(clk), .reset(valid_move_o), .out(timer_30s_i)); 



endmodule
module GameController(game_ended_i, tie_i, winner_i, pressed_button_i, timer_30s_i, valid_move_i, reset_board_o, current_player_o, enable_board_o, cursor_select_o, current_scrren_o );
input logic game_ended_i, tie_i, winner_i, pressed_button_i, timer_30s_i, valid_move_i;
output logic  reset_board_o, current_player_o, enable_board_o, cursor_select_o;
output logic [2:0] current_scrren_o;

logic [2:0] current_state_o=0;

always @*
//if(timer_30s_i)
//begin
//case(current_state_o):
//1:current_state_o
//default:begin end
//end





begin
	case(current_state_o)
		0:begin // pantalla inicial
		reset_board_o=1;
		current_player_o=0;
		enable_board_o=0;
		cursor_select_o=0;
		current_scrren_o=0;
		if(pressed_button_i)
			begin
			current_state_o=1;
			end
		end
		
		1:begin // Turno Jugador 1
		reset_board_o=0;
		current_player_o=0;
		enable_board_o=1;
		cursor_select_o=0;
		current_scrren_o=1;
		if(valid_move_i)
		begin
		current_state_o=2;
		end
		if(timer_30s_i)
		begin
		current_state_o=3;
		end
		
		end
		
		2:begin // Turno Jugador 2
		reset_board_o=0;
		current_player_o=1;
		enable_board_o=1;
		cursor_select_o=0;
		current_scrren_o=1;
		if(valid_move_i)
		begin
		current_state_o=1;
		end
		
		if(timer_30s_i)
		begin
		current_state_o=4;
		end
		
		end
		
		
		3:begin // Random Jugador 1
		reset_board_o=0;
		current_player_o=0;
		enable_board_o=1;
		cursor_select_o=1;
		current_scrren_o=1;
		if(valid_move_i)
		begin
		current_state_o=2;
		end
		end
		
		4:begin // Random Jugador 2
		reset_board_o=0;
		current_player_o=1;
		enable_board_o=1;
		cursor_select_o=1;
		current_scrren_o=1;
		if(valid_move_i)
		begin
		current_state_o=1;
		end
		end
		
		5:begin // jugada ganadora/ empate
		reset_board_o=0;
		current_player_o=1;
		enable_board_o=0;
		cursor_select_o=0;
		current_scrren_o=1;
		if(pressed_button_i)
		begin
		current_state_o=6;
		end
		end
		
		6:begin // mostrar ganador/ empate ("Player 1 wins","tie")
		reset_board_o=0;
		current_player_o=1;
		enable_board_o=0;
		cursor_select_o=0;
		current_scrren_o=1;
		if(pressed_button_i)
		begin
		current_state_o=0;
		end
		end
		
		
		
		default: begin end
	endcase
end







endmodule
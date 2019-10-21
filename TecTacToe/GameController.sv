module GameController(clk,	game_ended_i, tie_i, winner_i, pressed_button_i, timer_30s_i,
								valid_move_i, 
								reset_board_o, current_player_o, enable_board_o, cursor_select_o, 
								current_screen_o );
input logic clk;						
input logic game_ended_i, tie_i, winner_i, pressed_button_i, timer_30s_i, valid_move_i;
output logic  reset_board_o, current_player_o, enable_board_o, cursor_select_o;
output logic [2:0] current_screen_o;

logic [2:0] current_state_o=0;

always @(posedge clk)
begin
	case(current_state_o)
		3'b000:begin // pantalla inicial
		reset_board_o=1;
		current_player_o=0;
		enable_board_o=0;
		cursor_select_o=0;
		current_screen_o=0;
		if(pressed_button_i) current_state_o=1;
		end
		
		3'b001:begin // Turno Jugador 1
		reset_board_o=0;
		current_player_o=0;
		enable_board_o=1;
		cursor_select_o=0;
		current_screen_o=1;
		if(valid_move_i) current_state_o=2;
		if(timer_30s_i) current_state_o=3;
		if(game_ended_i) current_state_o=6;
		end
		
		3'b010:begin // Turno Jugador 2
		reset_board_o=0;
		current_player_o=1;
		enable_board_o=1;
		cursor_select_o=0;
		current_screen_o=1;
		if(valid_move_i) current_state_o=1;
		if(timer_30s_i) current_state_o=4;
		if(game_ended_i) current_state_o=6;

		
		end
		
		
		3'b011:begin // Random Jugador 1
		reset_board_o=0;
		current_player_o=0;
		enable_board_o=1;
		cursor_select_o=1;
		current_screen_o=1;
		if(valid_move_i) current_state_o=2;
		end
		
		3'b100:begin // Random Jugador 2
		reset_board_o=0;
		current_player_o=1;
		enable_board_o=1;
		cursor_select_o=1;
		current_screen_o=1;
		if(valid_move_i) current_state_o=1;
		end
		
		3'b101:begin // jugada ganadora/ empate
		reset_board_o=0;
		current_player_o=1;
		enable_board_o=0;
		cursor_select_o=0;
		current_screen_o=1;
		if(pressed_button_i) current_state_o=6;
		
		end
		
		3'b110:begin // mostrar ganador/ empate ("Player 1 wins","tie")
		reset_board_o=0;
		current_player_o=1;
		enable_board_o=0;
		cursor_select_o=0;
		current_screen_o=1;
		if(pressed_button_i) current_state_o=0;
		end
		
		
		
		default: begin end
	endcase
end







endmodule
module GameController_tb();

logic game_ended_i, tie_i, winner_i, pressed_button_i, timer_30s_i, valid_move_i;
logic  reset_board_o, current_player_o, enable_board_o, cursor_select_o;
logic [2:0] current_screen_o;
logic clk;
GameController DUT(.*);

always #1 clk = ~clk;
		
initial
begin
clk=0;
pressed_button_i=0;
#5;
pressed_button_i=1;
#5;
end


endmodule
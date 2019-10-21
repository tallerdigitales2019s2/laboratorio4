module TecTacToe(clk,
						btn_i,btn_confirm_i,
						vga_clock , SYNC_N, v_en, R, G , B, V_SYNC, H_SYNC);
						
						
						
input logic clk,btn_i,btn_confirm_i;
output logic vga_clock,SYNC_N,v_en,V_SYNC,H_SYNC;
output logic [7:0]R ,G,B;
logic btn,btn_confirm;

not(btn,btn_i);
not(btn_confirm,btn_confirm_i);


//assign btn_right=~btn_right_i ;
//assign btn_down=~btn_down_i;
//assign btn_confirm=~btn_confirm_i;


VGA_MODULE vga( 	.clk(clk), .vga_clock(vga_clock), .SYNC_N(SYNC_N),  
						.v_en(v_en),  .R(R),  .G(G) ,  .B(B),  .V_SYNC(V_SYNC),  
						.H_SYNC(H_SYNC),
						.current_screen_i(current_screen_o),.board_status_i(board_status_o),.cursor_pos_i(cursor_pos));
//VGA_MODULE vga( 	.clk(clk),.x(x),.y(y), .vga_clock(vga_clock), .SYNC_N(SYNC_N), 
//						.v_en(v_en), .V_SYNC(V_SYNC),  .H_SYNC(H_SYNC));

Game game(.clk(clk), .btn_i(btn),  .btn_confirm_i(btn_confirm),
		.board_status_o(board_status_o), .winner_move_o(),.tie_o() ,.current_screen_o(current_screen_o),.current_player_o(),
		.cursor_pos_o(cursor_pos));
//GameDrawer gd(.clk(clk), .x_i(x), .y_i(y),.board_status_i(board_status_o),.current_screen_i(current_screen_o),.R_o(R),.G_o(G),.B_o(B));
		
endmodule
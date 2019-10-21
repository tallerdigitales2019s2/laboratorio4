module DetectGameEnd(current_board_i, game_end_o, tie_o, winner_o, winner_move_o);
input logic [8:0][1:0] current_board_i;
output logic game_end_o,tie_o,winner_o;
output logic [8:0] winner_move_o;
logic [7:0] win_v, winner_v;
logic [8:0]active_positions;


genvar i;
generate
	for (i=0; i<3; i=i+1) begin : gen_aux_h
		DetectGameEndAux(.positions_vector({current_board_i[0+3*i],current_board_i[1+3*i],current_board_i[2+3*i]}),.win_o(win_v[i]),.winner_o(winner_v[i]));
	end
	
	for (i=0; i<3; i=i+1) begin : gen_aux_v
		DetectGameEndAux(.positions_vector({current_board_i[0+i],current_board_i[2+i],current_board_i[6+i]}),.win_o(win_v[3+i]),.winner_o(winner_v[3+i]));
	end
endgenerate
DetectGameEndAux(.positions_vector({current_board_i[0],current_board_i[4],current_board_i[8]}),.win_o(win_v[6]),.winner_o(winner_v[6]));
DetectGameEndAux(.positions_vector({current_board_i[6],current_board_i[4],current_board_i[2]}),.win_o(win_v[7]),.winner_o(winner_v[7]));


assign active_positions ={	current_board_i[0][1],current_board_i[1][1],current_board_i[2][1],
										current_board_i[3][1],current_board_i[4][1],current_board_i[5][1],
										current_board_i[6][1],current_board_i[7][1],current_board_i[8][1]};


assign winner_o = |winner_v;

assign tie_o =  &active_positions    &&  !(|win_v);

assign game_end_o = tie_o || (|win_v);

always @*
begin
	case(win_v)
		8'b00000000:begin end
		8'b00000001:winner_move_o= 9'b111000000;
		8'b00000010:winner_move_o= 9'b000111000;
		8'b00000100:winner_move_o= 9'b000000111;
		8'b00001000:winner_move_o= 9'b100100100;
		8'b00010000:winner_move_o= 9'b010010010;
		8'b00100000:winner_move_o= 9'b001001001;
		8'b01000000:winner_move_o= 9'b100010001;
		8'b10000000:winner_move_o= 9'b001010100;
	endcase
end





endmodule
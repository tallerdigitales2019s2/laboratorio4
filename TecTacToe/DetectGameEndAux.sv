module DetectGameEndAux(positions_vector, win_o, winner_o);
input logic [2:0][1:0] positions_vector;
output logic win_o, winner_o;
logic all_equal_1,all_equal_2,all_equal, all_active;

xnor(all_equal_1 , positions_vector[0][0], positions_vector[1][0]);
xnor(all_equal_2 , positions_vector[1][0], positions_vector[2][0]);
and(all_equal, all_equal_1,all_equal_2);
and(all_active, positions_vector[0][1], positions_vector[1][1], positions_vector[2][1]);

and(winner_o, all_equal,positions_vector[0][0],all_active);

and(win_o, all_equal,all_active);


endmodule
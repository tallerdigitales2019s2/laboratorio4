module DetectGameEndAux_tb();
logic [2:0][1:0] positions_vector ;
logic win_o, winner_o;



DetectGameEndAux DUT(.*);
initial
begin
#5;
positions_vector[0]=2'b00;
positions_vector[1]=2'b00;
positions_vector[2]=2'b00;
#5;
positions_vector[0]=2'b10;
positions_vector[1]=2'b10;
positions_vector[2]=2'b10;
#5;
positions_vector[0]=2'b10;
positions_vector[1]=2'b10;
positions_vector[2]=1'b10;
#5;
positions_vector[0]=2'b11;
positions_vector[1]=2'b11;
positions_vector[2]=2'b11;
#5;
positions_vector[0]=2'b11;
positions_vector[1]=2'b01;
positions_vector[2]=2'b11;
#5;
positions_vector[0]=2'b11;
positions_vector[1]=2'b10;
positions_vector[2]=2'b11;
#5;
end






endmodule
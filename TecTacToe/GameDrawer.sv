module GameDrawer(clk, x_i, y_i,board_status_i, cursor_pos_i,current_screen_i,R_o,G_o,B_o);
input logic clk;
input integer x_i,y_i;
input logic [8:0][1:0] board_status_i ;
input logic [2:0] current_screen_i;
output logic [7:0]R_o,G_o,B_o;
logic[8:0] sq;
input logic[3:0] cursor_pos_i;

assign sq[0] = ( ((x_i>=0) && (x_i<100)) && ((y_i>=0) && (y_i<100)));
assign sq[1] = ( (x_i>=100 && x_i<200) && (y_i>=0 && y_i<100));
assign sq[2] = ( (x_i>=200 && x_i<300) && (y_i>=0 && y_i<100));
assign sq[3] = ( (x_i>=0 && x_i<100) && (y_i>=100 && y_i<200));
assign sq[4] = ( (x_i>=100 && x_i<200) && (y_i>=100 && y_i<200));
assign sq[5] = ( (x_i>=200 && x_i<300) && (y_i>=100 && y_i<200));
assign sq[6] = ( (x_i>=0 && x_i<100) && (y_i>=200 && y_i<300));
assign sq[7] = ( (x_i>=100 && x_i<200) && (y_i>=200 && y_i<300));
assign sq[8] = ( (x_i>=200 && x_i<300) && (y_i>=200 && y_i<300));



always @(posedge clk)
		case(current_screen_i)
		0:begin 
			R_o=0;
			G_o=0;
			B_o=y_i%255;
		end
		
		1:begin 
			case(sq)
	//		8'b00000000:begin
	//			R_o=255;
	//			G_o=0;
	//			B_o=0 ;
	//		end
			9'b000000001:begin
				R_o=50;
				G_o=0;
				B_o=0;
				if(cursor_pos_i==4'b0000)R_o=255;
			end
			9'b000000010:begin
				R_o=0;
				G_o=50;
				B_o=0 ;
				if(cursor_pos_i==4'b0001)R_o=255;
			end
			9'b000000100:begin
				R_o=0;
				G_o=0;
				B_o=50 ;
				if(cursor_pos_i==4'b0010)R_o=255;
			end
			9'b000001000:begin
				R_o=50;
				G_o=0;
				B_o=0 ;
				if(cursor_pos_i==4'b0011)R_o=255;
			end
			9'b000010000:begin
				R_o=0;
				G_o=50;
				B_o=0 ;
				if(cursor_pos_i==4'b0100)R_o=255;
			end
			9'b000100000:begin
				R_o=0;
				G_o=0;
				B_o=50 ;
				if(cursor_pos_i==4'b0101)R_o=255;
			end
			9'b001000000:begin
				R_o=50;
				G_o=0;
				B_o=0 ;
				if(cursor_pos_i==4'b0110)R_o=255;
			end
			9'b010000000:begin
				R_o=0;
				G_o=50;
				B_o=0 ;
				if(cursor_pos_i==4'b0111)R_o=255;
			end
			9'b100000000:begin
				R_o=0;
				G_o=0;
				B_o=50 ;
				if(cursor_pos_i==4'b1000)R_o=255;
			end
			
			default:  
				begin
					R_o=255;
					G_o=255;
					B_o=255;
				end
			
			endcase
		end
		default:begin 
		R_o=255;
		G_o=255;
		B_o=255 ;
		end
		
		endcase
endmodule
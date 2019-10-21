module GameDrawer(clk, x_i, y_i,board_status_i,current_screen_i,R_o,G_o,B_o);
input logic clk;
input integer x_i,y_i;
input logic [8:0][1:0] board_status_i ;
input logic [2:0] current_screen_i;
output logic [7:0]R_o,G_o,B_o;
logic c0,c1,c2,c3,c4,c5,c6,c7,c8;
assign c0 = (x_i>=200);
//assign c0 = ( ((x_i>=0) && (x_i<100)) && ((y_i>=0) && (y_i<100)));
//assign c1 = ( (x_i>=100 && x_i<200) && (y_i>=0 && y_i<100));
//assign c2 = ( (x_i>=200 && x_i<300) && (y_i>=0 && y_i<100));
//assign c3 = ( (x_i>=0 && x_i<100) && (y_i>=100 && y_i<200));
//assign c4 = ( (x_i>=100 && x_i<200) && (y_i>=100 && y_i<200));
//assign c5 = ( (x_i>=200 && x_i<300) && (y_i>=100 && y_i<200));
//assign c6 = ( (x_i>=0 && x_i<100) && (y_i>=200 && y_i<300));
//assign c7 = ( (x_i>=100 && x_i<200) && (y_i>=200 && y_i<300));
//assign c8 = ( (x_i>=200 && x_i<300) && (y_i>=200 && y_i<300));



	always@*
		case(current_screen_i)
		0:begin 
			R_o=0;
			G_o=0;
			B_o=y_i%255 ;
		end
		
		1:begin 
		if(c0)
		begin
			R_o=255;
			G_o=0;
			B_o=0 ;
		end
		else
		begin
			R_o=0;
			G_o=x_i%255;
			B_o=0;
		end
		end
		default:begin 
		R_o=255;
		G_o=255;
		B_o=255 ;
		end
		
		endcase
endmodule
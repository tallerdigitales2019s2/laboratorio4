module VGA_MODULE( clk,vga_clock, SYNC_N, v_en, R, G ,B, V_SYNC, H_SYNC);
	input logic clk;
	output logic vga_clock, SYNC_N, v_en, V_SYNC, H_SYNC;
	output logic [7:0] R,G,B;
	
	
	
	integer x,y;
	logic sq_a, sq_b, sq_c, sq_d;
	
	CLK_DIVIDER testclk (.in_clk(clk), .out_clk(vga_clock));
	//H_COUNTER_TB test (.clk_in(clk),.clk_out(test_clk));
	SIGNAL_SYNC sync (.CLOCK(vga_clock),.V_EN(v_en), .H_COUNTER(x), .V_COUNTER(y),.V_SYNC(V_SYNC), .H_SYNC(H_SYNC));
	//vgaController vgaCont(.clk(vga_clock),.hsync(H_SYNC), .vsync(V_SYNC), .blank_b(v_en),.H_CURRENT_PIXEL(x),.V_CURRENT_PIXEL(y));
//	test3 coso ();
	DrawSquare ds(.clk(clk),.x(x),.y(y),.R(R),.G(G),.B(B));
		//jalar varas del rom o memoria o lo que putas usemos()

//				//mientras dibujamos tres cuadrados bien piedros
		 assign line_a = ((x > 205) & (y >  0) & (x < 213) & (y < 480)) ? 1 : 0;
		 assign line_b = ((x > 418) & (y > 0) & (x < 426) & (y < 480)) ? 1 : 0;
		 assign line_c = ((x > 0) & (y > 148) & (x < 640) & (y < 154)) ? 1 : 0;
		 assign line_d = ((x > 0) & (y > 298) & (x < 640) & (y < 304)) ? 1 : 0;

//		 assign R[7:0] = (line_a == 1 || line_b ==1 || line_c || line_d) ?   8'b11111111 : 8'b00000000 ;         // square b is red
//		 assign G[7:0] = 0;
//		 assign B[7:0] = 0;


	

	
endmodule 
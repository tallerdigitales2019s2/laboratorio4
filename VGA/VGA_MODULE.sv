module VGA_MODULE(input logic clk, output logic vga_clock, output logic SYNC_N=1, output logic v_en=0, output logic [7:0]R, output logic [7:0]G , output logic [7:0]B, output logic V_SYNC=1, output logic H_SYNC=1, output logic test_clk=0);
	integer x =0;
	integer y = 0;

	logic sq_a, sq_b, sq_c, sq_d;
	
	CLK_DIVIDER testclk (.in_clk(clk), .out_clk(vga_clock));
	//H_COUNTER_TB test (.clk_in(clk),.clk_out(test_clk));
	//SIGNAL_SYNC sync (.CLOCK(vga_clock),.V_EN(v_en), .H_COUNTER(x), .V_COUNTER(y),.V_SYNC(V_SYNC), .H_SYNC(H_SYNC));
	vgaController vgaCont(.clk(vga_clock),.hsync(H_SYNC), .vsync(V_SYNC), .sync_b(SYNC_N), .blank_b(v_en),.H_CURRENT_PIXEL(x),.V_CURRENT_PIXEL(y));
	
		//jalar varas del rom o memoria o lo que putas usemos()

//				//mientras dibujamos tres cuadrados bien piedros
//		 assign sq_a = ((x > 120) & (y >  40) & (x < 280) & (y < 200)) ? 1 : 0;
//		 assign sq_b = ((x > 200) & (y > 120) & (x < 360) & (y < 280)) ? 1 : 0;
//		 assign sq_c = ((x > 280) & (y > 200) & (x < 440) & (y < 360)) ? 1 : 0;
//		 assign sq_d = ((x > 360) & (y > 280) & (x < 520) & (y < 440)) ? 1 : 0;
//
//		 assign R[7] = sq_b;         // square b is red
//		 assign G[7] = sq_a | sq_d;  // squares a and d are green
//		 assign B[7] = sq_c;         // square c is blue


	

	
endmodule 

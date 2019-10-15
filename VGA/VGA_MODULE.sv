module VGA_MODULE(input logic CLK, output logic [7:0]R, output logic [7:0]G , output logic [7:0]B, output logic V_SYNC, H_SYNC);
	integer x =0;
	integer y = 0;
//	logic v_sync = 1;
//	logic h_sync = 1;
	logic v_en;
	logic sq_a, sq_b, sq_c, sq_d;
	

	SIGNAL_SYNC sync (.CLOCK(CLK),.V_EN(v_en), .H_COUNTER(x), .V_COUNTER(y),.V_SYNC(V_SYNC), .H_SYNC(H_SYNC));
//	
//		//jalar varas del rom o memoria o lo que putas usemos()
//
//				//mientras dibujamos tres cuadrados bien piedros
//		 assign sq_a = ((x > 120) & (y >  40) & (x < 280) & (y < 200)) ? 1 : 0;
//		 assign sq_b = ((x > 200) & (y > 120) & (x < 360) & (y < 280)) ? 1 : 0;
//		 assign sq_c = ((x > 280) & (y > 200) & (x < 440) & (y < 360)) ? 1 : 0;
//		 assign sq_d = ((x > 360) & (y > 280) & (x < 520) & (y < 440)) ? 1 : 0;
//
//		 assign R[7] = sq_b;         // square b is red
//		 assign G[7] = sq_a | sq_d;  // squares a and d are green
//		 assign B[7] = sq_c;         // square c is blue
//
//		
	 
    
	
endmodule 
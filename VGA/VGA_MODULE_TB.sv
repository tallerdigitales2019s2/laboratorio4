`timescale 1 ps / 1 ps
module VGA_MODULE_TB();
	logic clk;
	logic vga_clk;
	logic v_sync;
	logic h_sync;
	logic write_en;
	//pll_clock_0002 testclk (.refclk(clk), .outclk_0(vga_clk) );
	SIGNAL_SYNC uut (.CLOCK(clk),.V_EN(write_en), .V_SYNC(v_sync), .H_SYNC(h_sync));
	initial
		clk = 1'b0;
	always
		#1 clk = ~clk;
	initial	
		begin
		
		end

	
endmodule 
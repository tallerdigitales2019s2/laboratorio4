module tb_timer30;
  logic clk; 
  logic reset;
  logic [4:0] out;
 

  timer30 timer (.clk (clk), .reset (reset), .out(out));
 
  always #5 clk = ~clk;
  
  initial begin
    clk <= 0;
    reset <= 0;
	 
	 #20 reset <= 1 ;
	 #60 reset <= 0;
	 #200 reset <= 1;
  end
endmodule

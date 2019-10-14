module RandomPosition (input logic current_pos_available, input logic clk,input logic reset, output logic [3:0] out, output logic confirm);
	logic [3:0] out2;
	randomNumber randomN (.clk(clk), .reset(reset),.ini_value(4'b1111), .random(out2));

   assign confirm = current_pos_available ?  1'b1  : 1'b0;
  assign out = (out2<=8) ?  out2  : 4'b0000;

		

endmodule


module randomNumber(input logic clk, input logic reset, input logic [3:0] ini_value,  output logic [3:0] random);   
	logic [3:0] counter;  
	logic in;  
	xor xor_u(in,counter[1],counter[3]);  
	FF_D FFD0(.q(counter[0]), .d(counter[3]), .reset(reset), .clk(clk),.init_value(ini_value[0]));  
	FF_D FFD1(.q(counter[1]), .d(counter[0]), .reset(reset), .clk(clk),.init_value(ini_value[1]));  
	FF_D FFD2(.q(counter[2]), .d(in), .reset(reset), .clk(clk),.init_value(ini_value[2]));  
	FF_D FFD3(.q(counter[3]), .d(counter[2]), .reset(reset), .clk(clk),.init_value(ini_value[3]));  
	assign random = counter;  
endmodule    

module FF_D (output logic q, input logic d, input logic reset, input logic clk, input logic init_value);    
	 always @(posedge clk or negedge reset)  
	 if (~reset)  
		q <= init_value;    
	 else  
		q <= d; 
endmodule  

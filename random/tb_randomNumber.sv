/*module tb_randomNumber;
	logic clk, reset;
	logic [3:0] ini_value;
	logic [3:0] random;

	randomNumber randomN (.clk(clk), .reset(reset), .ini_value(ini_value), .random(random));  
					  
	always #5 clk=~clk;				  

	initial begin
		clk=0;
		reset=0;
		ini_value=4'b1111;

		#20;
		reset=1;
	end
endmodule */

module tb_randomNumber;
	logic current_pos_available, confirm, clk,reset;
	logic [3:0] out;
	
	RandomPosition n (.current_pos_available(current_pos_available), .clk(clk),.reset(reset), .out(out), .confirm(confirm));
	always #5 clk=~clk;
	initial begin 
		clk = 0;
		reset=0;
		#1;
		reset=1;
		
		current_pos_available <= 1;
		#60 current_pos_available <= 0;
	end
endmodule

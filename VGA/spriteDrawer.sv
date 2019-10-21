module spriteDrawer(clk,x,y,q);
input logic clk;
input integer x,y;
logic [13:0]  address;
output	[23:0]  q;
assign address = x*100+y;
sprite_cars sprite_c2 (.clock(clk),.address(address),.q(q));
endmodule
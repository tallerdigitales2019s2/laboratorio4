module DrawSquare (clk,x,y, R,G,B);
input clk;
input integer x,y;
output integer R,G,B;
integer sp_x,sp_y;
logic [23:0] data;
spriteDrawer sp(.clk(clk),.x(sp_x),.y(sp_y),.q(data) );


always @(posedge clk)
begin
if((x>=100 && x<200) && (y>=300 && y<400))
begin 
sp_x=x-100;
sp_y=y-300;
//R=sp_x;
//G=0;
//B=0;
R=data[7:0];
G=data[15:8];
B=data[23:16];



end
else
begin
R=0;
G=0;
B=0;
end

end

endmodule
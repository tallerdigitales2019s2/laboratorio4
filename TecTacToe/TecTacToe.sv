module TecTacToe(clk,vga_clock , SYNC_N, v_en, R, G , B, V_SYNC, H_SYNC);
input logic clk;
output logic vga_clock,SYNC_N,v_en,V_SYNC,H_SYNC;
output logic [7:0]R ,G,B;
VGA_MODULE vga( .clk(clk), .vga_clock(vga_clock), .SYNC_N(SYNC_N),  .v_en(v_en),  .R(R),  .G(G) ,  .B(B),  .V_SYNC(V_SYNC),  .H_SYNC(H_SYNC));
endmodule
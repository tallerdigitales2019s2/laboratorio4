module V_COUNTER (input logic CLOCK,output logic V_SYNC, output integer CURRENT_PIXEL = 0);
	integer WHOLE_LINE = 525;
	integer VISIBLE_AREA = 480;
	integer FRONT_PORCH = 10;
	integer SYNC_PULSE = 2; 

	
	always @ (CLOCK) begin
		if(CURRENT_PIXEL == WHOLE_LINE) begin
				CURRENT_PIXEL = 0;
			end
		else
				CURRENT_PIXEL ++;
		end
	
	assign V_SYNC = ~((CURRENT_PIXEL >= (VISIBLE_AREA+FRONT_PORCH)) & (CURRENT_PIXEL < (VISIBLE_AREA+FRONT_PORCH+SYNC_PULSE)));
	
endmodule 
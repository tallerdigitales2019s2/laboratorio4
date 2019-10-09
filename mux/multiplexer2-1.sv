module mux_2_to_1 (input logic [3:0] course_contro, input logic [3:0] random_pos, input logic [1:0] sel, output logic [3:0] out);
	always @ (course_contro or random_pos or sel)
		begin
			case (sel)
				2'b00 : out <= course_contro;
				2'b01 : out <= random_pos;
			endcase
		end
endmodule
	
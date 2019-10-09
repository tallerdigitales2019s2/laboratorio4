module multiplexerConfirm (input logic course_contro, input logic random_pos, input logic [1:0] sel, output logic out);
	always @ (course_contro or random_pos or sel)
		begin
			case (sel)
				2'b00 : out <= course_contro;
				2'b01 : out <= random_pos;
			endcase
		end
endmodule

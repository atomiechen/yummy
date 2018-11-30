module mux_16_2(
	input wire[15:0] In1,
	input wire[15:0] In2,
	input wire Ctrl,
	output reg[15:0] Out
	);

	always @(*) begin
		case (Ctrl)
			1: Out <= In1;
			0: Out <= In2;
		endcase
	end

endmodule

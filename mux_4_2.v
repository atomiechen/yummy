`timescale 1ns / 1ps

module mux_4_2(
	input wire[3:0] In1,
	input wire[3:0] In2,
	input wire Ctrl,
	output reg[3:0] Out
	);

	always @(*) begin
		case (Ctrl)
			1: Out <= In1;
			0: Out <= In2;
		endcase
	end

endmodule

module mux_16_3(
	input wire[15:0] In1,
	input wire[15:0] In2,
	input wire[15:0] In3,
	input wire[1:0] Ctrl,
	output reg[15:0] Out
	);
	always @(*) begin
		case (Ctrl)
			1: Out <= In1;
			2: Out <= In2;
			3: Out <= In3;
			default: Out <= 16'bz;
		endcase
	end

endmodule

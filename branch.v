module branch(
	input wire[1:0] InsB1, // instruction branch type
	input wire[15:0] Src, // the number to judge

	output reg InsBRst1 // need to reset branch or not
	);

	always @(*) begin
		if ((InsB1 == 2'b10 && Src != 16'b0) || (InsB1 == 2'b01 && Src == 16'b0)) begin
			InsBRst1 <= 1;
		end else begin
			InsBRst1 <= 0;
		end
	end

endmodule

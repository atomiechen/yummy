module pause(
	input wire MemotoReg1,
	input wire[3:0] RegWriteIndex1,
	input wire[3:0] RegReadIndex10,
	input wire[3:0] RegReadIndex20,

	output reg Pause
	);

	always @(*) begin
		if (MemotoReg1 && ((RegWriteIndex1 == RegReadIndex10) || (RegWriteIndex1 == RegReadIndex20))) begin
			Pause <= 1;
		end else begin
			Pause <= 0;
		end
	end

endmodule

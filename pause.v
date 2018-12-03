module pause(
	input wire MemotoReg1,
	input wire[3:0] RegWriteIndex1,
	input wire[3:0] RegReadIndex10,
	input wire[3:0] RegReadIndex20,

	input wire[15:0] Result1, // address [new]
	input wire[15:0] DataIn1, // data to write to im (if possible) [new]
	input wire MemWrite1, // if need to write to im [new]

	output wire Pause,

	output wire[15:0] ImWriteAddr, // [new]
	output wire[15:0] ImWriteData, // [new]
	output wire ImWrite // [new]
	);

	assign ImWrite = (Result1 >= 16'b0100000000000000 && Result1 < 16'b1000000000000000)? MemWrite1 : 0;
	assign ImWriteAddr = Result1; // address
	assign ImWriteData = DataIn1; // data
	assign Pause = ((MemotoReg1 && ((RegWriteIndex1 == RegReadIndex10) || (RegWriteIndex1 == RegReadIndex20))) 
		|| ((Result1 >= 16'b0100000000000000 && Result1 < 16'b1000000000000000) && MemWrite1))? 1 : 0;

	// always @(*) begin
	// 	if (MemotoReg1 && ((RegWriteIndex1 == RegReadIndex10) || (RegWriteIndex1 == RegReadIndex20))) begin
	// 		Pause <= 1;
	// 	end else begin
	// 		Pause <= 0;
	// 	end
	// end

endmodule

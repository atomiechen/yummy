module mem_wb(
	input wire Clk,
	input wire Rst,

	input wire RegWrite2,
	input wire MemotoReg2,
	input wire[15:0] DataOut2,
	input wire[15:0] Result2,
	input wire[3:0] RegWriteIndex2,

	output reg RegWrite3,
	output reg MemotoReg3,
	output reg[15:0] DataOut3,
	output reg[15:0] Result3,
	output reg[3:0] RegWriteIndex3
	);

	always @(posedge Clk or negedge Rst) begin
		if (!Rst) begin
			RegWrite3 <= 0;
			MemotoReg3 <= 0;
			DataOut3 <= 0;
			Result3 <= 0;
			RegWriteIndex3 <= 0;
		end else begin
			RegWrite3 <= RegWrite2;
			MemotoReg3 <= MemotoReg2;
			DataOut3 <= DataOut2;
			Result3 <= Result2;
			RegWriteIndex3 <= RegWriteIndex2;
		end
	end

endmodule

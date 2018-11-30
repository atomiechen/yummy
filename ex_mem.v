module ex_mem(
	input wire Clk,
	input wire Rst,

	input wire RegWrite1,
	input wire MemotoReg1,
	input wire MemWrite1,
	input wire MemRead1,
	input wire[15:0] Result1,
	input wire[15:0] DataIn1,
	input wire[3:0] RegWriteIndex1,

	output reg RegWrite2,
	output reg MemotoReg2,
	output reg MemWrite2,
	output reg MemRead2,
	output reg[15:0] Result2,
	output reg[15:0] DataIn2,
	output reg[3:0] RegWriteIndex2
	);

	always @(posedge Clk or negedge Rst) begin
		if (!Rst) begin
			RegWrite2 <= 0;
			MemotoReg2 <= 0;
			MemWrite2 <= 0;
			MemRead2 <= 0;
			Result2 <= 0;
			DataIn2 <= 0;
			RegWriteIndex2 <= 0;
		end else begin
			RegWrite2 <= RegWrite1;
			MemotoReg2 <= MemotoReg1;
			MemWrite2 <= MemWrite1;
			MemRead2 <= MemRead1;
			Result2 <= Result1;
			DataIn2 <= DataIn1;
			RegWriteIndex2 <= RegWriteIndex1;
		end
	end

endmodule

/*
	TODO
	delete mem0 mem1
*/

`include "config.v"

module id_ex(
	input wire Clk,
	input wire Rst,

	input wire RegWrite0,
	input wire MemotoReg0,
	input wire MemWrite0,
	input wire MemRead0,
	input wire Mem0,

	input wire[3:0] AluOp0,
	input wire[15:0] PcAddr0,

	input wire[15:0] RegData10,
	input wire[15:0] RegData20,
	input wire[1:0] Flag0,

	input wire[3:0] RegWriteIndex0,
	input wire[3:0] RegReadIndex10,
	input wire[3:0] RegReadIndex20,

	input wire InsJ0,
	input wire[1:0] InsB0,

	input wire AluSrc, // choose immediate or not
	input wire[15:0] Dest, // 16 bit immediate


	output reg RegWrite1,
	output reg MemotoReg1,
	output reg MemWrite1,
	output reg MemRead1,
	output reg Mem1,

	output reg[3:0] AluOp1,
	output reg[15:0] PcAddr1,

	output reg[15:0] RegData11,
	output reg[15:0] RegData21,
	output reg[1:0] Flag1,

	output reg[3:0] RegWriteIndex1,
	output reg[3:0] RegReadIndex11,
	output reg[3:0] RegReadIndex21,

	output reg InsJ1,
	output reg[1:0] InsB1,

	output reg AluSrc1,
	output reg[15:0] Dest1
	);

	always @(posedge Clk or negedge Rst) begin
		if (!Rst) begin
			RegWrite1 <= 0;
			MemotoReg1 <= 0;
			MemWrite1 <= 0;
			MemRead1 <= 0;
			Mem1 <= 0;
			AluOp1 <= `no_alu_op;
			PcAddr1 <= 1;
			RegData11 <= 0;
			RegData21 <= 0;
			Flag1 <= 0;
			RegWriteIndex1 <= 0;
			RegReadIndex11 <= 0;
			RegReadIndex21 <= 0;
			InsJ1 <= 0;
			InsB1 <= `NB;
			AluSrc1 <= 0;
			Dest1 <= 0;
		end else begin
			RegWrite1 <= RegWrite0;
			MemotoReg1 <= MemotoReg0;
			MemWrite1 <= MemWrite0;
			MemRead1 <= MemRead0;
			Mem1 <= Mem0;
			AluOp1 <= AluOp0;
			PcAddr1 <= PcAddr0;
			RegData11 <= RegData10;
			RegData21 <= RegData20;
			Flag1 <= Flag0;
			RegWriteIndex1 <= RegWriteIndex0;
			RegReadIndex11 <= RegReadIndex10;
			RegReadIndex21 <= RegReadIndex20;
			InsJ1 <= InsJ0;
			InsB1 <= InsB0;
			AluSrc1 <= AluSrc;
			Dest1 <= Dest;
		end
	end

endmodule

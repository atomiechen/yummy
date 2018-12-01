/*
	TODO
	delete mem0 mem1
*/

`include "config.v"

module id_ex(
	input wire Clk,
	input wire Rst,
	input wire Pause,

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

	reg RegWrite_tmp;
	reg MemotoReg_tmp;
	reg MemWrite_tmp;
	reg MemRead_tmp;
	reg Mem_tmp;
	reg[3:0] AluOp_tmp;
	reg[15:0] PcAddr_tmp;
	reg[15:0] RegData1_tmp;
	reg[15:0] RegData2_tmp;
	reg[1:0] Flag_tmp;
	reg[3:0] RegWriteIndex_tmp;
	reg[3:0] RegReadIndex1_tmp;
	reg[3:0] RegReadIndex2_tmp;
	reg InsJ_tmp;
	reg[1:0] InsB_tmp;
	reg AluSrc_tmp;
	reg[15:0] Dest_tmp;

	reg Src_flag;

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
			Src_flag <= 0;
		end else if (Pause == 1) begin
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

			RegWrite_tmp <= RegWrite0;
			MemotoReg_tmp <= MemotoReg0;
			MemWrite_tmp <= MemWrite0;
			MemRead_tmp <= MemRead0;
			Mem_tmp <= Mem0;
			AluOp_tmp <= AluOp0;
			PcAddr_tmp <= PcAddr0;
			RegData1_tmp <= RegData10;
			RegData2_tmp <= RegData20;
			Flag_tmp <= Flag0;
			RegWriteIndex_tmp <= RegWriteIndex0;
			RegReadIndex1_tmp <= RegReadIndex10;
			RegReadIndex2_tmp <= RegReadIndex20;
			InsJ_tmp <= InsJ0;
			InsB_tmp <= InsB0;
			AluSrc_tmp <= AluSrc;
			Dest_tmp <= Dest;

			Src_flag <= 1;
		end else if (Src_flag) begin
			RegWrite1 <= RegWrite_tmp;
			MemotoReg1 <= MemotoReg_tmp;
			MemWrite1 <= MemWrite_tmp;
			MemRead1 <= MemRead_tmp;
			Mem1 <= Mem_tmp;
			AluOp1 <= AluOp_tmp;
			PcAddr1 <= PcAddr_tmp;
			RegData11 <= RegData1_tmp;
			RegData21 <= RegData2_tmp;
			Flag1 <= Flag_tmp;
			RegWriteIndex1 <= RegWriteIndex_tmp;
			RegReadIndex11 <= RegReadIndex1_tmp;
			RegReadIndex21 <= RegReadIndex2_tmp;
			InsJ1 <= InsJ_tmp;
			InsB1 <= InsB_tmp;
			AluSrc1 <= AluSrc_tmp;
			Dest1 <= Dest_tmp;

			Src_flag <= 0;
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

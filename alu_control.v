`include "defines.v"

module alu_control(
	input wire[3:0] AluOp1,
	input wire[1:0] Flag1,
	output reg[2:0] AluCtrl1
	);

	always @(*) begin
		if (AluOp1 >= 1 && AluOp1 <= 7) begin
			AluCtrl1 = AluOp1[2:0];
		end else if (AluOp1 == 8) begin
			if (Flag1 == 2'b01) begin // ADDU
				AluCtrl1 = `ALU_ADD;
			end else if (Flag1 == 2'b11) begin // SUBU
				AluCtrl1 = `ALU_SUB;
			end else AluCtrl1 = `ALU_ADD;
		end else if (AluOp1 == 9) begin
			if (Flag1 == 2'b00) begin // SLL
				AluCtrl1 = `ALU_SLL;
			end else if (Flag1 == 2'b11) begin // SRA
				AluCtrl1 = `ALU_SRA;
			end else AluCtrl1 = `ALU_ADD;
		end else AluCtrl1 = `ALU_ADD;
	end

endmodule

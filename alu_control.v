`include "defines.v"

module alu_control(
	input wire[3:0] AluOp1,
	input wire[1:0] Flag1,
	output reg[2:0] AluCtrl1
	);

	always @(*) begin
		case (AluOp1):
			1: begin
				AluCtrl1 = AluOp1[2:0];
			end
			2: begin
				AluCtrl1 = AluOp1[2:0];
			end
			3: begin
				AluCtrl1 = AluOp1[2:0];
			end
			4: begin
				AluCtrl1 = AluOp1[2:0];
			end
			5: begin
				AluCtrl1 = AluOp1[2:0];
			end
			6: begin
				AluCtrl1 = AluOp1[2:0];
			end
			7: begin
				AluCtrl1 = AluOp1[2:0];
			end
			8: begin
				case (Flag1):
					2'b01: begin // ADDU
						AluCtrl1 = `ALU_ADD;
					end
					2'b11: begin // SUBU
						AluCtrl1 = `ALU_SUB;
					end
					default: begin
						AluCtrl1 = `ALU_OR;
					end
				endcase
			end
			9: begin
				case (Flag1):
					2'b00: begin // SLL
						AluCtrl1 = `ALU_SLL;
					end
					2'b11: begin // SRA
						AluCtrl1 = `ALU_SRA;
					end
					default: begin
						AluCtrl1 = `ALU_OR;
					end
				endcase
			end
			default: begin
				AluCtrl1 = `ALU_OR;
			end
		endcase
		// if (AluOp1 >= 1 && AluOp1 <= 7) begin
		// 	AluCtrl1 = AluOp1[2:0];
		// end else if (AluOp1 == 8) begin
		// 	if (Flag1 == 2'b01) begin // ADDU
		// 		AluCtrl1 = `ALU_ADD;
		// 	end else if (Flag1 == 2'b11) begin // SUBU
		// 		AluCtrl1 = `ALU_SUB;
		// 	end else AluCtrl1 = `ALU_OR;
		// end else if (AluOp1 == 9) begin
		// 	if (Flag1 == 2'b00) begin // SLL
		// 		AluCtrl1 = `ALU_SLL;
		// 	end else if (Flag1 == 2'b11) begin // SRA
		// 		AluCtrl1 = `ALU_SRA;
		// 	end else AluCtrl1 = `ALU_OR;
		// end else AluCtrl1 = `ALU_OR;
	end

endmodule

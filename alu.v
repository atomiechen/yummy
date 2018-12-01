`include "defines.v"

module alu(
	input wire[15:0] Src1,
	input wire[15:0] Src2,
	input wire[2:0] AluCtrl1,
	output reg[15:0] Result1,
	output reg Zero1
	);

	always @(*) begin
		case (AluCtrl1)
			`ALU_ADD: begin
				Result1 <= Src1 + Src2;
				Zero1 <= ((Src1 + Src2) == 0);
			end
			`ALU_SUB: begin
				Result1 <= Src1 - Src2;
				Zero1 <= ((Src1 - Src2) == 0);
			end
			`ALU_AND: begin
				Result1 <= Src1 & Src2;
				Zero1 <= ((Src1 & Src2) == 0);
			end
			`ALU_OR: begin
				Result1 <= Src1 | Src2;
				Zero1 <= ((Src1 | Src2) == 0);
			end
			`ALU_NOT: begin
				Result1 <= ~Src1;
				Zero1 <= ((~Src1) == 0);
			end
			`ALU_SLL: begin
				Result1 <= Src1 << Src2;
				Zero1 <= ((Src1 << Src2) == 0);
			end
			`ALU_SRA: begin
				Result1 <= $signed(Src1) >>> Src2;
				Zero1 <= (($signed(Src1) >>> Src2) == 0);
			end
			`ALU_SRL: begin
				Result1 <= Src1 >> Src2;
				Zero1 <= ((Src1 >> Src2) == 0);
			end
			default: begin
				Result1 <= 0;
				Zero1 <= 0;
			end
		endcase
	end
	

endmodule

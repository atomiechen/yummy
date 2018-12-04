// forwarding unit
module fu(
	input wire[3:0] RegWriteIndex2,
	input wire RegWrite2,
	input wire[3:0] RegWriteIndex3,
	input wire RegWrite3,
	input wire[3:0] RegReadIndex11,
	input wire[3:0] RegReadIndex21,

	output reg[1:0] MuxCtrl11,
	output reg[1:0] MuxCtrl21
    );

	// reg mark1 = 1;
	// reg mark2 = 1;

	always @(*) begin
		if (RegWrite2) begin
			if (RegReadIndex11 == RegWriteIndex2) begin
					MuxCtrl11 <= 2;
			end else begin
				MuxCtrl11 <= 1;
			end
			if (RegReadIndex21 == RegWriteIndex2) begin
				MuxCtrl21 <= 2;
			end else begin
				MuxCtrl21 <= 1;
			end
		end else if (RegWrite3) begin
			if (RegReadIndex11 == RegWriteIndex3) begin
				MuxCtrl11 <= 3;
			end else begin
				MuxCtrl11 <= 1;
			end
			if (RegReadIndex21 == RegWriteIndex3) begin
				MuxCtrl21 <= 3;
			end else begin
				MuxCtrl21 <= 1;
			end
		end else begin
			MuxCtrl11 <= 1;
			MuxCtrl21 <= 1;
		end

		// if (RegWrite3 || RegWrite2) begin
		// 	if (RegWrite3) begin // phase 3 need to write a register
		// 		if (RegReadIndex11 == RegWriteIndex3) begin
		// 			MuxCtrl11 <= 3;
		// 			// mark1 <= 0;
		// 		end
		// 		if (RegReadIndex21 == RegWriteIndex3) begin
		// 			MuxCtrl21 <= 3;
		// 			// mark2 <= 0;
		// 		end
		// 	end	
		// 	if (RegWrite2) begin // phase 2 need to write a register
		// 		if (RegReadIndex11 == RegWriteIndex2) begin
		// 			MuxCtrl11 <= 2;
		// 			// mark1 <= 0;
		// 		end
		// 		if (RegReadIndex21 == RegWriteIndex2) begin
		// 			MuxCtrl21 <= 2;
		// 			// mark2 <= 0;
		// 		end
		// 	end		
		// end else begin
		// 	MuxCtrl11 <= 1;
		// 	MuxCtrl21 <= 1;
		// end
		
		/*if (mark1) begin
			MuxCtrl11 <= 1;
		end
		if (mark2) begin
			MuxCtrl21 <= 1;
		end*/
	end

endmodule

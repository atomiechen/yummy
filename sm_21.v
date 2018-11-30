module sm_21(
	input wire Zero,
	input wire[1:0] Mem1,
	output reg[1:0] PcCtrl1
    );

	always @(*) begin
		case (Mem1)
			2'b00: PcCtrl1 <= 3; // must jump
			2'b01: begin // jump when != 0
				if (Zero != 0) begin
					PcCtrl1 <= 3;
				end else begin
					PcCtrl1 <= 1;
				end
			end
			2'b10: begin // jump when == 0
				if (Zero == 0) begin
					PcCtrl1 <= 3;
				end else begin
					PcCtrl1 <= 1;
				end
			end
			2'b11: PcCtrl1 <= 1; // must not jump
		endcase
	end

endmodule

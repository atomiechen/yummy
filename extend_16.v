`include "config.v"
/*
	TODO
	switch case
*/
module extend_16(
	input wire[10:0] Src,
	output reg[15:0] Dest,
	input wire[2:0] SrcGet
	);
always@(*) begin
	case (SrcGet)
		// `IM0: begin
		// 	Dest <= 0;
		// end
		`IM5: begin
			Dest[4:0] <= Src[4:0];
			Dest[15:5] <= (Src[4])? 11'b11111111111 : 11'b00000000000;
		end
		`IM8: begin
			Dest[7:0] <= Src[7:0];
			Dest[15:8] <= (Src[7])? 8'b11111111 : 8'b00000000;
		end
		`IM4: begin
			Dest[3:0] <= Src[3:0];
			Dest[15:4] <= (Src[3])? 12'b111111111111 : 12'b000000000000;
		end
		`IM11: begin
			Dest[10:0] <= Src[10:0];
			Dest[15:11] <= (Src[10])? 5'b11111 : 5'b00000;
		end
		`IM3: begin
			Dest[2:0] <= Src[4:2];
			Dest[15:3] <= (Src[4])? 13'b1111111111111 : 13'b0000000000000;
		end
		`IM_TO8: begin
			Dest <= 16'b0000000000001000;
		end
		default: begin
			Dest <= 0;
		end
	endcase
	// if(SrcGet == `IM0)begin
	// end
	// else if(SrcGet == `IM5)begin
	// 	Dest[4:0] <= Src[4:0];
	// 	Dest[15:5] <= (Src[4])? 11'b11111111111 : 11'b00000000000;
	// end	
	// else if(SrcGet == `IM8)begin
	// 	Dest[7:0] <= Src[7:0];
	// 	Dest[15:8] <= (Src[7])? 8'b11111111 : 11'b00000000;
	// end
	// else if(SrcGet == `IM4)begin
	// 	Dest[3:0] <= Src[3:0];
	// 	Dest[15:4] <= (Src[3])? 12'b111111111111 : 12'b000000000000;
	// end
	// else if(SrcGet == `IM11)begin
	// 	Dest[10:0] <= Src[10:0];
	// 	Dest[15:11] <= (Src[10])? 5'b11111 : 5'b00000;
	// end
	// else if(SrcGet == `IM3)begin
	// 	Dest[2:0] <= Src[4:2];
	// 	Dest[15:3] <= (Src[4])? 13'b1111111111111 : 13'b0000000000000;
	// end
	// else if(SrcGet == `IM_TO8)begin
	// 	Dest <= 16'b0000000000001000;
	// end
end


endmodule
module hdu(
	input wire InsJ1, // need to jump
	input wire[15:0] InsJAddr1, // Jump instruction dst address

	input wire InsBRst1, // need to reset branch
	input wire[15:0] InsBRstAddr1, // Branch instruction reset address

	output reg PcRst, // reset PC
	output reg[15:0] PcRstAddr, // reset PC address
	output reg IfIdRst // reset if_id
	);
	initial begin
		PcRstAddr <= 0;
		PcRst <= 0;
		IfIdRst <= 0;
	end	

	always @(*) begin
		if (InsJ1) begin
			PcRst <= 1;
			PcRstAddr <= InsJAddr1;
			IfIdRst <= 1;
		end else if (InsBRst1) begin
			PcRst <= 1;
			PcRstAddr <= InsBRstAddr1;
			IfIdRst <= 1;
		end else begin
			PcRst <= 0;
			PcRstAddr <= 16'b0;
			IfIdRst <= 0;
		end
	end


endmodule

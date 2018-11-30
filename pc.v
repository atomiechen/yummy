module pc(
	input wire Clk,
	input wire Rst,

	input wire[15:0] AddrIn,
	input wire PcRst,
	input wire[15:0] PcRstAddr,

	output reg[15:0] AddrOut
	);

	initial begin
		AddrOut = 0;
	end

	always @(posedge Clk or negedge Rst) begin
		if (!Rst) begin
			AddrOut <= 0;
		end
		else if (PcRst) begin
			AddrOut <= PcRstAddr;
		end else begin
			AddrOut <= AddrIn;
		end
	end


endmodule

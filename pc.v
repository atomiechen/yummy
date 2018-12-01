module pc(
	input wire Clk,
	input wire Rst,
	input wire Pause,

	input wire[15:0] AddrIn,
	input wire PcRst,
	input wire[15:0] PcRstAddr,

	output reg[15:0] AddrOut
	);

	reg[15:0] AddrOut_tmp;

	reg Src_flag;

	initial begin
		AddrOut = 0;
	end

	always @(posedge Clk or negedge Rst) begin
		if (!Rst) begin
			AddrOut <= 0;
			Src_flag <= 0;
		end else if (Pause == 1) begin
			AddrOut <= 0;

			AddrOut_tmp <= AddrIn;
			Src_flag <= 1;
		end else if (Src_flag == 1) begin
			AddrOut <= AddrOut_tmp;

			Src_flag <= 0;
		end else if (PcRst) begin
			AddrOut <= PcRstAddr;
		end else begin
			AddrOut <= AddrIn;
		end
	end


endmodule

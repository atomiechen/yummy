module dm(
	input wire Clk,

	input wire[15:0] Result2,
	input wire[15:0] DataIn2,
	input wire MemWrite2,
	input wire MemRead2,

	output wire[15:0] DataOut2,

	output wire Ram1_EN, // Ram1 enable
	output wire Ram1_OE, // Ram1 read enable
	output reg Ram1_WE, // Ram1 write enable
	output wire[17:0] Ram1_address, // Ram1 address
	inout wire[15:0] Ram1_data // Ram1 data
	);

	assign DataOut2 = Ram1_data;
	assign Ram1_address = {2'b0, Result2};
	assign Ram1_data = MemWrite2? DataIn2 : 16'bZ;

	assign Ram1_EN = (MemWrite2 || MemRead2)? 0 : 1;
	assign Ram1_OE = MemRead2? 0 : 1;

	always @(*) begin
		if (MemWrite2) begin // write RAM
			Ram1_WE <= Clk;
		end else begin
			Ram1_WE <= 1;
		end
	end

endmodule

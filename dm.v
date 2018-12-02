`include "defines.v"

module dm(
	input wire Clk,

	input wire[15:0] Result2,
	input wire[15:0] DataIn2,
	input wire MemWrite2,
	input wire MemRead2,
	input wire data_ready,
	// input wire tbre,

	output wire[15:0] DataOut2,

	output wire Ram1_EN, // Ram1 enable
	output wire Ram1_OE, // Ram1 read enable
	output wire Ram1_WE, // Ram1 write enable
	output wire[17:0] Ram1_address, // Ram1 address
	inout wire[15:0] Ram1_data, // Ram1 data

	// serial port
	output wire rdn,
	output wire wrn
	);

	assign DataOut2 = (MemRead2 && Ram1_address == `SERIAL_STATUS)? {14'b00000000000000, 1'b1, 1'b1} : Ram1_data;
	assign Ram1_address = {2'b0, Result2};
	assign Ram1_data = MemRead2? 16'bZ : DataIn2;

	assign Ram1_EN = ((MemWrite2 || MemRead2) && (Ram1_address != `SERIAL_DATA))? 0 : 1;
	assign Ram1_OE = (MemRead2 && (Ram1_address != `SERIAL_DATA))? 0 : 1; // read RAM
	assign Ram1_WE = (MemWrite2 && (Ram1_address != `SERIAL_DATA))? Clk : 1; // write RAM

	assign rdn = (MemRead2 && Ram1_address == `SERIAL_DATA)? Clk : 1;
	assign wrn = (MemWrite2 && Ram1_address == `SERIAL_DATA)? Clk : 1;

	// assign rdn = (MemWrite2 || MemRead2)? 1 : 0;
	// assign wrn = (MemWrite2 || MemRead2)? 1 : 0;

	// always @(*) begin
	// 	if (MemWrite2) begin // write RAM
	// 		Ram1_WE <= Clk;
	// 	end else begin
	// 		Ram1_WE <= 1;
	// 	end
	// end

endmodule

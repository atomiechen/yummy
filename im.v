`timescale 1ns / 1ps

module im(
	input wire[15:0] AddrOut,

	output wire[15:0] InsOut,

	output wire Ram2_EN, // Ram2 enable
	output wire Ram2_OE, // Ram2 read enable
	output wire Ram2_WE, // Ram2 write enable
	output wire[17:0] Ram2_address, // Ram2 address
	inout wire[15:0] Ram2_data // Ram2 data
	);
	reg[15:0] mem[63:0]; 
	initial 
     begin
        // $readmemb("test/test.txt", mem); 
		// mem[0] = 16'b0100100100000001;
		// mem[1] = 16'b0100101000000010;
		// mem[2] = 16'b0100101100000011;
		// mem[3] = 16'b0100110000000100;
		// mem[4] = 16'b0100110100000101;
		// mem[5] = 16'b0100111000000110;
		// mem[6] = 16'b0100111100000111;
		// mem[7] = 16'b0000100000000000;
		// mem[8] = 16'b0100000100101110;
		// mem[9] = 16'b0100000101000010;
		// mem[10] = 16'b0000100000000000;
		// mem[11] = 16'b0000100000000000;
		// mem[12] = 16'b0110001100000001;
		// mem[13] = 16'b0110001100000001;
		// mem[14] = 16'b0110001100000001;
		// mem[15] = 16'b0000100000000000;
     end
	assign InsOut = Ram2_data;
	// assign InsOut = mem[AddrOut][15:0];
	//assign InsOut = 16'b0100100100000001;
	assign Ram2_address = {2'b0, AddrOut};
	assign Ram2_data = 16'bZ;

	assign Ram2_EN = 0;
	assign Ram2_OE = 0;
	assign Ram2_WE = 1;

endmodule

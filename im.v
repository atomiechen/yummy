`timescale 1ns / 1ps

module im(
	input wire Clk,
	input wire Rst, // [new]
	input wire[15:0] AddrOut,
	input wire[15:0] ImWriteAddr,
	input wire[15:0] ImWriteData,
	input wire ImWrite, 

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

	reg ImWrite_tmp;
    // reg[15:0] ImWriteAddr_tmp;
	// reg[15:0] ImWriteData_tmp;
    // reg Src_flag;

	assign InsOut = Ram2_data;
	// assign InsOut = mem[AddrOut][15:0];
	// assign InsOut = 16'b0100100100000001;
	assign Ram2_address = ImWrite_tmp? {2'b0, ImWriteAddr} : {2'b0, AddrOut};
	assign Ram2_data = ImWrite_tmp? ImWriteData : 16'bZ;

	assign Ram2_EN = 0;
	assign Ram2_OE = ImWrite_tmp? 1 : 0; // read instruction
	assign Ram2_WE = ImWrite_tmp? Clk : 1; // write instruction

	always @(posedge Clk or negedge Rst) begin
		if (!Rst) begin
			ImWrite_tmp <= 0;
			// Src_flag <= 0;
		end else if (ImWrite) begin
			// Src_flag <= 1;
			ImWrite_tmp <= 1;
			// ImWriteAddr_tmp <= ImWriteAddr;
			// ImWriteData_tmp <= ImWriteData;
		// end else if (Src_flag) begin
			// Src_flag <= 0;
			// ImWrite_tmp <= 0;
		end else begin
			ImWrite_tmp <= 0;
		end
	end

endmodule

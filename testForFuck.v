`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:39:01 12/04/2018
// Design Name:   top
// Module Name:   C:/MyDownloads/iseWorkspace/testForYummy/testForFuck.v
// Project Name:  testForYummy
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testForFuck;

	// Inputs
	reg data_ready;
	reg tsre;
	reg tbre;
	reg Clk0;
	reg Rst;

	// Outputs
	wire data_ready_out;
	wire tsre_out;
	wire rdn;
	wire wrn;
	wire Ram2_EN;
	wire Ram2_OE;
	wire Ram2_WE;
	wire [17:0] Ram2_address;
	wire Ram1_EN;
	wire Ram1_OE;
	wire Ram1_WE;
	wire [17:0] Ram1_address;
	wire [15:0] Src1;
	wire [15:0] Src2;
	wire [15:0] RegPeek1;
	wire [15:0] PcAddr4;

	// Bidirs
	wire [15:0] Ram2_data;
	wire [15:0] Ram1_data;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.data_ready(data_ready), 
		.tsre(tsre), 
		.tbre(tbre), 
		.data_ready_out(data_ready_out), 
		.tsre_out(tsre_out), 
		.rdn(rdn), 
		.wrn(wrn), 
		.Clk0(Clk0), 
		.Rst(Rst), 
		.Ram2_EN(Ram2_EN), 
		.Ram2_OE(Ram2_OE), 
		.Ram2_WE(Ram2_WE), 
		.Ram2_address(Ram2_address), 
		.Ram2_data(Ram2_data), 
		.Ram1_EN(Ram1_EN), 
		.Ram1_OE(Ram1_OE), 
		.Ram1_WE(Ram1_WE), 
		.Ram1_address(Ram1_address), 
		.Ram1_data(Ram1_data), 
		.Src1(Src1), 
		.Src2(Src2), 
		.RegPeek1(RegPeek1), 
		.PcAddr4(PcAddr4)
	);

	initial begin
		// Initialize Inputs
		data_ready = 0;
		tsre = 0;
		tbre = 0;
		Clk0 = 0;
		Rst = 0;

		Clk = 0;
		forever #50 Clk = ~Clk;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


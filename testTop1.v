`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:48:13 11/28/2018
// Design Name:   top
// Module Name:   C:/MyDownloads/iseWorkspace/testForYummy/testTop1.v
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

module testTop1;

	// Inputs
	reg Clk;

	// Outputs
	wire Ram2_EN;
	wire Ram2_OE;
	wire Ram2_WE;
	wire [17:0] Ram2_address;
	wire Ram1_EN;
	wire Ram1_OE;
	wire Ram1_WE;
	wire [17:0] Ram1_address;

	// Bidirs
	wire [15:0] Ram2_data;
	wire [15:0] Ram1_data;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.Clk(Clk), 
		.Ram2_EN(Ram2_EN), 
		.Ram2_OE(Ram2_OE), 
		.Ram2_WE(Ram2_WE), 
		.Ram2_address(Ram2_address), 
		.Ram2_data(Ram2_data), 
		.Ram1_EN(Ram1_EN), 
		.Ram1_OE(Ram1_OE), 
		.Ram1_WE(Ram1_WE), 
		.Ram1_address(Ram1_address), 
		.Ram1_data(Ram1_data)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		forever #50 Clk = ~Clk;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


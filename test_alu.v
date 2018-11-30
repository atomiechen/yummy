`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:18:25 11/19/2018
// Design Name:   alu
// Module Name:   E:/Programming/BigProject/yummy/test_alu.v
// Project Name:  yummy
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_alu;

	// Inputs
	reg [15:0] Src1;
	reg [15:0] Src2;
	reg [2:0] AluCtrl1;

	// Outputs
	wire [15:0] Result1;
	wire Zero1;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.Src1(Src1), 
		.Src2(Src2), 
		.AluCtrl1(AluCtrl1), 
		.Result1(Result1), 
		.Zero1(Zero1)
	);

	integer i;
	
	initial begin
		// Initialize Inputs
		Src1 = 0;
		Src2 = 0;
		AluCtrl1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Src1 = 16'b1010011000000111;
		Src2 = 16'b0101100000011101;
		
		forever #50 AluCtrl1 = AluCtrl1 + 1;

	end
      
endmodule


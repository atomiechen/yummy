`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:14:02 11/19/2018
// Design Name:   alu_control
// Module Name:   E:/Programming/BigProject/yummy/test_alu_control.v
// Project Name:  yummy
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_alu_control;

	// Inputs
	reg [3:0] AluOp1;
	reg [1:0] Flag1;

	// Outputs
	wire [2:0] AluCtrl1;

	// Instantiate the Unit Under Test (UUT)
	alu_control uut (
		.AluOp1(AluOp1), 
		.Flag1(Flag1), 
		.AluCtrl1(AluCtrl1)
	);

	initial begin
		// Initialize Inputs
		AluOp1 = 0;
		Flag1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// AluOp1 = 4'b0000;
		// Flag1 = 2'b00;
		
		// Add stimulus here
		// forever #40 AluOp1 = AluOp1 + 1;
		// forever #10 Flag1 = Flag1 + 1;

	end
      
endmodule


module add_16(
	input wire[15:0] In1,
	input wire[15:0] In2,

	output wire[15:0] Out
    );	

	assign Out = In1 + In2;

endmodule

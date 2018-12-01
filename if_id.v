`include "config.v"

module if_id(
	input wire Clk,
    input wire Rst,
    input wire Pause,

    input wire[15:0] PcAddr4, //å½“å‰åœ°å€
    input wire[15:0] InsOut, //å½“å‰æŒ‡ä»¤
    input wire IfIdRst,
    output reg[15:0] PcAddr0,
    output reg[4:0] OP,
    output reg[2:0] RegIn1,
    output reg[2:0] RegIn2,
    output reg[2:0] RegIn3,
    output reg[4:0] LastOp,
    output reg[10:0] Src //æŽ¥ç»™ç¬¦å·ä½æ‰©å±
	);

    reg[15:0] PcAddr0_tmp;
    reg[4:0] OP_tmp;
    reg[2:0] RegIn1_tmp;
    reg[2:0] RegIn2_tmp;
    reg[2:0] RegIn3_tmp;
    reg[4:0] LastOp_tmp;
    reg[10:0] Src_tmp;

    reg Src_flag;

	always @(posedge Clk or negedge Rst) begin
        if (!Rst) begin
            PcAddr0 <= 0;
            OP <= `NOP;
            RegIn1 <= 0;
            RegIn2 <= 0;
            RegIn3 <= 0;
            LastOp <= 0;
            Src <= 0;

            Src_flag <= 0;
        end else if (Pause == 1) begin
            PcAddr0 <= 0;
            OP <= `NOP;
            RegIn1 <= 0;
            RegIn2 <= 0;
            RegIn3 <= 0;
            LastOp <= 0;
            Src <= 0;

            Src_flag <= 1;

            PcAddr0_tmp <= PcAddr4;
            OP_tmp <= InsOut[15:11];
            RegIn1_tmp <= InsOut[10:8];
            RegIn2_tmp <= InsOut[7:5];
            RegIn3_tmp <= InsOut[4:2];
            LastOp_tmp <= InsOut[4:0];
            Src_tmp <= InsOut[10:0];
        end else if (Src_flag == 1) begin
            PcAddr0 <= PcAddr0_tmp;
            OP <= OP_tmp;
            RegIn1 <= RegIn1_tmp;
            RegIn2 <= RegIn2_tmp;
            RegIn3 <= RegIn3_tmp;
            LastOp <= LastOp_tmp;
            Src <= Src_tmp;

            Src_flag <= 0;
        end else if(0 == IfIdRst)begin
            PcAddr0 <= PcAddr4;
            OP <= InsOut[15:11];
            RegIn1 <= InsOut[10:8];
            RegIn2 <= InsOut[7:5];
            RegIn3 <= InsOut[4:2];
            LastOp <= InsOut[4:0];
            Src <= InsOut[10:0];
        end else begin
            PcAddr0 <= PcAddr4;
            OP <= `NOP;
            RegIn1 <= 3'b000;
            RegIn2 <= 3'b000;
            RegIn3 <= 3'b000;
            LastOp <= 5'b00000;
            Src <= 11'b00000000000;
        end
	end

endmodule

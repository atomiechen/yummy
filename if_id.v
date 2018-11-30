`include "config.v"

module if_id(
	input wire Clk,
    input wire Rst,

    input wire[15:0] PcAddr4, //当前地址
    input wire[15:0] InsOut, //当前指令
    input wire IfIdRst,
    output reg[15:0] PcAddr0,
    output reg[4:0] OP,
    output reg[2:0] RegIn1,
    output reg[2:0] RegIn2,
    output reg[2:0] RegIn3,
    output reg[4:0] LastOp,
    output reg[10:0] Src //接给符号位扩�
	);

	always @(posedge Clk or negedge Rst) begin
        if (!Rst) begin
            PcAddr0 <= 0;
            OP <= `NOP;
            RegIn1 <= 0;
            RegIn2 <= 0;
            RegIn3 <= 0;
            LastOp <= 0;
            Src <= 0;
        end else
        if(0 == IfIdRst)begin
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

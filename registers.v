`include "config.v"


module registers(
	input wire Rst,
	input wire RegWre,              
	input wire Clk,
	input wire[3:0] Rs,            
	input wire[3:0] Rt,            
	input wire[3:0] WriteReg,      
	input wire[15:0] WriteData,    
	input wire[15:0] PcAddr0,		

	output reg[15:0] ReadData1,   
	output reg[15:0] ReadData2,    
	output wire[15:0] RegPeek1 
	);

	reg [15:0] r[15:0];
	integer i;
	initial 
		begin
			for(i = 0; i < 8; i = i + 1)  r[i] <= 0;
		end

	always @(Rs or Rt) begin
		case (Rs)
			`REG0: begin
				ReadData1 <= 16'b0000000000000000;
			end
			`PC: begin
				ReadData1 <= PcAddr0;
			end
			default: begin
				ReadData1 <= r[Rs];
			end
		endcase
		case (Rt)
			`REG0: begin
				ReadData2 <= 16'b0000000000000000;
			end
			`PC: begin
				ReadData2 <= PcAddr0;
			end
			default: begin
				ReadData2 <= r[Rt];
			end
		endcase
	end
		// ReadData1 = Rs == `REG0 ? 16'b0000000000000000 : r[Rs];
		// ReadData2 = Rt == `REG0 ? 16'b0000000000000000 : r[Rt];

	assign RegPeek1 = r[3];
	 
	always@(negedge Clk or negedge Rst) begin
		if (!Rst) begin
			r[0] <= 16'b0000000000000000;
			r[1] <= 16'b0000000000000000;
			r[2] <= 16'b0000000000000000;
			r[3] <= 16'b0000000000000000;
			r[4] <= 16'b0000000000000000;
			r[5] <= 16'b0000000000000000;
			r[6] <= 16'b0000000000000000;
			r[7] <= 16'b0000000000000000;
			r[8] <= 16'b0000000000000000;
			r[9] <= 16'b0000000000000000;
			r[10] <= 16'b0000000000000000;
			r[11] <= 16'b0000000000000000;
			r[12] <= 16'b0000000000000000;
			r[13] <= 16'b0000000000000000;
			r[14] <= 16'b0000000000000000;
			r[15] <= 16'b0000000000000000;
		end 
		else
		if (RegWre && WriteReg != `REG0 && WriteReg != `T)begin
			r[WriteReg] <= WriteData;
		end else if(RegWre && WriteReg == `T)begin
			r[WriteReg] <= WriteData == 0;
		end
	 end 

endmodule

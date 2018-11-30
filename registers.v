`include "config.v"


module registers(
	input Rst,
	input RegWre,              // 写使能信号，为1时，在时钟上升沿写入
	input Clk,
	input [3:0] Rs,            // rs寄存器地址输入端口
	input [3:0] Rt,            // rt寄存器地址输入端口
	input [3:0] WriteReg,      // 将数据写入的寄存器端口，其地址来源rt或rd字段
	input [15:0] WriteData,    // 写入寄存器的数据输入端口
	output [15:0] ReadData1,   // rs寄存器数据输出端口
	output [15:0] ReadData2    // rt寄存器数据输出端口
	);
	reg [15:0] r[15:0];
	integer i;
	initial 
		begin
			for(i = 0; i < 8; i = i + 1)  r[i] <= 0;
		end

	assign ReadData1 = Rs == `REG0 ? 0 : r[Rs];
	assign ReadData2 = Rt == `REG0 ? 0 : r[Rt];
	 
	 // 写寄存器
	always@(negedge Clk or negedge Rst) begin
		if (!Rst) begin
			r[0] <= 0;
			r[1] <= 0;
			r[2] <= 0;
			r[3] <= 0;
			r[4] <= 0;
			r[5] <= 0;
			r[6] <= 0;
			r[7] <= 0;
			r[8] <= 0;
			r[9] <= 0;
			r[10] <= 0;
			r[11] <= 0;
			r[12] <= 0;
			r[13] <= 0;
			r[14] <= 0;
			r[15] <= 0;
		end else
		// 如果寄存器不为0，并且RegWre为真，写入数据
		if (RegWre && WriteReg != 0 && WriteReg != `T)begin
			r[WriteReg] <= WriteData;
		end else if(RegWre && WriteReg == `T)begin
			r[WriteReg] <= WriteData == 0;
		  end
	 end 

endmodule

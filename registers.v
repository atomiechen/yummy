`include "config.v"


module registers(
	input Rst,
	input RegWre,              // дʹ���źţ�Ϊ1ʱ����ʱ��������д��
	input Clk,
	input [3:0] Rs,            // rs�Ĵ�����ַ����˿�
	input [3:0] Rt,            // rt�Ĵ�����ַ����˿�
	input [3:0] WriteReg,      // ������д��ļĴ����˿ڣ����ַ��Դrt��rd�ֶ�
	input [15:0] WriteData,    // д��Ĵ�������������˿�
	output [15:0] ReadData1,   // rs�Ĵ�����������˿�
	output [15:0] ReadData2    // rt�Ĵ�����������˿�
	);
	reg [15:0] r[15:0];
	integer i;
	initial 
		begin
			for(i = 0; i < 8; i = i + 1)  r[i] <= 0;
		end

	assign ReadData1 = Rs == `REG0 ? 0 : r[Rs];
	assign ReadData2 = Rt == `REG0 ? 0 : r[Rt];
	 
	 // д�Ĵ���
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
		// ����Ĵ�����Ϊ0������RegWreΪ�棬д������
		if (RegWre && WriteReg != 0 && WriteReg != `T)begin
			r[WriteReg] <= WriteData;
		end else if(RegWre && WriteReg == `T)begin
			r[WriteReg] <= WriteData == 0;
		  end
	 end 

endmodule

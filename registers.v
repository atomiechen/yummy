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
	output [15:0] ReadData2,    // rt�Ĵ�����������˿�
	output [15:0] RegPeek1 // �鿴�Ĵ�����ֵ
	);



	reg [15:0] r[15:0];
	integer i;
	initial 
		begin
			for(i = 0; i < 8; i = i + 1)  r[i] <= 0;
		end

	assign ReadData1 = Rs == `REG0 ? 16'b0000000000000000 : r[Rs];
	assign ReadData2 = Rt == `REG0 ? 16'b0000000000000000 : r[Rt];
	assign RegPeek1 = r[3];
	 
	 // д�Ĵ���
	always@(negedge Clk or negedge Rst) begin
		if (!Rst) begin
			r[0] <= 16'b0000000000000000;
			r[1] <= 16'b0000000000000001;
			r[2] <= 16'b0000000000000001;
			r[3] <= 16'b0000000000000011;
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
		// ����Ĵ�����Ϊ0������RegWreΪ�棬д������
		if (RegWre && WriteReg != 0 && WriteReg != `T)begin
			r[WriteReg] <= WriteData;
		end else if(RegWre && WriteReg == `T)begin
			r[WriteReg] <= WriteData == 0;
		end
	 end 

endmodule

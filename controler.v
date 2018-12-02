`timescale 1ns / 1ps
`include "config.v"


module controler(
	input wire[4:0] OP,
    //rx ry rz	
	output reg AluSrc,			//�ӼĴ�����������������������1
	output reg MemotoReg,		//�Ƿ���ڴ�Ķ���д���Ĵ���
	output reg RegWrite,		//�Ƿ�д�Ĵ���
	output reg MemWrite,		//�Ƿ�д�ڴ�
	output reg [1:0] Branch,			//�Ƿ�Branch	
	output reg Jump,			//�Ƿ�jump
	output reg MemRead,		    //�Ƿ���ڴ�
	output reg[3:0] AluOp, 		//ALUָ��
    //output reg[4:0] OutOp 		//��OP���´�
	//�����reg
	input wire[2:0] RegIn1,
    input wire[2:0] RegIn2,
    input wire[2:0] RegIn3,
	input wire[4:0] LastOp,
	//�����reg
	output reg[3:0] RegOut1,
    output reg[3:0] RegOut2,
    output reg[3:0] RegOut3,
	output reg[2:0] SrcGet, //��������ȡ��
	output wire[1:0] PcNextAddr0
    );

	assign PcNextAddr0 = (Branch == `NB)? 1 : 3;
	initial	begin
	  	Branch <= `NB;
	end

always @(*) begin
	case(OP)
        `ADDIU:begin
			RegOut3 	<= 		{1'b0, RegIn1};
			RegOut2		<=       `REG0;
			RegOut1		<=		{1'b0, RegIn1};
			AluSrc 		<= 		1;//������ԴΪ������
			MemotoReg 	<= 		0;
			RegWrite 	<= 		1;
			MemWrite 	<= 		0;
			Branch 		<= 		`NB;
			Jump 		<= 		0;
			MemRead		<= 		0;
			AluOp 		<= 		`add_ctr;
			SrcGet		<=      `IM8;
		end
		`ADDIU3:begin
			RegOut3 	<= 		{1'b0, RegIn2};
			RegOut2		<=       `REG0;
			RegOut1		<=		{1'b0, RegIn1};
			AluSrc 		<= 		1;//������ԴΪ������
			MemotoReg 	<= 		0;
			RegWrite 	<= 		1;
			MemWrite 	<= 		0;
			Branch 		<= 		`NB;
			Jump 		<= 		0;
			MemRead		<= 		0;
			AluOp 		<= 		`add_ctr;
			SrcGet		<=      `IM4;
		end
		`ADDSP:begin
			case(RegIn1)
				3'b011:begin //ADDSP
					RegOut3 	<= 		`SP;
					RegOut2		<=      `REG0;
					RegOut1		<=		`SP;
					AluSrc 		<= 		1;//������ԴΪ������
					MemotoReg 	<= 		0;
					RegWrite 	<= 		1;
					MemWrite 	<= 		0;
					Branch 		<= 		`NB;
					Jump 		<= 		0;
					MemRead		<= 		0;
					AluOp 		<= 		`add_ctr;
					SrcGet		<=      `IM8;
				end //BTEQZ
				3'b000:begin
					RegOut3 	<= 		`REG0;
					RegOut2		<=      `REG0;
					RegOut1		<=		`T;
					AluSrc 		<= 		0;
					MemotoReg 	<= 		0;
					RegWrite	<= 		0;
					MemWrite 	<= 		0;
					Branch 		<= 		`BE;
					Jump 		<= 		0;
					MemRead		<= 		0;
					AluOp 		<= 		`add_ctr;
					SrcGet		<=      `IM8;
				end //BTNEZ
				3'b001:begin
					RegOut3 	<= 		`REG0;
					RegOut2		<=      `REG0;
					RegOut1		<=		`T;
					AluSrc 		<= 		0;
					MemotoReg 	<= 		0;
					RegWrite	<= 		0;
					MemWrite 	<= 		0;
					Branch 		<= 		`BNE;
					Jump 		<= 		0;
					MemRead		<= 		0;
					AluOp 		<= 		`add_ctr;
					SrcGet		<=      `IM8;
				end
				3'b100:begin //MTSP
					RegOut3 	<= 		`SP;
					RegOut2		<=      {1'b0, RegIn1};
					RegOut1		<=		`REG0;
					AluSrc 		<= 		0;
					MemotoReg 	<= 		0;
					RegWrite	<= 		1;
					MemWrite 	<= 		0;
					Branch 		<= 		`NB;
					Jump 		<= 		0;
					MemRead		<= 		0;
					AluOp 		<= 		`add_ctr;  
					SrcGet		<=      `IM0;
				end
				3'b010:begin //SW_RS
					RegOut3 	<= 		`REG0;
					RegOut2		<=      `RA;
					RegOut1		<=		`SP;
					AluSrc 		<= 		1;
					MemotoReg 	<= 		0;
					RegWrite	<= 		0;
					MemWrite 	<= 		1;
					Branch 		<= 		`NB;
					Jump 		<= 		0;
					MemRead		<= 		0;
					AluOp 		<= 		`add_ctr; 
					SrcGet		<=      `IM8;
				end
			endcase
		end
		`ADDU:begin
			RegOut3 	<= 		{1'b0, RegIn3};
			RegOut2		<=      {1'b0, RegIn2};
			RegOut1		<=		{1'b0, RegIn1};
			AluSrc 		<= 		0;
			MemotoReg 	<= 		0;
			RegWrite 	<= 		1;
			MemWrite 	<= 		0;
			Branch 		<= 		`NB;
			Jump 		<= 		0;
			MemRead		<= 		0;
			AluOp 		<= 		`add_sub;
			SrcGet		<=      `IM0;
		end
        `BB:begin
			RegOut3 	<= 		`REG0;
			RegOut2		<=      `REG0;
			RegOut1		<=		`REG0;
			AluSrc 		<= 		1;//ȡ������
			MemotoReg 	<= 		0;
			RegWrite	<= 		0;
			MemWrite 	<= 		0;
			Branch 		<= 		`B;
			Jump 		<= 		0;
			MemRead		<= 		0;
			AluOp 		<= 		`add_ctr;
			SrcGet		<=      `IM11;
		end
        `BEQZ:begin
			RegOut3 	<= 		`REG0;
			RegOut2		<=      `REG0;
			RegOut1		<=		{1'b0, RegIn1};
			AluSrc 		<= 		0;
			MemotoReg 	<= 		0;
			RegWrite	<= 		0;
			MemWrite 	<= 		0;
			Branch 		<= 		`BE;
			Jump 		<= 		0;
			MemRead		<= 		0;
			AluOp 		<= 		`add_ctr;
			SrcGet		<=      `IM8;
		end
		`BNEZ:begin
			RegOut3 	<= 		`REG0;
			RegOut2		<=      `REG0;
			RegOut1		<=		{1'b0, RegIn1};
			AluSrc 		<= 		0;
			MemotoReg 	<= 		0;
			RegWrite	<= 		0;
			MemWrite 	<= 		0;
			Branch 		<= 		`BNE;
			Jump 		<= 		0;
			MemRead		<= 		0;
			AluOp 		<= 		`add_ctr;
			SrcGet		<=      `IM8;
		end
        `NOP:begin
			RegOut3 	<= 		`REG0;
			RegOut2		<=      `REG0;
			RegOut1		<=		`REG0;
			AluSrc 		<= 		0;
			MemotoReg 	<= 		0;
			RegWrite	<= 		0;
			MemWrite 	<= 		0;
			Branch 		<= 		`NB;
			Jump 		<= 		0;
			MemRead		<= 		0;
			AluOp 		<= 		`no_alu_op;
			SrcGet		<=      `IM0;
		end

		`NOT:begin
			case(LastOp)
				5'b01111:begin //NOT
					RegOut3 	<= 		{1'b0, RegIn1};
					RegOut2		<=      `REG0;
					RegOut1		<=		{1'b0, RegIn2};
					AluSrc 		<= 		0;//Ҫȡ������
					MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
					RegWrite	<= 		1;//д�Ĵ���
					MemWrite 	<= 		0;
					Branch 		<= 		`NB;
					Jump 		<= 		0;
					MemRead		<= 		0;//��ȡ�ڴ�
					AluOp 	    <= 		4'b0101;
					SrcGet		<=      `IM0;
				end
				5'b01101:begin //OR
					RegOut3 	<= 		{1'b0, RegIn1};
					RegOut2		<=      {1'b0, RegIn1};
					RegOut1		<=		{1'b0, RegIn2};
					AluSrc 		<= 		0;//Ҫȡ������
					MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
					RegWrite	<= 		1;//д�Ĵ���
					MemWrite 	<= 		0;
					Branch 		<= 		`NB;
					Jump 		<= 		0;
					MemRead		<= 		0;//��ȡ�ڴ�
					AluOp 	    <= 		4'b0100;
					SrcGet		<=      `IM0;
				end
				5'b00100:begin //SLLV
					RegOut3 	<= 		{1'b0, RegIn2};
					RegOut2		<=      {1'b0, RegIn1};
					RegOut1		<=		{1'b0, RegIn2};
					AluSrc 		<= 		0;//Ҫȡ������
					MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
					RegWrite	<= 		1;//д�Ĵ���
					MemWrite 	<= 		0;
					Branch 		<= 		`NB;
					Jump 		<= 		0;
					MemRead		<= 		0;//��ȡ�ڴ�
					AluOp 	    <= 		4'b0110;
					SrcGet		<=      `IM0;
				end
				5'b00110:begin //SRLV
					RegOut3 	<= 		{1'b0, RegIn2};
					RegOut2		<=      {1'b0, RegIn1};
					RegOut1		<=		{1'b0, RegIn2};
					AluSrc 		<= 		0;//Ҫȡ������
					MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
					RegWrite	<= 		1;//д�Ĵ���
					MemWrite 	<= 		0;
					Branch 		<= 		`NB;
					Jump 		<= 		0;
					MemRead		<= 		0;//��ȡ�ڴ�
					AluOp 	    <= 		4'b0111;
					SrcGet		<=      `IM0;
				end
				5'b01100:begin //AND
					RegOut3 	<= 		{1'b0, RegIn1};
					RegOut2		<=      {1'b0, RegIn1};
					RegOut1		<=		{1'b0, RegIn2};
					AluSrc 		<= 		0;//Ҫȡ������
					MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
					RegWrite	<= 		1;//д�Ĵ���
					MemWrite 	<= 		0;
					Branch 		<= 		`NB;
					Jump 		<= 		0;
					MemRead		<= 		0;//��ȡ�ڴ�
					AluOp 	    <= 		4'b0011;
					SrcGet		<=      `IM0;
				end
				5'b01010:begin //CMP
					RegOut3 	<= 		`T;
					RegOut2		<=      {1'b0, RegIn1};
					RegOut1		<=		{1'b0, RegIn2};
					AluSrc 		<= 		0;//Ҫȡ������
					MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
					RegWrite	<= 		1;//д�Ĵ���
					MemWrite 	<= 		0;
					Branch 		<= 		`NB;
					Jump 		<= 		0;
					MemRead		<= 		0;//��ȡ�ڴ�
					AluOp 	    <= 		4'b0010;
					SrcGet		<=      `IM0;
				end
				5'b00000:begin
					case(RegIn2)
						3'b000:begin //JR ��һ���ߵ�readdata1
							RegOut3 	<= 		`REG0;
							RegOut2		<=      {1'b0, RegIn2};
							RegOut1		<=		{1'b0, RegIn1};
							AluSrc 		<= 		0;//Ҫȡ������
							MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
							RegWrite	<= 		0;//���Ĵ���
							MemWrite 	<= 		0;
							Branch 		<= 		`NB;
							Jump 		<= 		1;
							MemRead		<= 		0;//��ȡ�ڴ�
							AluOp 	    <= 		`no_alu_op;
							SrcGet		<=      `IM0;
						end
						3'b010:begin //MFPC
							RegOut3 	<= 		{1'b0, RegIn1};
							RegOut2		<=      `PC;
							RegOut1		<=		`REG0;
							AluSrc 		<= 		0;//Ҫȡ������
							MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
							RegWrite	<= 		1;//д�Ĵ���
							MemWrite 	<= 		0;
							Branch 		<= 		`NB;
							Jump 		<= 		0;
							MemRead		<= 		0;//��ȡ�ڴ�
							AluOp 	    <= 		`add_ctr;
							SrcGet		<=      `IM0;
						end
					endcase
				end
			endcase
			
		end
		`LW_SP:begin
			RegOut3 	<= 		{1'b0, RegIn1};
			RegOut2		<=      `REG0;
			RegOut1		<=		`SP;
			AluSrc 		<= 		1;//Ҫȡ������
			MemotoReg 	<= 		1;//�ڴ�д���Ĵ���
			RegWrite	<= 		1;//д�Ĵ���
			MemWrite 	<= 		0;
			Branch 		<= 		`NB;
			Jump 		<= 		0;
			MemRead		<= 		1;//��ȡ�ڴ�
			AluOp 	<= 		`add_ctr;
			SrcGet		<=      `IM8;
		end
		
		`MFIH:begin
			case(LastOp)
			5'b00000:begin //MFIH
				RegOut3 	<= 		{1'b0, RegIn1};
				RegOut2		<=      `REG0;
				RegOut1		<=		`IH;
				AluSrc 		<= 		0;//Ҫȡ������
				MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
				RegWrite	<= 		1;//д�Ĵ���
				MemWrite 	<= 		0;
				Branch 		<= 		`NB;
				Jump 		<= 		0;
				MemRead		<= 		0;//��ȡ�ڴ�
				AluOp 	    <= 		`add_ctr;
				SrcGet		<=      `IM0;
			end
			5'b00001:begin //MTIH
				RegOut3 	<= 		`IH;
				RegOut2		<=      `REG0;
				RegOut1		<=		{1'b0, RegIn1};
				AluSrc 		<= 		0;//Ҫȡ������
				MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
				RegWrite	<= 		1;//д�Ĵ���
				MemWrite 	<= 		0;
				Branch 		<= 		`NB;
				Jump 		<= 		0;
				MemRead		<= 		0;//��ȡ�ڴ�
				AluOp 	    <= 		`add_ctr;
				SrcGet		<=      `IM0;
			end
			endcase			
		end
		`SW:begin
			RegOut3 	<= 		`REG0;
			RegOut2		<=      {1'b0, RegIn2};
			RegOut1		<=		{1'b0, RegIn1};
			AluSrc 		<= 		1;//Ҫȡ������
			MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
			RegWrite	<= 		0;//д�Ĵ���
			MemWrite 	<= 		1;
			Branch 		<= 		`NB;
			Jump 		<= 		0;
			MemRead		<= 		0;//��ȡ�ڴ�
			AluOp 	    <= 		`add_ctr;
			SrcGet		<=      `IM5;//ȡ5λ������
		end
		`SLL:begin
			case(LastOp[1:0]) //���������Ҳ������3λ�� ����
				2'b00:begin //SLL
					RegOut3 	<= 		{1'b0, RegIn1};
					RegOut2		<=      `REG0;
					RegOut1		<=		{1'b0, RegIn2};
					AluSrc 		<= 		1;//Ҫȡ������
					MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
					RegWrite	<= 		1;//д�Ĵ���
					MemWrite 	<= 		0;
					Branch 		<= 		`NB;
					Jump 		<= 		0;
					MemRead		<= 		0;//��ȡ�ڴ�
					AluOp 	    <= 		`sll_ctr;
					SrcGet		<=      (RegIn3 == 0) ? `IM_TO8 : `IM3;//ȡ3λ������
				end
				2'b11:begin //SRA
					RegOut3 	<= 		{1'b0, RegIn1};
					RegOut2		<=      `REG0;
					RegOut1		<=		{1'b0, RegIn2};
					AluSrc 		<= 		1;//Ҫȡ������
					MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
					RegWrite	<= 		1;//д�Ĵ���
					MemWrite 	<= 		0;
					Branch 		<= 		`NB;
					Jump 		<= 		0;
					MemRead		<= 		0;//��ȡ�ڴ�
					AluOp 	    <= 		`sra_ctr;
					SrcGet		<=      (RegIn3 == 0) ? `IM_TO8 : `IM3;//ȡ3λ������
				end
			endcase
		end
		`LI:begin
			RegOut3 	<= 		{1'b0, RegIn1};
			RegOut2		<=      `REG0;
			RegOut1		<=		`REG0;
			AluSrc 		<= 		1;//Ҫȡ������
			MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
			RegWrite	<= 		1;//д�Ĵ���
			MemWrite 	<= 		0;
			Branch 		<= 		`NB;
			Jump 		<= 		0;
			MemRead		<= 		0;//��ȡ�ڴ�
			AluOp 	    <= 		`add_ctr;
			SrcGet		<=      `IM_Zero8;//ȡ3λ������
		end
		`LW:begin
			RegOut3 	<= 		{1'b0, RegIn2};
			RegOut2		<=      `REG0;
			RegOut1		<=		{1'b0, RegIn1};
			AluSrc 		<= 		1;//Ҫȡ������
			MemotoReg 	<= 		1;//�ڴ�д���Ĵ���
			RegWrite	<= 		1;//д�Ĵ���
			MemWrite 	<= 		0;
			Branch 		<= 		`NB;
			Jump 		<= 		0;
			MemRead		<= 		1;//��ȡ�ڴ�
			AluOp 	    <= 		`add_ctr;
			SrcGet		<=      `IM5;//ȡ3λ������
		end
		`SW_SP:begin
			RegOut3 	<= 		`REG0;
			RegOut2		<=      {1'b0, RegIn1};
			RegOut1		<=		`SP;
			AluSrc 		<= 		1;//Ҫȡ������
			MemotoReg 	<= 		0;//�ڴ�д���Ĵ���
			RegWrite	<= 		0;//д�Ĵ���
			MemWrite 	<= 		1;
			Branch 		<= 		`NB;
			Jump 		<= 		0;
			MemRead		<= 		0;//��ȡ�ڴ�
			AluOp 	    <= 		`add_ctr;
			SrcGet		<=      `IM8;//ȡ3λ������
		end
		default: begin
			RegOut3 	<= 		`REG0;
			RegOut2		<=      `REG0;
			RegOut1		<=		`REG0;
			AluSrc 		<= 		0;
			MemotoReg 	<= 		0;
			RegWrite	<= 		0;
			MemWrite 	<= 		0;
			Branch 		<= 		`NB;
			Jump 		<= 		0;
			MemRead		<= 		0;
			AluOp 		<= 		`no_alu_op;
			SrcGet		<=      `IM0;
		end
		
	endcase
end

endmodule
module top(
	output wire rdn, // 读串口，要关闭
	output wire wrn, // 写串口，要关闭
	
	input wire Clk0,
	input wire Rst,

	output wire Ram2_EN, // Ram2 enable
	output wire Ram2_OE, // Ram2 read enable
	output wire Ram2_WE, // Ram2 write enable
	output wire[17:0] Ram2_address, // Ram2 address
	inout wire[15:0] Ram2_data, // Ram2 data

	output wire Ram1_EN, // Ram1 enable
	output wire Ram1_OE, // Ram1 read enable
	output wire Ram1_WE, // Ram1 write enable
	output wire[17:0] Ram1_address, // Ram1 address
	inout wire[15:0] Ram1_data, // Ram1 data
	output wire[15:0] Src1,
	output wire[15:0] Src2,
	output wire[15:0] RegPeek1
	);
	
	assign Clk = ~Clk0;
	
	assign rdn = 1;
	assign wrn = 1;
	
	wire[15:0] PcAddr4;
	wire[15:0] PcBAddr0;
	wire[1:0] PcNextAddr0;
	wire [15:0] AddrIn;
	wire PcRst;
	wire[15:0] PcRstAddr;
	wire[15:0] AddrOut;
	wire[15:0] InsOut;
	wire IfIdRst;
	wire[15:0] PcAddr0;
	wire[4:0] OP;
	wire[2:0] RegIn1;
	wire[2:0] RegIn2;
	wire[2:0] RegIn3;
	wire[4:0] LastOp;
	wire[10:0] Src;
	wire InsJ1; // need to jump
	// wire[15:0] Src1; // Jump instruction dst address
	wire InsBRst1; // need to reset branch
	wire[15:0] InsBRstAddr1; // Branch instruction reset address
	wire[15:0] Dest;
	wire[2:0] SrcGet;
	wire RegWrite0;
	wire MemotoReg0;
	wire MemWrite0;
	wire MemRead0;
	wire Mem0;
	wire[3:0] AluOp0;
	wire[15:0] RegData10;
	wire[15:0] RegData20;
	//wire[1:0] Flag0;
	wire[3:0] RegWriteIndex0;
	wire[3:0] RegReadIndex10;
	wire[3:0] RegReadIndex20;
	wire InsJ0;
	wire[1:0] InsB0;
	wire AluSrc; // choose immediate or not
	wire RegWrite1;
	wire MemotoReg1;
	wire MemWrite1;
	wire MemRead1;
	wire Mem1;
	wire[3:0] AluOp1;
	wire[15:0] PcAddr1;
	wire[15:0] RegData11;
	wire[15:0] RegData21;
	wire[1:0] Flag1; //
	wire[3:0] RegWriteIndex1;
	wire[3:0] RegReadIndex11;
	wire[3:0] RegReadIndex21;
	wire[1:0] InsB1;
	wire AluSrc1;
	wire[15:0] Dest1;
	wire[15:0] Result2;
	wire[15:0] WriteData;
	wire[1:0] MuxCtrl11;
	wire[1:0] MuxCtrl21;
	wire[15:0] Src2_pre;
	// wire[15:0] Src2;
	wire[2:0] AluCtrl1;
	// wire[15:0] Result1;
	wire Zero1;
	wire[3:0] RegWriteIndex2;
	wire RegWrite2;
	wire[3:0] RegWriteIndex3;
	wire RegWrite3;
	wire MemotoReg2;
	wire MemWrite2;
	wire MemRead2;
	wire[15:0] DataIn2;
	wire[15:0] DataOut2;
	wire MemotoReg3;
	wire[15:0] DataOut3;
	wire[15:0] Result3;

	// section 4

	mux_16_3 mux_16_34(
		.In1(PcAddr4), 
		.In2(16'h8000), 
		.In3(PcBAddr0), 
		.Ctrl(PcNextAddr0), 
		.Out(AddrIn)
		);


	pc pc4(
		.Clk(Clk), 
		.Rst(Rst),
		.AddrIn(AddrIn), 
		.PcRst(PcRst), 
		.PcRstAddr(PcRstAddr), 
		.AddrOut(AddrOut)
		);

	im im4(
		.AddrOut(AddrOut), 
		.InsOut(InsOut), 
		.Ram2_EN(Ram2_EN), 
		.Ram2_OE(Ram2_OE), 
		.Ram2_WE(Ram2_WE), 
		.Ram2_address(Ram2_address), 
		.Ram2_data(Ram2_data)
		);

	add_16 add_164(
		.In1(AddrOut), 
		.In2(1), 
		.Out(PcAddr4)
		);

	// section 0

	if_id _if_id(
		.Clk(Clk), 
		.Rst(Rst),
		.PcAddr4(PcAddr4), 
		.InsOut(InsOut), 
		.IfIdRst(IfIdRst), 
		.PcAddr0(PcAddr0), 
		.OP(OP), 
		.RegIn1(RegIn1), 
		.RegIn2(RegIn2), 
		.RegIn3(RegIn3), 
		.LastOp(LastOp), 
		.Src(Src)
		);

	hdu hdu0(
		.InsJ1(InsJ1), 
		.InsJAddr1(Src1), 
		.InsBRst1(InsBRst1), 
		.InsBRstAddr1(PcAddr1+1), 
		.PcRst(PcRst), 
		.PcRstAddr(PcRstAddr), 
		.IfIdRst(IfIdRst)
		);

	add_16 add_160(
		.In1(Dest), 
		.In2(PcAddr0), 
		.Out(PcBAddr0)
		);

	controler controler0(
		.OP(OP),
		.AluSrc(AluSrc),
		.MemotoReg(MemotoReg0),
		.RegWrite(RegWrite0),
		.MemWrite(MemWrite0),
		.Branch(InsB0),
		.Jump(InsJ0),
		.MemRead(MemRead0),
		.AluOp(AluOp0),
		.RegIn1(RegIn1),
		.RegIn2(RegIn2),
		.RegIn3(RegIn3),
		.LastOp(LastOp),
		.RegOut1(RegReadIndex10),
		.RegOut2(RegReadIndex20),
		.RegOut3(RegWriteIndex0),
		.SrcGet(SrcGet),
		.PcNextAddr0(PcNextAddr0)
		);

	registers registers0(
		.Rst(Rst),
		.RegWre(RegWrite3),
		.Clk(Clk),
		.Rs(RegReadIndex10),
		.Rt(RegReadIndex20),
		.WriteReg(RegWriteIndex3),
		.WriteData(WriteData),
		.ReadData1(RegData10),
		.ReadData2(RegData20),
		.RegPeek1(RegPeek1)
		);

	extend_16 extend_160(
		.Src(Src),
		.Dest(Dest),
		.SrcGet(SrcGet)
		);

	// section 1

	id_ex _id_ex(
		.Clk(Clk), 
		.Rst(Rst),
		.RegWrite0(RegWrite0), 
		.MemotoReg0(MemotoReg0), 
		.MemWrite0(MemWrite0), 
		.MemRead0(MemRead0), 
		.Mem0(Mem0), 
		.AluOp0(AluOp0), 
		.PcAddr0(PcAddr0), 
		.RegData10(RegData10), 
		.RegData20(RegData20), 
		.Flag0(LastOp[1:0]), 
		.RegWriteIndex0(RegWriteIndex0), 
		.RegReadIndex10(RegReadIndex10), 
		.RegReadIndex20(RegReadIndex20), 
		.InsJ0(InsJ0),
		.InsB0(InsB0),
		.AluSrc(AluSrc),
		.Dest(Dest),

		.RegWrite1(RegWrite1),
		.MemotoReg1(MemotoReg1),
		.MemWrite1(MemWrite1),
		.MemRead1(MemRead1),
		.Mem1(Mem1),
		.AluOp1(AluOp1),
		.PcAddr1(PcAddr1),
		.RegData11(RegData11),
		.RegData21(RegData21),
		.Flag1(Flag1),
		.RegWriteIndex1(RegWriteIndex1),
		.RegReadIndex11(RegReadIndex11),
		.RegReadIndex21(RegReadIndex21),
		.InsJ1(InsJ1),
		.InsB1(InsB1),
		.AluSrc1(AluSrc1),
		.Dest1(Dest1)
		);

	mux_16_3 mux_16_311( //涓婇潰鐨刴ux鍙栧嚭readdata1
		.In1(RegData11),
		.In2(Result2),
		.In3(WriteData),
		.Ctrl(MuxCtrl11),
		.Out(Src1)
		);

	mux_16_3 mux_16_321( //涓嬮潰鐨刴ux鍙栧嚭readdata2
		.In1(RegData21),
		.In2(Result2),
		.In3(WriteData),
		.Ctrl(MuxCtrl21),
		.Out(Src2_pre)
		);

	mux_16_2 mux_16_21(
		.In1(Dest1),
		.In2(Src2_pre),
		.Ctrl(AluSrc1),
		.Out(Src2)
		);

	alu_control alu_control1(
		.AluOp1(AluOp1),
		.Flag1(Flag1),
		.AluCtrl1(AluCtrl1)
		);

	alu alu1(
		.Src1(Src1),
		.Src2(Src2),
		.AluCtrl1(AluCtrl1),
		.Result1(Result1),
		.Zero1(Zero1)
		);

	fu fu1(
		.RegWriteIndex2(RegWriteIndex2),
		.RegWrite2(RegWrite2),
		.RegWriteIndex3(RegWriteIndex3),
		.RegWrite3(RegWrite3),
		.RegReadIndex11(RegReadIndex11),
		.RegReadIndex21(RegReadIndex21),
		.MuxCtrl11(MuxCtrl11),
		.MuxCtrl21(MuxCtrl21)
		);

	branch branch1(
		.InsB1(InsB1),
		.Src(Src1),
		.InsBRst1(InsBRst1)
		);

	// section 2

	ex_mem _ex_mem(
		.Clk(Clk),
		.Rst(Rst),
		.RegWrite1(RegWrite1),
		.MemotoReg1(MemotoReg1),
		.MemWrite1(MemWrite1),
		.MemRead1(MemRead1),
		.Result1(Result1),
		.DataIn1(Src2_pre),
		.RegWriteIndex1(RegWriteIndex1),
		.RegWrite2(RegWrite2),
		.MemotoReg2(MemotoReg2),
		.MemWrite2(MemWrite2),
		.MemRead2(MemRead2),
		.Result2(Result2),
		.DataIn2(DataIn2),
		.RegWriteIndex2(RegWriteIndex2)
		);

	dm dm2(
		.Clk(Clk),
		.Result2(Result2),
		.DataIn2(DataIn2),
		.MemWrite2(MemWrite2),
		.MemRead2(MemRead2),
		.DataOut2(DataOut2),
		.Ram1_EN(Ram1_EN),
		.Ram1_OE(Ram1_OE),
		.Ram1_WE(Ram1_WE),
		.Ram1_address(Ram1_address),
		.Ram1_data(Ram1_data)
		);

	// section 3

	mem_wb _mem_wb(
		.Clk(Clk),
		.Rst(Rst),
		.RegWrite2(RegWrite2),
		.MemotoReg2(MemotoReg2),
		.DataOut2(DataOut2),
		.Result2(Result2),
		.RegWriteIndex2(RegWriteIndex2),
		.RegWrite3(RegWrite3),
		.MemotoReg3(MemotoReg3),
		.DataOut3(DataOut3),
		.Result3(Result3),
		.RegWriteIndex3(RegWriteIndex3)
		);

	mux_16_2 mux_16_23(
		.In1(DataOut3),
		.In2(Result3),
		.Ctrl(MemotoReg3),
		.Out(WriteData)
		);

endmodule

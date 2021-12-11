module data_path(


input wire clk_dp, rst, IorD,MemWrite, IRWrite, RegWrite, PCSrc,ALUSrcA,MemtoReg, RegDst, PCene, //selector,
input wire [1:0] ALUSrcB,//
input wire [2:0] ALUSControl,
output [7:0] GPIO_o,
output [31:0]ALUres

);

wire[31:0] Sysmemout, rd1,rd2,adr,SrcA,SrcB,ALUout,outPCin, PCout, InstrOut,DataOut,wd3,regOUT,outreg1,outreg2,outmux;
wire[31:0] sigextOut,recOut,PCplus4;
wire[5:0] A3;

/////////////////////////////////////////////////////////// 
mux2to1 Adr( 
		
		.select(IorD),
		.input_a(PCplus4),
		//.input_a(PCout), 
		.input_b(regOUT),
		.out(adr) // to addres sys mem

);

mux2to1 WD3( 
		
		.select(MemtoReg),
		.input_a(regOUT), 
		.input_b(DataOut),
		.out(wd3) // to WD3

);

mux2to1 AnALU( 
		
		.select(ALUSrcA),
		.input_a(PCplus4),
		//.input_a(PCout), 
		.input_b(outreg1),
		.out(outmux) // 

);

mux2to1 deALU( 
		
		.select(PCSrc),
		.input_a(ALUres), //salida ALu
		.input_b(regOUT),
		.out(outPCin) // to PC

);

mux2to1 #( .DW(5)) rtorrd//
(		
		.select(RegDst),
		.input_a(InstrOut[20:16]), //op
		.input_b(InstrOut[15:11]),
		.out(A3) // to A3

);
///////////////////////////////////
mux4to1 mux4t01(
		.I0(outreg2),
		.I1(1),
		.I2(sigextOut),
		.I3(),
		.s(ALUSrcB),
		.out(SrcB)

);
///////////////////////////////////
Register Instr (	
	.D(Sysmemout),
	.clk(clk_dp), 
	.rst(1), 
	.en(IRWrite),  
	.Q(InstrOut)	
);

Register Data(	
	.D(Sysmemout),
	.clk(clk_dp), 
	.rst(1), 
	.en(1),  
	.Q(DataOut)	
);

Register Aluout(	
	.D(ALUres),
	.clk(clk_dp), 
	.rst(1), 
	.en(1),  
	.Q(regOUT)	
);

Register RD1(	
	.D(rd1),
	.clk(clk_dp), 
	.rst(1), 
	.en(1),  
	.Q(outreg1)	
);

Register RD2(	
	.D(rd2),
	.clk(clk_dp), 
	.rst(1), 
	.en(1),  
	.Q(outreg2)	// mux 4 to 1 and WD sysmem
);


PC PC(	
	.PCin(outPCin),
	.clk(clk_dp), 
	.reset(rst),//revisar 
	.enable(PCene),  
	.PCout(PCout)	
);


/////////////////////////////////// 
MemorySys_wrap memsys(

	.white_Enable_i_w(MemWrite),
	.clk_w(clk_dp),
	//.sel_w(selector),
	.Address_i_w(adr), 
	.Write_Data_w(outreg2),
	.Instruction_o_w(Sysmemout) //output

);



Reg_wrap RegiterFile(

	.clk(clk_dp), 
	.reset(1), 
	.Reg_write_in(RegWrite),
	.Write_Register_1(A3), 
	.Read_Register_1(InstrOut[25:21]), 
	.Read_Register_2(InstrOut[20:16]),
	.Write_Data(wd3),
	.Read_Data_1(rd1), //output
	.Read_Data_2(rd2)	 //output
);
//////////////////////////////////////////


adder PCplus(
		
		.a(PCout),	
		.b(32'd4),
		.y(PCplus4)		
);

///////////////////////////////////////////
ALU ALUv // ARITHMETIC UNIT//
(  .y(ALUres),//output
	.a(outmux), 
	.b(SrcB),
   .c_in(0),
	.select(ALUSControl)
);
/////////////////////////////////////////////
Sign_extend sigext(

	.in(InstrOut[15:0]),
	.out(sigextOut)

);
///////////////////////////////////////

assign GPIO_o = ALUres[7:0];

endmodule 
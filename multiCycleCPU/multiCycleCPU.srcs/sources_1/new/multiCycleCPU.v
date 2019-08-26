`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 16:34:13
// Design Name: 
// Module Name: multiCycleCPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiCycleCPU(
    input clk, Reset,
    output [31:0] instruction,
    output [31:0] readData1, readData2, DB, curPC,Result ,newPC
    );
    wire[2:0] ALUOp;
    wire[31:0] exImmediate, DMOut, rega,regb,rdout1,rdout2,writeData,aluout,dtout,DAddr;
    wire[15:0] immediate;
    wire[5:0] opCode;
    wire[4:0] rs,rt,rd,writeReg;
    wire[5:0] sa;
    wire[1:0] PCSrc, RegDst;
    wire sign, zero,IRWre,PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre,WrRegDSrc,InsMemRW, mRD, mWR, ExtSel;
    
    controlUnit cu(clk,opCode,zero,sign,Reset,IRWre,PCWre,ALUSrcA,ALUSrcB,DBDataSrc,RegWre,WrRegDSrc,InsMemRW,mRD,mWR,ExtSel,RegDst,PCSrc,ALUOp);
    PC pc(clk,Reset,PCWre,PCSrc,exImmediate,readData1,newPC,curPC);
    instructionMemory im(curPC,instruction);
    IR ir(clk,IRWre,instruction,opCode,rs,rt,rd,immediate,sa);
    mux3to1 rg(5'b11111,rt,rd,RegDst,writeReg);
    registerFile rf(clk,RegWre,writeReg,writeData,rs,rt,readData1,readData2);
    DR adr(clk,readData1,rdout1);
    DR bdr(clk,readData2,rdout2);
    DR aluOutDr(clk,aluout,DAddr);
    DR dbdr(clk,DMOut,DB);
    mux2to1 wd(newPC,DB,WrRegDSrc,writeData);
    mux2to1 ra(rdout1,(27'b0<<5)+sa,ALUSrcA,rega);
    mux2to1 rb(rdout2,exImmediate,ALUSrcB,regb);
    mux2to1 da(aluout,dtout,DBDataSrc,DMOut);
    ALU alu(rega,regb,ALUOp,zero,sign,Result);
    mux m(Result,zero,sign,opCode,aluout);
    dataMemory dm(DAddr,rdout2,mRD,mWR,dtout);
    signZeroExtend sze(immediate, ExtSel, exImmediate);
endmodule

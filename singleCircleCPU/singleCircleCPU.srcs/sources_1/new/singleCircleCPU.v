`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/14 19:37:53
// Design Name: 
// Module Name: singleCircleCPU
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


module singleCircleCPU(
    input clk, Reset,
    output [31:0] instruction,
    output [31:0] rega, regb, writeData, curPC, Result,newPC
);
    wire[2:0] ALUOp;
    wire[31:0] exImmediate, DMOut;
    wire[15:0] immediate;
    wire[5:0] opCode;
    wire[4:0] rs,rt,rd;
    wire[5:0] sa;
    wire[1:0] PCSrc;
    wire sign, zero,PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre,InsMemRW, mRD, mWR, ExtSel, RegDst;

    PC pc(clk, Reset, PCWre, PCSrc, exImmediate,newPC, curPC);
    controlUnit CU(opCode, zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, ExtSel, RegDst, PCSrc, ALUOp);
    dataMemory dm(writeData, regb, mRD, mWR, DMOut);
    instructionMemory im(curPC, opCode, rs, rt, rd, immediate, sa,instruction);
    registerFile registerfile(clk, RegWre, RegDst, DBDataSrc, opCode, rs, rt, rd, immediate,  writeData, DMOut, rega, regb);
    signZeroExtend sze(immediate, ExtSel, exImmediate);
    ALU alu(rega, regb, exImmediate, sa, ALUSrcA, ALUSrcB, ALUOp, zero,sign, Result);
    mux m(Result,zero,opCode,writeData);
endmodule

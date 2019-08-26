`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/14 19:32:07
// Design Name: 
// Module Name: controlUnit
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


module controlUnit(
    input [5:0] opCode,
    input zero,
    input sign,
    output PCWre,
    output ALUSrcA,
    output ALUSrcB,
    output DBDataSrc,
    output RegWre,
    output InsMemRW,
    output mRD,
    output mWR,
    output ExtSel,
    output RegDst,
    output [1:0] PCSrc,
    output [2:0] ALUOp
    );
    assign PCWre = (opCode == 6'b111111) ? 0 : 1;
    assign DBDataSrc = (opCode == 6'b100111) ? 1 : 0;
    assign RegWre = (opCode == 6'b110000 || opCode == 6'b110001 || opCode == 6'b110010 || opCode == 6'b100110 || opCode == 6'b111111) ? 0 : 1;
    assign InsMemRW = 0;
    assign mRD = (opCode == 6'b100111) ? 1 : 0;
    assign mWR = (opCode == 6'b100110) ? 1 : 0;
    assign ExtSel = (opCode == 6'b010000 || opCode == 6'b010010) ? 0 : 1;
    assign RegDst = (opCode == 6'b000010 || opCode == 6'b010000 || opCode == 6'b010010 || opCode == 6'b011100 || opCode == 6'b100111) ? 0 : 1;
    assign PCSrc[1] = (opCode == 6'b111000) ? 1 : 0;
    assign PCSrc[0] = ((opCode == 6'b110000 && zero == 1)||(opCode == 6'b110001 && zero == 0)||(opCode == 6'b110010 && sign == 1)) ? 1 : 0;
    assign ALUSrcA = (opCode == 6'b011000) ? 1 : 0;
    assign ALUSrcB = (opCode == 6'b000010 || opCode == 6'b010000 || opCode == 6'b010010 || opCode == 6'b011100 || opCode == 6'b100110 || opCode == 6'b100111) ? 1 : 0;
    assign ALUOp[2] = (opCode == 6'b010001 || opCode == 6'b011100 ||opCode == 6'b010000 || opCode==6'b110000 || opCode == 6'b110001) ? 1 : 0;
    assign ALUOp[1] = (opCode == 6'b011000 || opCode == 6'b010011 || opCode == 6'b011100 || opCode == 6'b010010|| opCode==6'b110000 || opCode == 6'b110001) ? 1 : 0;
    assign ALUOp[0] = (opCode == 6'b000001 || opCode == 6'b010011 || opCode == 6'b010010|| opCode==6'b110000 || opCode == 6'b110001) ? 1 : 0;
endmodule

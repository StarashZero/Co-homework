`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 23:00:32
// Design Name: 
// Module Name: controlSign
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


module controlSign(
    input [2:0] state,
    input [5:0] opCode,
    input zero,
    input sign,
    output reg IRWre,
    output reg PCWre,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg DBDataSrc,
    output reg RegWre,
    output reg WrRegDSrc,
    output reg InsMemRW,
    output reg mRD,
    output reg mWR,
    output reg ExtSel,
    output reg [1:0] RegDst,
    output reg [1:0] PCSrc,
    output reg [2:0] ALUOp
    );
    //设置常量
    parameter [2:0] IF = 3'b000,
    ID = 3'b001, EXE1 = 3'b110,
    EXE2 = 3'b101, EXE3 = 3'b010,
    WB1 = 3'b111, WB2 = 3'b100,
    MEM = 3'b011;
    
    //每次状态改变时
    always @(state) begin
        DBDataSrc = (opCode == 6'b110001) ? 1 : 0;
        WrRegDSrc = (opCode == 6'b111010)? 0 : 1;
        ExtSel = (opCode == 6'b010001 || opCode == 6'b010010 || opCode == 6'b010011) ? 0 : 1;
        RegDst = (opCode == 6'b000010 || opCode == 6'b010000 || opCode == 6'b010010 || opCode == 6'b011100 || opCode == 6'b100111) ? 0 : 1;
        PCSrc[1] = (opCode == 6'b111000 || opCode == 6'b111001 || opCode == 6'b111010) ? 1 : 0;
        PCSrc[0] = ((opCode == 6'b110100 && zero == 1)||(opCode == 6'b110101 && zero == 0)||(opCode == 6'b110110 && sign == 1) || opCode == 6'b111000 || opCode == 6'b111010) ? 1 : 0;
        RegDst[1] = (opCode == 6'b000000 || opCode == 6'b000001 || opCode == 6'b010000 || opCode == 6'b100111 || opCode == 6'b011000) ? 1 : 0;
        RegDst[0] = (opCode == 6'b000010 || opCode == 6'b010001 || opCode == 6'b010010 || opCode == 6'b010011 || opCode == 6'b100110 || opCode == 6'b110001) ? 1 : 0;
        
        //EXE
        if (state == EXE1 || state == EXE2 || state == EXE3) begin
            ALUOp[2] = (opCode == 6'b010000 || opCode == 6'b010001 ||opCode == 6'b100110 || opCode==6'b100111 || opCode == 6'b010011) ? 1 : 0;
            ALUOp[1] = (opCode == 6'b011000 || opCode == 6'b010010 || opCode == 6'b100111 || opCode == 6'b010011) ? 1 : 0;
            ALUOp[0] = (opCode == 6'b000001 || opCode == 6'b110100 || opCode == 6'b110101|| opCode == 6'b010010 || opCode == 6'b100110 || opCode == 6'b010011) ? 1 : 0;
            ALUSrcA = (opCode == 6'b011000) ? 1 : 0;
            ALUSrcB = (opCode == 6'b000010 || opCode == 6'b010001 || opCode == 6'b010010 || opCode == 6'b010011 || opCode == 6'b100110 || opCode == 6'b110001 || opCode == 6'b110000) ? 1 : 0; 
        end
        
        //IF
        if (state == IF) begin
            if (opCode != 6'b111111)
                PCWre = 1;
            else PCWre = 0;
        end
        else begin 
            PCWre = 0;
        end      
        
        //ID
        InsMemRW = 1;
        if (state == ID)
            IRWre = 1;
        else IRWre = 0;
        
        //MEM
        if (state == MEM) begin
            mRD = (opCode == 6'b110001) ? 1 : 0;
            mWR = (opCode == 6'b110000) ? 1 : 0;
        end
        else begin
            mRD = 0;
            mWR = 0;
        end
        
        //WB
        if (state == WB1 || state == WB2)
            RegWre = (opCode == 6'b110100 || opCode == 6'b110101 || opCode == 6'b110110 || opCode == 6'b111000 || opCode == 6'b110000 || opCode == 6'b111001 || opCode == 6'b111111)? 0 : 1;
        else if (opCode == 6'b111010 && state == ID) //允许jal指令在ID阶段写寄存器
            RegWre = 1;
        else RegWre = 0;
        
    end
   
endmodule

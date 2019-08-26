`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/14 19:36:45
// Design Name: 
// Module Name: registerFile
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


module registerFile(
    input clk, RegWre, RegDst, DBDataSrc,
    input [5:0] opCode,
    input [4:0] rs, rt, rd,
    input [10:0] im,
    input [31:0] dataFromALU, dataFromRW,  
    output [31:0] Data1, Data2
    ); 
  
    wire [4:0] writeReg;  
    wire [31:0] writeData;  
    assign writeReg = RegDst? rd : rt;
    assign writeData = DBDataSrc? dataFromRW : dataFromALU; 
    
    reg [31:0] register[0:31];  
    integer i;  
    initial begin  //初始化寄存器
        for (i = 0; i < 32; i = i+1) 
        register[i] <= 0;  
    end  
    
    //读取数据
    assign Data1 = register[rs];
    assign Data2 = register[rt];
    
    always @(negedge clk) begin  //写回寄存器
        if (RegWre && writeReg) register[writeReg] <= writeData;  
    end  

endmodule

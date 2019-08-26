`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 15:44:11
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
    input clk, RegWre,
    input [4:0] writeReg,
    input [31:0] writeData,
    input [4:0] rs, rt,
    output [31:0] Data1, Data2
    ); 
    
    
    reg [31:0] register[0:31];  
    integer i;  
    initial begin  //��ʼ���Ĵ���
        for (i = 0; i < 32; i = i+1) 
        register[i] <= 0;  
    end  
    
    //��ȡ����
    assign Data1 = register[rs];
    assign Data2 = register[rt];
    
    always @(negedge clk) begin  //д�ؼĴ���
        if (RegWre && writeReg) register[writeReg] <= writeData;  
    end  

endmodule

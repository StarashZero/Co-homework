`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/14 19:33:06
// Design Name: 
// Module Name: dataMemory
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


module dataMemory(
    input [31:0] DAddr,
    input [31:0] DataIn,
    input mRD,
    input mWR,
    output reg [31:0] DataOut
    );
        
    integer i;  
    initial begin  
        for (i = 0; i < 128; i = i+1) memory[i] <= 0;  //内存器初始化为0
    end  
    
    reg[7:0] memory[0:127];
    reg[31:0] address;      
    always @(mRD) begin  //读操作
        if (mRD == 1) begin
        address = (DAddr << 2);
        DataOut = (memory[address]<<24)+(memory[address+1]<<16)+(memory[address+2]<<8)+memory[address+3];
        end
    end  

    always @(mWR or DAddr or DataIn)   begin  //写操作
        if (mWR == 1) begin
            address = DAddr << 2;
            memory[address] = DataIn[31:24];
            memory[address+1]= DataIn[23:16];
            memory[address+2]=DataIn[15:8];
            memory[address+3]=DataIn[7:0];
        end  
    end  
endmodule

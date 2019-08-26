`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/14 19:33:35
// Design Name: 
// Module Name: instructionMemory
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


module instructionMemory(
    input [31:0] pc,   
    output [5:0] op,   
    output [4:0] rs, rt, rd,  
    output [15:0] immediate,
    output [5:0] sa,
    output [31:0] instruction
    );
    
    reg [7:0] mem[0:127];
    reg [31:0] address;
    reg [31:0] instruction;
    initial begin
        $readmemb("E:/Xlink/VivadoProject/singleCircleCPU/instructions.txt", mem); 
    end
    
    always @(pc) begin //∂¡»°÷∏¡Ó
        address = pc[6:2] << 2; 
        instruction = (mem[address]<<24) + (mem[address+1]<<16) + (mem[address+2]<<8) + mem[address+3];
    end
    
    assign op = instruction[31:26];  
    assign rs = instruction[25:21];  
    assign rt = instruction[20:16];  
    assign rd = instruction[15:11];  
    assign sa = instruction[10:6];
    assign immediate = instruction[15:0];

    
endmodule

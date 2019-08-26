`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 22:03:22
// Design Name: 
// Module Name: mux
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


module mux(
    input [31:0] aluResult,
    input zero,
    input [5:0] opCode,
    output reg[31:0] writeData
    );
    always @(aluResult or zero or opCode ) begin
        if (opCode == 6'b110001) //bne
            writeData = !zero;
        else if(opCode == 6'b110000)//beq
            writeData = zero;
        else
            writeData = aluResult;
    end
endmodule

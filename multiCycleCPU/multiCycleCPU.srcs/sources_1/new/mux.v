`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 16:29:55
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
    input sign,
    input [5:0] opCode,
    output reg[31:0] writeData
    );
    //¥¶¿Ìbne,beq,bltz÷∏¡Ó
    always @(aluResult or zero or opCode ) begin
        if (opCode == 6'b110101) //bne
            writeData = !zero;
        else if (opCode == 6'b110100)//beq
            writeData = zero;
        else if (opCode == 6'b110110)//bltz
            writeData = sign;
        else
            writeData = aluResult;
    end
endmodule

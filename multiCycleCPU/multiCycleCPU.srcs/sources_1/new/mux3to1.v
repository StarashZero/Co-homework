`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 15:29:53
// Design Name: 
// Module Name: mux3to1
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


module mux3to1(
    input [4:0] in1,
    input [4:0] in2,
    input [4:0] in3,
    input [1:0] sign,
    output reg[4:0] out
    );
    //ศýักาป
    always @(in1 or in2 or in3 or sign) begin
        case (sign)
            2'b00: out = in1;
            2'b01: out = in2;
            2'b10: out = in3;
        endcase
    end
endmodule

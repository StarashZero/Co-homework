`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/14 10:03:03
// Design Name: 
// Module Name: PC
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

module PC(
    input clk, Reset, PCWre,
    input [1:0] PCSrc,  
    input [31:0] immediate,
    input [31:0] dataFromRF,
    output reg [31:0] newaddress,  
    output reg [31:0] address
    );  
    initial begin
        address = 0;
        newaddress = 4;
    end
    
    always @(posedge clk or negedge Reset)  //…Ë÷√ ±÷”
    begin  
        if (Reset == 0) begin  
            address <= 0;  
            newaddress <= 4;
        end  
        else if (PCWre) begin
            if (PCSrc == 2'b11) begin  //j,jal÷∏¡Ó
                address <= (newaddress[31:28]<<28)+(immediate[27:2]<<2)+2'b00; 
            end
            else if (PCSrc == 2'b01) begin  //beq or bne
                address <= newaddress + (immediate<<2);
            end
            else if (PCSrc == 2'b10) //jr
                address <= dataFromRF;
            else address = address + 4;
            newaddress <= address + 4;
        end  
    end  
endmodule  


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/28 22:51:34
// Design Name: 
// Module Name: change
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


module change(
    input myCLK,
    input Reset,
    input [3:0] AN,
    input [2:0] SW,
    input [31:0] aluResult, // ALU的result输出值
    input [31:0] curPC,
    input [31:0] newPC,
    input [31:0] writeData, // DB总线值
    input [31:0] regRs, // 寄存器组rs寄存器的值
    input [31:0] regRt, // 寄存器组rt寄存器的值
    input [31:0] instruction,
    output reg[3:0] store
    );
          
  always@ (myCLK) begin //取数据
     if(!Reset)
        store <= 4'b0000;
     else begin
         case(AN)
              4'b1110 : begin //AN1
                  case(SW)
                      2'b00: store <= newPC[3:0];
                      2'b01: store <= regRs[3:0];
                      2'b10: store <= regRt[3:0];
                      2'b11: store <= writeData[3:0];
                  endcase
              end
              4'b1101 : begin //AN2
                  case(SW)
                      2'b00: store <= newPC[7:4];
                      2'b01: store <= regRs[7:4];
                      2'b10: store <= regRt[7:4];
                      2'b11: store <= writeData[7:4];
                  endcase
              end
              4'b1011 : begin //AN3
                  case(SW)
                      2'b00: store <= curPC[3:0];
                      2'b01: store <= instruction[24:21];
                      2'b10: store <= instruction[19:16];
                      2'b11: store <= aluResult[3:0];
                  endcase
              end
              4'b0111 : begin //AN4
                  case(SW)
                      2'b00: store <= curPC[7:4];
                      2'b01: store <= { 3'b000,instruction[25]};
                      2'b10: store <= { 3'b000,instruction[20]};
                      2'b11: store <= aluResult[7:4];
                  endcase
              end
          endcase
      end
  end
endmodule

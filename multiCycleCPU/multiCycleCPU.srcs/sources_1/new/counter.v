`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/18 22:32:42
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input Reset,
    output reg[3:0] AN
    );
    reg [16:0] counter;
    parameter limit = 100000;
    initial begin
    counter <= 0;
    AN <= 4'b0111;
    end
    
    always@ (posedge clk)//分频与计数
    begin
        if(Reset == 0) begin
            counter <= 0;
            AN <= 4'b0000;
        end else begin
            counter <= counter + 1;
            if(counter == limit)
            begin
                counter <= 0;
                case(AN)
                    4'b1110 : begin
                        AN <= 4'b1101;
                    end
                    4'b1101 : begin
                        AN <= 4'b1011;
                    end
                    4'b1011 : begin
                        AN <= 4'b0111;
                    end
                    4'b0111 : begin
                        AN <= 4'b1110;
                    end
                    4'b0000 : begin
                        AN <= 4'b0111;
                    end
                endcase
            end
        end
    end
endmodule

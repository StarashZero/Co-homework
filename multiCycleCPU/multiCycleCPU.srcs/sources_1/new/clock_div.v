`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/18 22:30:52
// Design Name: 
// Module Name: clock_div
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


module clock_div(
    input clk,
    input reset, 
    output reg clk_sys
    );
    parameter limit = 100000; 
    integer counter;
    always @(posedge clk or negedge reset) //·ÖÆµ
        if(!reset)
            counter <= 32'b0;
        else
            begin
                counter <= counter + 1'b1;
                if(counter == limit)
                    begin
                        counter <= 32'b0;
                        clk_sys <= ~clk_sys;
                    end
            end
endmodule
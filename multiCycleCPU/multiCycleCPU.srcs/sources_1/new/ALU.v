`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 16:07:15
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] rega, 
    input [31:0] regb,
    input [2:0] ALUopcode,
    output reg zero,
    output reg sign,
    output reg [31:0] result
    );

    always @( ALUopcode or rega or regb ) begin
        case (ALUopcode)
        3'b000 : begin //a + b
                    result = rega + regb;
                    zero = (result == 0)? 1 : 0;
                    sign = (result[31] == 0)? 0 : 1;
                end
        3'b001 : begin //a - b 
                    result = rega - regb;
                    zero = (result == 0)? 1 : 0;
                    sign = (result[31] == 0)? 0 : 1;
        end
        3'b010 : begin // b << a
                    result = regb << rega;
                    zero = (result == 0)? 1 : 0;
                    sign = (result[31] == 0)? 0 : 1;
        end
        3'b011 : begin // a | b
                    result = rega | regb;
                    zero = (result == 0)? 1 : 0;
                    sign = (result[31] == 0)? 0 : 1;
        end
        3'b100 : begin // a & b
                    result = rega & regb;
                    zero = (result == 0)? 1 : 0;
                    sign = (result[31] == 0)? 0 : 1;
        end
        3'b101 : begin // a < b
                   result = (rega < regb)?1:0;  
                   zero = (result == 0)? 1 : 0;
                   sign = (result[31] == 0)? 0 : 1;
       end
        3'b110 : begin // blt,bltz
            if(rega < regb && (rega[31] == regb[31]))result = 1;
            else if (rega[31] == 1 && regb[31] == 0) result = 1;
            else result = 0;
            zero = (result == 0)? 1 : 0;
            sign = (result[31] == 0)? 0 : 1;
        end
        3'b111 : begin //xori
            result = rega ^ regb;
            zero = (result == 0)? 1 : 0;
            sign = (result[31] == 0)? 0 : 1;
        end
        default : begin
            result = 32'h00000000;
            $display (" no match");
        end
        endcase
    end
endmodule

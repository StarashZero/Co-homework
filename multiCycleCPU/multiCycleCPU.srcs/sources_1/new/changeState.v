`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/13 15:19:18
// Design Name: 
// Module Name: changeState
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


module changeState(
    input [5:0] opCode,
    input RST,
    input clk,
    output reg[2:0] new_state
    );
    //设置常量，方便下面使用
    parameter [2:0] IF = 3'b000,
    ID = 3'b001, EXE1 = 3'b110,
    EXE2 = 3'b101, EXE3 = 3'b010,
    WB1 = 3'b111, WB2 = 3'b100,
    MEM = 3'b011;
    initial begin
        new_state = IF;
    end
    
    //时钟下降沿刷新状态
    always @(negedge clk or negedge RST) begin
        if ( RST == 0 ) begin
            new_state = IF;
        end
        else begin
            case (new_state)
                IF: new_state <= ID;
                ID: begin
                    if ( opCode == 6'b110100 || opCode == 6'b110101 || opCode == 6'b110110)//beq,bne,bltz
                        new_state <= EXE2;
                    else if ( opCode == 6'b110000 || opCode == 6'b110001)//sw,lw
                        new_state <= EXE3;
                    else if ( opCode == 6'b111000 || opCode == 6'b111001 || opCode == 6'b111010 || opCode == 6'b111111)//j,jal,jr,halt
                        new_state <= IF;
                    else 
                        new_state <= EXE1;
                end
                EXE1: new_state <= WB1;
                EXE2: new_state <= IF;
                EXE3: new_state <= MEM;
                WB1: new_state <= IF;
                WB2: new_state <= IF;
                MEM: begin
                    if ( opCode == 6'b110000)
                        new_state <= IF;
                    else 
                        new_state <= WB2;
                end
            endcase
        end
    end 
endmodule

`timescale 1ns / 1ps
module CPU_sim;

    reg CLK;
    reg Reset;

    wire [31:0] rega;
    wire [31:0] regb;
    wire [31:0] writeData;
    wire [31:0] Result;
    wire [31:0] curPC;
    wire [31:0] newPC;
    wire [31:0] instruction;

    singleCircleCPU uut (
        .clk(CLK), 
        .Reset(Reset),
        .instruction(instruction),
        .rega(rega),
        .regb(regb),
        .writeData(writeData),
        .curPC(curPC),
        .Result(Result),
        .newPC(newPC)
    );

    initial begin
        Reset = 1;
        CLK = -1;
        CLK = 1;
        forever #50 begin // 产生时钟信号
            CLK = !CLK;
        end
    end

endmodule

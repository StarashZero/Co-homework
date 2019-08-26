`timescale 1ns / 1ps
module CPU_sim;

    reg CLK;
    reg Reset;

    wire [31:0] readData1;
    wire [31:0] readData2;
    wire [31:0] DB;
    wire [31:0] Result;
    wire [31:0] curPC;
    wire [31:0] newPC;
    wire [31:0] instruction;

    multiCycleCPU uut (
        .clk(CLK), 
        .Reset(Reset),
        .instruction(instruction),
        .readData1(readData1),
        .readData2(readData2),
        .DB(DB),
        .curPC(curPC),
        .Result(Result),
        .newPC(newPC)
    );

    initial begin
        Reset = 1;
        CLK = 1;
        forever #50 begin // 产生时钟信号
            CLK = !CLK;
        end
    end

endmodule

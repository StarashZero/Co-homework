`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 21:31:53
// Design Name: 
// Module Name: basys3
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


module basys3(
    input clk,      //时钟信号
    input [1:0] SW, // 选择输出信号
    input Reset, // 重置按钮
    input Button, // 运行按钮
    output [3:0] AN, // 数码管位选择信号
    output [7:0] Out // 数码管输入信号
    );
    
    wire [31:0] aluResult; // ALU的result输出值
    wire [31:0] curPC;     //当前PC
    wire [31:0] writeData; // DB总线值
    wire [31:0] regRs; // 寄存器组rs寄存器的值
    wire [31:0] regRt; // 寄存器组rt寄存器的值
    wire [31:0] instruction;//指令
    wire myCLK;         //消抖后信号
    wire clk_sys;       //分频后信号
    wire [3:0] store; // 记录当前要显示位的值
    wire [31:0] newPC;//下一条PC
    
    singleCircleCPU my_SCPU(myCLK, Reset,instruction, regRs, regRt, writeData,curPC, aluResult, newPC);  //CPU 
    clock_div cd(clk,Reset,clk_sys);//分频
    key my_key(clk_sys, Reset, Button, myCLK);//消抖
    counter my_ct(clk,Reset,AN);//计数
    SegLED led(store, Out);//显示
    change my_cg(myCLK,Reset,AN,SW,aluResult,curPC,newPC,writeData,regRs,regRt,instruction,store);    //取值
endmodule

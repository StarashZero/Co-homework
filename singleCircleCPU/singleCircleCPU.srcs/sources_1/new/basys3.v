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
    input clk,      //ʱ���ź�
    input [1:0] SW, // ѡ������ź�
    input Reset, // ���ð�ť
    input Button, // ���а�ť
    output [3:0] AN, // �����λѡ���ź�
    output [7:0] Out // ����������ź�
    );
    
    wire [31:0] aluResult; // ALU��result���ֵ
    wire [31:0] curPC;     //��ǰPC
    wire [31:0] writeData; // DB����ֵ
    wire [31:0] regRs; // �Ĵ�����rs�Ĵ�����ֵ
    wire [31:0] regRt; // �Ĵ�����rt�Ĵ�����ֵ
    wire [31:0] instruction;//ָ��
    wire myCLK;         //�������ź�
    wire clk_sys;       //��Ƶ���ź�
    wire [3:0] store; // ��¼��ǰҪ��ʾλ��ֵ
    wire [31:0] newPC;//��һ��PC
    
    singleCircleCPU my_SCPU(myCLK, Reset,instruction, regRs, regRt, writeData,curPC, aluResult, newPC);  //CPU 
    clock_div cd(clk,Reset,clk_sys);//��Ƶ
    key my_key(clk_sys, Reset, Button, myCLK);//����
    counter my_ct(clk,Reset,AN);//����
    SegLED led(store, Out);//��ʾ
    change my_cg(myCLK,Reset,AN,SW,aluResult,curPC,newPC,writeData,regRs,regRt,instruction,store);    //ȡֵ
endmodule

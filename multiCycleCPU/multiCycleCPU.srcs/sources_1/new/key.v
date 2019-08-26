`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/18 22:32:03
// Design Name: 
// Module Name: key
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


module key(

input clk_sys,
    input reset,
    input key,
    output debkey
    );

	reg key_rrr,key_rr,key_r;
	always @(posedge clk_sys or negedge reset) //È¥¶¶
		if(!reset)
			begin
				key_rrr <= 1'b1;
				key_rr <= 1'b1;
				key_r <= 1'b1;
			end
		else
			begin
				key_rrr <= key_rr;
				key_rr <= key_r;
				key_r <= key;
			end
	//---------------------------------------------------------------	
	assign debkey = key_rrr & key_rr & key_r;
endmodule

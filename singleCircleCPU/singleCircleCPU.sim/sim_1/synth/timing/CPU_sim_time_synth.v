// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Sat Nov 17 15:19:10 2018
// Host        : LAPTOP-KAMAF0QO running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               E:/Xlink/VivadoProject/singleCircleCPU/singleCircleCPU.sim/sim_1/synth/timing/CPU_sim_time_synth.v
// Design      : singleCircleCPU
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module PC
   (Q,
    Out1_OBUF,
    opCode_OBUF,
    clk_IBUF_BUFG,
    Reset_IBUF);
  output [30:0]Q;
  output [1:0]Out1_OBUF;
  output [5:0]opCode_OBUF;
  input clk_IBUF_BUFG;
  input Reset_IBUF;

  wire [1:0]Out1_OBUF;
  wire PCWre;
  wire [30:0]Q;
  wire Reset_IBUF;
  wire [31:28]address0;
  wire [27:1]address0__0;
  wire \address[18]_i_1_n_0 ;
  wire \address[19]_i_1_n_0 ;
  wire \address[1]_i_1_n_0 ;
  wire \address[20]_i_1_n_0 ;
  wire \address[21]_i_1_n_0 ;
  wire \address[22]_i_1_n_0 ;
  wire \address[23]_i_1_n_0 ;
  wire \address[24]_i_1_n_0 ;
  wire \address[25]_i_1_n_0 ;
  wire \address[26]_i_1_n_0 ;
  wire \address[27]_i_1_n_0 ;
  wire \address[28]_i_10_n_0 ;
  wire \address[28]_i_3_n_0 ;
  wire \address[28]_i_4_n_0 ;
  wire \address[28]_i_5_n_0 ;
  wire \address[28]_i_6_n_0 ;
  wire \address[28]_i_7_n_0 ;
  wire \address[28]_i_8_n_0 ;
  wire \address[28]_i_9_n_0 ;
  wire \address[31]_i_3_n_0 ;
  wire \address[31]_i_4_n_0 ;
  wire \address[31]_i_5_n_0 ;
  wire \address[31]_i_6_n_0 ;
  wire \address_reg[28]_i_1_n_0 ;
  wire \address_reg[28]_i_1_n_1 ;
  wire \address_reg[28]_i_1_n_2 ;
  wire \address_reg[28]_i_1_n_3 ;
  wire \address_reg[28]_i_2_n_0 ;
  wire \address_reg[28]_i_2_n_1 ;
  wire \address_reg[28]_i_2_n_2 ;
  wire \address_reg[28]_i_2_n_3 ;
  wire \address_reg[31]_i_2_n_2 ;
  wire \address_reg[31]_i_2_n_3 ;
  wire clk_IBUF_BUFG;
  wire g0_b0__0_i_1_n_0;
  wire g0_b0__0_i_1_n_1;
  wire g0_b0__0_i_1_n_2;
  wire g0_b0__0_i_1_n_3;
  wire g0_b0__0_i_2_n_0;
  wire g0_b0__0_i_3_n_0;
  wire g0_b0__0_i_4_n_0;
  wire g0_b0__0_i_5_n_0;
  wire g0_b0__0_n_0;
  wire g0_b1__0_n_0;
  wire g0_b2__0__0_i_1_n_0;
  wire g0_b2__0__0_i_1_n_1;
  wire g0_b2__0__0_i_1_n_2;
  wire g0_b2__0__0_i_1_n_3;
  wire g0_b2__0__0_i_2_n_0;
  wire g0_b2__0__0_i_3_n_0;
  wire g0_b2__0__0_i_4_n_0;
  wire g0_b2__0__0_i_5_n_0;
  wire g0_b2__0__0_n_0;
  wire g0_b2__0__1_n_0;
  wire g0_b2__0__2_n_0;
  wire g0_b2__0__3_n_0;
  wire g0_b2__0__4_n_0;
  wire g0_b2__0__5_n_0;
  wire g0_b2__0_i_1_n_0;
  wire g0_b2__0_i_1_n_1;
  wire g0_b2__0_i_1_n_2;
  wire g0_b2__0_i_1_n_3;
  wire g0_b2__0_i_2_n_0;
  wire g0_b2__0_i_3_n_0;
  wire g0_b2__0_i_4_n_0;
  wire g0_b2__0_i_5_n_0;
  wire g0_b2__0_n_0;
  wire g0_b2__1_n_0;
  wire g0_b3__0_i_1_n_0;
  wire g0_b3__0_i_2_n_0;
  wire g0_b3__0_i_2_n_1;
  wire g0_b3__0_i_2_n_2;
  wire g0_b3__0_i_2_n_3;
  wire g0_b3__0_i_3_n_0;
  wire g0_b3__0_i_4_n_0;
  wire g0_b3__0_i_5_n_0;
  wire g0_b3__0_i_6_n_0;
  wire g0_b3__0_n_0;
  wire g0_b3__1_i_1_n_0;
  wire g0_b3__1_i_1_n_1;
  wire g0_b3__1_i_1_n_2;
  wire g0_b3__1_i_1_n_3;
  wire g0_b3__1_i_2_n_0;
  wire g0_b3__1_i_3_n_0;
  wire g0_b3__1_i_4_n_0;
  wire g0_b3__1_i_5_n_0;
  wire g0_b3__1_n_0;
  wire g0_b4_n_0;
  wire g0_b5__0_n_0;
  wire g0_b6__0_n_0;
  wire g0_b6__1__0_i_1_n_0;
  wire g0_b6__1_n_0;
  wire [5:0]opCode_OBUF;
  wire [3:2]\NLW_address_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_address_reg[31]_i_2_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[18]_i_1 
       (.I0(address0__0[18]),
        .I1(g0_b3__0_i_1_n_0),
        .O(\address[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[19]_i_1 
       (.I0(address0__0[19]),
        .I1(g0_b3__0_i_1_n_0),
        .O(\address[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[1]_i_1 
       (.I0(address0__0[1]),
        .I1(g0_b3__0_i_1_n_0),
        .O(\address[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[20]_i_1 
       (.I0(address0__0[20]),
        .I1(g0_b3__0_i_1_n_0),
        .O(\address[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[21]_i_1 
       (.I0(address0__0[21]),
        .I1(g0_b3__0_i_1_n_0),
        .O(\address[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[22]_i_1 
       (.I0(address0__0[22]),
        .I1(g0_b3__0_i_1_n_0),
        .O(\address[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[23]_i_1 
       (.I0(address0__0[23]),
        .I1(g0_b3__0_i_1_n_0),
        .O(\address[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[24]_i_1 
       (.I0(address0__0[24]),
        .I1(g0_b3__0_i_1_n_0),
        .O(\address[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[25]_i_1 
       (.I0(address0__0[25]),
        .I1(g0_b3__0_i_1_n_0),
        .O(\address[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[26]_i_1 
       (.I0(address0__0[26]),
        .I1(g0_b3__0_i_1_n_0),
        .O(\address[26]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \address[27]_i_1 
       (.I0(address0__0[27]),
        .I1(g0_b3__0_i_1_n_0),
        .O(\address[27]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \address[28]_i_10 
       (.I0(Q[20]),
        .O(\address[28]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \address[28]_i_3 
       (.I0(Q[27]),
        .O(\address[28]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \address[28]_i_4 
       (.I0(Q[26]),
        .O(\address[28]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \address[28]_i_5 
       (.I0(Q[25]),
        .O(\address[28]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \address[28]_i_6 
       (.I0(Q[24]),
        .O(\address[28]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \address[28]_i_7 
       (.I0(Q[23]),
        .O(\address[28]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \address[28]_i_8 
       (.I0(Q[22]),
        .O(\address[28]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \address[28]_i_9 
       (.I0(Q[21]),
        .O(\address[28]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \address[31]_i_1 
       (.I0(opCode_OBUF[3]),
        .I1(opCode_OBUF[2]),
        .I2(opCode_OBUF[4]),
        .I3(opCode_OBUF[5]),
        .I4(opCode_OBUF[1]),
        .I5(opCode_OBUF[0]),
        .O(PCWre));
  LUT1 #(
    .INIT(2'h1)) 
    \address[31]_i_3 
       (.I0(Reset_IBUF),
        .O(\address[31]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \address[31]_i_4 
       (.I0(Q[30]),
        .O(\address[31]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \address[31]_i_5 
       (.I0(Q[29]),
        .O(\address[31]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \address[31]_i_6 
       (.I0(Q[28]),
        .O(\address[31]_i_6_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b2__0__2_n_0),
        .Q(Q[9]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b2__0__1_n_0),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b2__0__0_n_0),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b3__0_n_0),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b4_n_0),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b5__0_n_0),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b6__0_n_0),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b2__0_n_0),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(\address[18]_i_1_n_0 ),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(\address[19]_i_1_n_0 ),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(\address[1]_i_1_n_0 ),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(\address[20]_i_1_n_0 ),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(\address[21]_i_1_n_0 ),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(\address[22]_i_1_n_0 ),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(\address[23]_i_1_n_0 ),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(\address[24]_i_1_n_0 ),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(\address[25]_i_1_n_0 ),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(\address[26]_i_1_n_0 ),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(\address[27]_i_1_n_0 ),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(address0[28]),
        .Q(Q[27]));
  CARRY4 \address_reg[28]_i_1 
       (.CI(\address_reg[28]_i_2_n_0 ),
        .CO({\address_reg[28]_i_1_n_0 ,\address_reg[28]_i_1_n_1 ,\address_reg[28]_i_1_n_2 ,\address_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({address0[28],address0__0[27:25]}),
        .S({\address[28]_i_3_n_0 ,\address[28]_i_4_n_0 ,\address[28]_i_5_n_0 ,\address[28]_i_6_n_0 }));
  CARRY4 \address_reg[28]_i_2 
       (.CI(g0_b2__0_i_1_n_0),
        .CO({\address_reg[28]_i_2_n_0 ,\address_reg[28]_i_2_n_1 ,\address_reg[28]_i_2_n_2 ,\address_reg[28]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(address0__0[24:21]),
        .S({\address[28]_i_7_n_0 ,\address[28]_i_8_n_0 ,\address[28]_i_9_n_0 ,\address[28]_i_10_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(address0[29]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b0__0_n_0),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(address0[30]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(address0[31]),
        .Q(Q[30]));
  CARRY4 \address_reg[31]_i_2 
       (.CI(\address_reg[28]_i_1_n_0 ),
        .CO({\NLW_address_reg[31]_i_2_CO_UNCONNECTED [3:2],\address_reg[31]_i_2_n_2 ,\address_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_address_reg[31]_i_2_O_UNCONNECTED [3],address0[31:29]}),
        .S({1'b0,\address[31]_i_4_n_0 ,\address[31]_i_5_n_0 ,\address[31]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b1__0_n_0),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b2__1_n_0),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b3__1_n_0),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b2__0__5_n_0),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b2__0__4_n_0),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b6__1_n_0),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \address_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(PCWre),
        .CLR(\address[31]_i_3_n_0 ),
        .D(g0_b2__0__3_n_0),
        .Q(Q[8]));
  LUT6 #(
    .INIT(64'h8000FFFF80000000)) 
    g0_b0__0
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[2]),
        .O(g0_b0__0_n_0));
  CARRY4 g0_b0__0_i_1
       (.CI(1'b0),
        .CO({g0_b0__0_i_1_n_0,g0_b0__0_i_1_n_1,g0_b0__0_i_1_n_2,g0_b0__0_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Q[1],1'b0}),
        .O(address0__0[4:1]),
        .S({g0_b0__0_i_2_n_0,g0_b0__0_i_3_n_0,g0_b0__0_i_4_n_0,g0_b0__0_i_5_n_0}));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b0__0_i_2
       (.I0(Q[3]),
        .O(g0_b0__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b0__0_i_3
       (.I0(Q[2]),
        .O(g0_b0__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    g0_b0__0_i_4
       (.I0(Q[1]),
        .O(g0_b0__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b0__0_i_5
       (.I0(Q[0]),
        .O(g0_b0__0_i_5_n_0));
  LUT6 #(
    .INIT(64'h4882FFFF48820000)) 
    g0_b1__0
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[3]),
        .O(g0_b1__0_n_0));
  LUT6 #(
    .INIT(64'h4880FFFF48800000)) 
    g0_b2__0
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[17]),
        .O(g0_b2__0_n_0));
  LUT6 #(
    .INIT(64'h4880FFFF48800000)) 
    g0_b2__0__0
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[12]),
        .O(g0_b2__0__0_n_0));
  CARRY4 g0_b2__0__0_i_1
       (.CI(g0_b3__1_i_1_n_0),
        .CO({g0_b2__0__0_i_1_n_0,g0_b2__0__0_i_1_n_1,g0_b2__0__0_i_1_n_2,g0_b2__0__0_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(address0__0[12:9]),
        .S({g0_b2__0__0_i_2_n_0,g0_b2__0__0_i_3_n_0,g0_b2__0__0_i_4_n_0,g0_b2__0__0_i_5_n_0}));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b2__0__0_i_2
       (.I0(Q[11]),
        .O(g0_b2__0__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b2__0__0_i_3
       (.I0(Q[10]),
        .O(g0_b2__0__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b2__0__0_i_4
       (.I0(Q[9]),
        .O(g0_b2__0__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b2__0__0_i_5
       (.I0(Q[8]),
        .O(g0_b2__0__0_i_5_n_0));
  LUT6 #(
    .INIT(64'h4880FFFF48800000)) 
    g0_b2__0__1
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[11]),
        .O(g0_b2__0__1_n_0));
  LUT6 #(
    .INIT(64'h4880FFFF48800000)) 
    g0_b2__0__2
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[10]),
        .O(g0_b2__0__2_n_0));
  LUT6 #(
    .INIT(64'h4880FFFF48800000)) 
    g0_b2__0__3
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[9]),
        .O(g0_b2__0__3_n_0));
  LUT6 #(
    .INIT(64'h4880FFFF48800000)) 
    g0_b2__0__4
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[7]),
        .O(g0_b2__0__4_n_0));
  LUT6 #(
    .INIT(64'h4880FFFF48800000)) 
    g0_b2__0__5
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[6]),
        .O(g0_b2__0__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h48800000)) 
    g0_b2__0__6
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b6__1__0_i_1_n_0),
        .O(Out1_OBUF[1]));
  CARRY4 g0_b2__0_i_1
       (.CI(g0_b3__0_i_2_n_0),
        .CO({g0_b2__0_i_1_n_0,g0_b2__0_i_1_n_1,g0_b2__0_i_1_n_2,g0_b2__0_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(address0__0[20:17]),
        .S({g0_b2__0_i_2_n_0,g0_b2__0_i_3_n_0,g0_b2__0_i_4_n_0,g0_b2__0_i_5_n_0}));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b2__0_i_2
       (.I0(Q[19]),
        .O(g0_b2__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b2__0_i_3
       (.I0(Q[18]),
        .O(g0_b2__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b2__0_i_4
       (.I0(Q[17]),
        .O(g0_b2__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b2__0_i_5
       (.I0(Q[16]),
        .O(g0_b2__0_i_5_n_0));
  LUT6 #(
    .INIT(64'h7980FFFF79800000)) 
    g0_b2__1
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[4]),
        .O(g0_b2__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h20B9)) 
    g0_b2__2
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .O(opCode_OBUF[0]));
  LUT6 #(
    .INIT(64'h488CFFFF488C0000)) 
    g0_b3__0
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[13]),
        .O(g0_b3__0_n_0));
  LUT6 #(
    .INIT(64'h0000000010000000)) 
    g0_b3__0_i_1
       (.I0(opCode_OBUF[1]),
        .I1(opCode_OBUF[2]),
        .I2(opCode_OBUF[3]),
        .I3(opCode_OBUF[4]),
        .I4(opCode_OBUF[5]),
        .I5(opCode_OBUF[0]),
        .O(g0_b3__0_i_1_n_0));
  CARRY4 g0_b3__0_i_2
       (.CI(g0_b2__0__0_i_1_n_0),
        .CO({g0_b3__0_i_2_n_0,g0_b3__0_i_2_n_1,g0_b3__0_i_2_n_2,g0_b3__0_i_2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(address0__0[16:13]),
        .S({g0_b3__0_i_3_n_0,g0_b3__0_i_4_n_0,g0_b3__0_i_5_n_0,g0_b3__0_i_6_n_0}));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b3__0_i_3
       (.I0(Q[15]),
        .O(g0_b3__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b3__0_i_4
       (.I0(Q[14]),
        .O(g0_b3__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b3__0_i_5
       (.I0(Q[13]),
        .O(g0_b3__0_i_5_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b3__0_i_6
       (.I0(Q[12]),
        .O(g0_b3__0_i_6_n_0));
  LUT6 #(
    .INIT(64'h4C81FFFF4C810000)) 
    g0_b3__1
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[5]),
        .O(g0_b3__1_n_0));
  CARRY4 g0_b3__1_i_1
       (.CI(g0_b0__0_i_1_n_0),
        .CO({g0_b3__1_i_1_n_0,g0_b3__1_i_1_n_1,g0_b3__1_i_1_n_2,g0_b3__1_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(address0__0[8:5]),
        .S({g0_b3__1_i_2_n_0,g0_b3__1_i_3_n_0,g0_b3__1_i_4_n_0,g0_b3__1_i_5_n_0}));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b3__1_i_2
       (.I0(Q[7]),
        .O(g0_b3__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b3__1_i_3
       (.I0(Q[6]),
        .O(g0_b3__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b3__1_i_4
       (.I0(Q[5]),
        .O(g0_b3__1_i_4_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    g0_b3__1_i_5
       (.I0(Q[4]),
        .O(g0_b3__1_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hF422)) 
    g0_b3__2
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .O(opCode_OBUF[1]));
  LUT6 #(
    .INIT(64'h4884FFFF48840000)) 
    g0_b4
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[14]),
        .O(g0_b4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h4)) 
    g0_b4__0
       (.I0(Q[2]),
        .I1(Q[4]),
        .O(opCode_OBUF[2]));
  LUT6 #(
    .INIT(64'h4898FFFF48980000)) 
    g0_b5__0
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[15]),
        .O(g0_b5__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0340)) 
    g0_b5__1
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .O(opCode_OBUF[3]));
  LUT6 #(
    .INIT(64'h48E0FFFF48E00000)) 
    g0_b6__0
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[16]),
        .O(g0_b6__0_n_0));
  LUT6 #(
    .INIT(64'h48C0FFFF48C00000)) 
    g0_b6__1
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b3__0_i_1_n_0),
        .I5(address0__0[8]),
        .O(g0_b6__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h48C00000)) 
    g0_b6__1__0
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(g0_b6__1__0_i_1_n_0),
        .O(Out1_OBUF[0]));
  LUT6 #(
    .INIT(64'h0000000400000000)) 
    g0_b6__1__0_i_1
       (.I0(opCode_OBUF[5]),
        .I1(opCode_OBUF[4]),
        .I2(opCode_OBUF[0]),
        .I3(opCode_OBUF[1]),
        .I4(opCode_OBUF[2]),
        .I5(opCode_OBUF[3]),
        .O(g0_b6__1__0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0BF2)) 
    g0_b6__2
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .O(opCode_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h3880)) 
    g0_b7__1
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .O(opCode_OBUF[5]));
endmodule

(* NotValidForBitStream *)
module singleCircleCPU
   (clk,
    Reset,
    CLR,
    opCode,
    Out1,
    Out2,
    curPC,
    Result);
  input clk;
  input Reset;
  input CLR;
  output [5:0]opCode;
  output [31:0]Out1;
  output [31:0]Out2;
  output [31:0]curPC;
  output [31:0]Result;

  wire [31:0]Out1;
  wire [1:0]Out1_OBUF;
  wire [31:0]Out2;
  wire Reset;
  wire Reset_IBUF;
  wire [31:0]Result;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [31:0]curPC;
  wire [31:1]curPC_OBUF;
  wire [5:0]opCode;
  wire [5:0]opCode_OBUF;

initial begin
 $sdf_annotate("CPU_sim_time_synth.sdf",,,,"tool_control");
end
  OBUF \Out1_OBUF[0]_inst 
       (.I(Out1_OBUF[0]),
        .O(Out1[0]));
  OBUF \Out1_OBUF[10]_inst 
       (.I(1'b0),
        .O(Out1[10]));
  OBUF \Out1_OBUF[11]_inst 
       (.I(1'b0),
        .O(Out1[11]));
  OBUF \Out1_OBUF[12]_inst 
       (.I(1'b0),
        .O(Out1[12]));
  OBUF \Out1_OBUF[13]_inst 
       (.I(1'b0),
        .O(Out1[13]));
  OBUF \Out1_OBUF[14]_inst 
       (.I(1'b0),
        .O(Out1[14]));
  OBUF \Out1_OBUF[15]_inst 
       (.I(1'b0),
        .O(Out1[15]));
  OBUF \Out1_OBUF[16]_inst 
       (.I(1'b0),
        .O(Out1[16]));
  OBUF \Out1_OBUF[17]_inst 
       (.I(1'b0),
        .O(Out1[17]));
  OBUF \Out1_OBUF[18]_inst 
       (.I(1'b0),
        .O(Out1[18]));
  OBUF \Out1_OBUF[19]_inst 
       (.I(1'b0),
        .O(Out1[19]));
  OBUF \Out1_OBUF[1]_inst 
       (.I(Out1_OBUF[1]),
        .O(Out1[1]));
  OBUF \Out1_OBUF[20]_inst 
       (.I(1'b0),
        .O(Out1[20]));
  OBUF \Out1_OBUF[21]_inst 
       (.I(1'b0),
        .O(Out1[21]));
  OBUF \Out1_OBUF[22]_inst 
       (.I(1'b0),
        .O(Out1[22]));
  OBUF \Out1_OBUF[23]_inst 
       (.I(1'b0),
        .O(Out1[23]));
  OBUF \Out1_OBUF[24]_inst 
       (.I(1'b0),
        .O(Out1[24]));
  OBUF \Out1_OBUF[25]_inst 
       (.I(1'b0),
        .O(Out1[25]));
  OBUF \Out1_OBUF[26]_inst 
       (.I(1'b0),
        .O(Out1[26]));
  OBUF \Out1_OBUF[27]_inst 
       (.I(1'b0),
        .O(Out1[27]));
  OBUF \Out1_OBUF[28]_inst 
       (.I(1'b0),
        .O(Out1[28]));
  OBUF \Out1_OBUF[29]_inst 
       (.I(1'b0),
        .O(Out1[29]));
  OBUF \Out1_OBUF[2]_inst 
       (.I(Out1_OBUF[1]),
        .O(Out1[2]));
  OBUF \Out1_OBUF[30]_inst 
       (.I(1'b0),
        .O(Out1[30]));
  OBUF \Out1_OBUF[31]_inst 
       (.I(1'b0),
        .O(Out1[31]));
  OBUF \Out1_OBUF[3]_inst 
       (.I(Out1_OBUF[1]),
        .O(Out1[3]));
  OBUF \Out1_OBUF[4]_inst 
       (.I(Out1_OBUF[1]),
        .O(Out1[4]));
  OBUF \Out1_OBUF[5]_inst 
       (.I(1'b0),
        .O(Out1[5]));
  OBUF \Out1_OBUF[6]_inst 
       (.I(1'b0),
        .O(Out1[6]));
  OBUF \Out1_OBUF[7]_inst 
       (.I(1'b0),
        .O(Out1[7]));
  OBUF \Out1_OBUF[8]_inst 
       (.I(1'b0),
        .O(Out1[8]));
  OBUF \Out1_OBUF[9]_inst 
       (.I(1'b0),
        .O(Out1[9]));
  OBUF \Out2_OBUF[0]_inst 
       (.I(1'b0),
        .O(Out2[0]));
  OBUF \Out2_OBUF[10]_inst 
       (.I(1'b0),
        .O(Out2[10]));
  OBUF \Out2_OBUF[11]_inst 
       (.I(1'b0),
        .O(Out2[11]));
  OBUF \Out2_OBUF[12]_inst 
       (.I(1'b0),
        .O(Out2[12]));
  OBUF \Out2_OBUF[13]_inst 
       (.I(1'b0),
        .O(Out2[13]));
  OBUF \Out2_OBUF[14]_inst 
       (.I(1'b0),
        .O(Out2[14]));
  OBUF \Out2_OBUF[15]_inst 
       (.I(1'b0),
        .O(Out2[15]));
  OBUF \Out2_OBUF[16]_inst 
       (.I(1'b0),
        .O(Out2[16]));
  OBUF \Out2_OBUF[17]_inst 
       (.I(1'b0),
        .O(Out2[17]));
  OBUF \Out2_OBUF[18]_inst 
       (.I(1'b0),
        .O(Out2[18]));
  OBUF \Out2_OBUF[19]_inst 
       (.I(1'b0),
        .O(Out2[19]));
  OBUF \Out2_OBUF[1]_inst 
       (.I(1'b0),
        .O(Out2[1]));
  OBUF \Out2_OBUF[20]_inst 
       (.I(1'b0),
        .O(Out2[20]));
  OBUF \Out2_OBUF[21]_inst 
       (.I(1'b0),
        .O(Out2[21]));
  OBUF \Out2_OBUF[22]_inst 
       (.I(1'b0),
        .O(Out2[22]));
  OBUF \Out2_OBUF[23]_inst 
       (.I(1'b0),
        .O(Out2[23]));
  OBUF \Out2_OBUF[24]_inst 
       (.I(1'b0),
        .O(Out2[24]));
  OBUF \Out2_OBUF[25]_inst 
       (.I(1'b0),
        .O(Out2[25]));
  OBUF \Out2_OBUF[26]_inst 
       (.I(1'b0),
        .O(Out2[26]));
  OBUF \Out2_OBUF[27]_inst 
       (.I(1'b0),
        .O(Out2[27]));
  OBUF \Out2_OBUF[28]_inst 
       (.I(1'b0),
        .O(Out2[28]));
  OBUF \Out2_OBUF[29]_inst 
       (.I(1'b0),
        .O(Out2[29]));
  OBUF \Out2_OBUF[2]_inst 
       (.I(1'b0),
        .O(Out2[2]));
  OBUF \Out2_OBUF[30]_inst 
       (.I(1'b0),
        .O(Out2[30]));
  OBUF \Out2_OBUF[31]_inst 
       (.I(1'b0),
        .O(Out2[31]));
  OBUF \Out2_OBUF[3]_inst 
       (.I(1'b0),
        .O(Out2[3]));
  OBUF \Out2_OBUF[4]_inst 
       (.I(1'b0),
        .O(Out2[4]));
  OBUF \Out2_OBUF[5]_inst 
       (.I(1'b0),
        .O(Out2[5]));
  OBUF \Out2_OBUF[6]_inst 
       (.I(1'b0),
        .O(Out2[6]));
  OBUF \Out2_OBUF[7]_inst 
       (.I(1'b0),
        .O(Out2[7]));
  OBUF \Out2_OBUF[8]_inst 
       (.I(1'b0),
        .O(Out2[8]));
  OBUF \Out2_OBUF[9]_inst 
       (.I(1'b0),
        .O(Out2[9]));
  IBUF Reset_IBUF_inst
       (.I(Reset),
        .O(Reset_IBUF));
  OBUF \Result_OBUF[0]_inst 
       (.I(1'b0),
        .O(Result[0]));
  OBUF \Result_OBUF[10]_inst 
       (.I(1'b0),
        .O(Result[10]));
  OBUF \Result_OBUF[11]_inst 
       (.I(1'b0),
        .O(Result[11]));
  OBUF \Result_OBUF[12]_inst 
       (.I(1'b0),
        .O(Result[12]));
  OBUF \Result_OBUF[13]_inst 
       (.I(1'b0),
        .O(Result[13]));
  OBUF \Result_OBUF[14]_inst 
       (.I(1'b0),
        .O(Result[14]));
  OBUF \Result_OBUF[15]_inst 
       (.I(1'b0),
        .O(Result[15]));
  OBUF \Result_OBUF[16]_inst 
       (.I(1'b0),
        .O(Result[16]));
  OBUF \Result_OBUF[17]_inst 
       (.I(1'b0),
        .O(Result[17]));
  OBUF \Result_OBUF[18]_inst 
       (.I(1'b0),
        .O(Result[18]));
  OBUF \Result_OBUF[19]_inst 
       (.I(1'b0),
        .O(Result[19]));
  OBUF \Result_OBUF[1]_inst 
       (.I(1'b0),
        .O(Result[1]));
  OBUF \Result_OBUF[20]_inst 
       (.I(1'b0),
        .O(Result[20]));
  OBUF \Result_OBUF[21]_inst 
       (.I(1'b0),
        .O(Result[21]));
  OBUF \Result_OBUF[22]_inst 
       (.I(1'b0),
        .O(Result[22]));
  OBUF \Result_OBUF[23]_inst 
       (.I(1'b0),
        .O(Result[23]));
  OBUF \Result_OBUF[24]_inst 
       (.I(1'b0),
        .O(Result[24]));
  OBUF \Result_OBUF[25]_inst 
       (.I(1'b0),
        .O(Result[25]));
  OBUF \Result_OBUF[26]_inst 
       (.I(1'b0),
        .O(Result[26]));
  OBUF \Result_OBUF[27]_inst 
       (.I(1'b0),
        .O(Result[27]));
  OBUF \Result_OBUF[28]_inst 
       (.I(1'b0),
        .O(Result[28]));
  OBUF \Result_OBUF[29]_inst 
       (.I(1'b0),
        .O(Result[29]));
  OBUF \Result_OBUF[2]_inst 
       (.I(1'b0),
        .O(Result[2]));
  OBUF \Result_OBUF[30]_inst 
       (.I(1'b0),
        .O(Result[30]));
  OBUF \Result_OBUF[31]_inst 
       (.I(1'b0),
        .O(Result[31]));
  OBUF \Result_OBUF[3]_inst 
       (.I(1'b0),
        .O(Result[3]));
  OBUF \Result_OBUF[4]_inst 
       (.I(1'b0),
        .O(Result[4]));
  OBUF \Result_OBUF[5]_inst 
       (.I(1'b0),
        .O(Result[5]));
  OBUF \Result_OBUF[6]_inst 
       (.I(1'b0),
        .O(Result[6]));
  OBUF \Result_OBUF[7]_inst 
       (.I(1'b0),
        .O(Result[7]));
  OBUF \Result_OBUF[8]_inst 
       (.I(1'b0),
        .O(Result[8]));
  OBUF \Result_OBUF[9]_inst 
       (.I(1'b0),
        .O(Result[9]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \curPC_OBUF[0]_inst 
       (.I(1'b0),
        .O(curPC[0]));
  OBUF \curPC_OBUF[10]_inst 
       (.I(curPC_OBUF[10]),
        .O(curPC[10]));
  OBUF \curPC_OBUF[11]_inst 
       (.I(curPC_OBUF[11]),
        .O(curPC[11]));
  OBUF \curPC_OBUF[12]_inst 
       (.I(curPC_OBUF[12]),
        .O(curPC[12]));
  OBUF \curPC_OBUF[13]_inst 
       (.I(curPC_OBUF[13]),
        .O(curPC[13]));
  OBUF \curPC_OBUF[14]_inst 
       (.I(curPC_OBUF[14]),
        .O(curPC[14]));
  OBUF \curPC_OBUF[15]_inst 
       (.I(curPC_OBUF[15]),
        .O(curPC[15]));
  OBUF \curPC_OBUF[16]_inst 
       (.I(curPC_OBUF[16]),
        .O(curPC[16]));
  OBUF \curPC_OBUF[17]_inst 
       (.I(curPC_OBUF[17]),
        .O(curPC[17]));
  OBUF \curPC_OBUF[18]_inst 
       (.I(curPC_OBUF[18]),
        .O(curPC[18]));
  OBUF \curPC_OBUF[19]_inst 
       (.I(curPC_OBUF[19]),
        .O(curPC[19]));
  OBUF \curPC_OBUF[1]_inst 
       (.I(curPC_OBUF[1]),
        .O(curPC[1]));
  OBUF \curPC_OBUF[20]_inst 
       (.I(curPC_OBUF[20]),
        .O(curPC[20]));
  OBUF \curPC_OBUF[21]_inst 
       (.I(curPC_OBUF[21]),
        .O(curPC[21]));
  OBUF \curPC_OBUF[22]_inst 
       (.I(curPC_OBUF[22]),
        .O(curPC[22]));
  OBUF \curPC_OBUF[23]_inst 
       (.I(curPC_OBUF[23]),
        .O(curPC[23]));
  OBUF \curPC_OBUF[24]_inst 
       (.I(curPC_OBUF[24]),
        .O(curPC[24]));
  OBUF \curPC_OBUF[25]_inst 
       (.I(curPC_OBUF[25]),
        .O(curPC[25]));
  OBUF \curPC_OBUF[26]_inst 
       (.I(curPC_OBUF[26]),
        .O(curPC[26]));
  OBUF \curPC_OBUF[27]_inst 
       (.I(curPC_OBUF[27]),
        .O(curPC[27]));
  OBUF \curPC_OBUF[28]_inst 
       (.I(curPC_OBUF[28]),
        .O(curPC[28]));
  OBUF \curPC_OBUF[29]_inst 
       (.I(curPC_OBUF[29]),
        .O(curPC[29]));
  OBUF \curPC_OBUF[2]_inst 
       (.I(curPC_OBUF[2]),
        .O(curPC[2]));
  OBUF \curPC_OBUF[30]_inst 
       (.I(curPC_OBUF[30]),
        .O(curPC[30]));
  OBUF \curPC_OBUF[31]_inst 
       (.I(curPC_OBUF[31]),
        .O(curPC[31]));
  OBUF \curPC_OBUF[3]_inst 
       (.I(curPC_OBUF[3]),
        .O(curPC[3]));
  OBUF \curPC_OBUF[4]_inst 
       (.I(curPC_OBUF[4]),
        .O(curPC[4]));
  OBUF \curPC_OBUF[5]_inst 
       (.I(curPC_OBUF[5]),
        .O(curPC[5]));
  OBUF \curPC_OBUF[6]_inst 
       (.I(curPC_OBUF[6]),
        .O(curPC[6]));
  OBUF \curPC_OBUF[7]_inst 
       (.I(curPC_OBUF[7]),
        .O(curPC[7]));
  OBUF \curPC_OBUF[8]_inst 
       (.I(curPC_OBUF[8]),
        .O(curPC[8]));
  OBUF \curPC_OBUF[9]_inst 
       (.I(curPC_OBUF[9]),
        .O(curPC[9]));
  OBUF \opCode_OBUF[0]_inst 
       (.I(opCode_OBUF[0]),
        .O(opCode[0]));
  OBUF \opCode_OBUF[1]_inst 
       (.I(opCode_OBUF[1]),
        .O(opCode[1]));
  OBUF \opCode_OBUF[2]_inst 
       (.I(opCode_OBUF[2]),
        .O(opCode[2]));
  OBUF \opCode_OBUF[3]_inst 
       (.I(opCode_OBUF[3]),
        .O(opCode[3]));
  OBUF \opCode_OBUF[4]_inst 
       (.I(opCode_OBUF[4]),
        .O(opCode[4]));
  OBUF \opCode_OBUF[5]_inst 
       (.I(opCode_OBUF[5]),
        .O(opCode[5]));
  PC pc
       (.Out1_OBUF(Out1_OBUF),
        .Q(curPC_OBUF),
        .Reset_IBUF(Reset_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .opCode_OBUF(opCode_OBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

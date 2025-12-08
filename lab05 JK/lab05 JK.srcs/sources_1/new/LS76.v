`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/25 14:01:48
// Design Name: 
// Module Name: LS76
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


module LS76(
        input CP1,CP2,J1,J2,K1,K2,SD_1,SD_2,RD_1,RD_2,
        output Q1,Q2,
        output Q_1,Q_2
    );

    JK Jk1(
        .SD_(SD_1),
        .RD_(RD_1),
        .CP(CP1),
        .J(J1),
        .K(K1),
        .Q(Q1),
        .Q_(Q_1)
    );
    JK Jk2(
        .SD_(SD_2),
        .RD_(RD_2),
        .CP(CP2),
        .J(J2),
        .K(K2),
        .Q(Q2),
        .Q_(Q_2)
    );


endmodule

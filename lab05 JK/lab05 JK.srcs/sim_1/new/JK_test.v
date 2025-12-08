`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/21 23:00:03
// Design Name: 
// Module Name: JK_test
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


module JK_test();
    reg SD_;
    reg RD_;
    reg CP;
    reg J;
    reg K;
    wire Q;
    wire Q_;

    JK jk(
        .SD_(SD_),
        .RD_(RD_),
        .CP(CP),
        .J(J),
        .K(K),
        .Q(Q),
        .Q_(Q_)
    )

    initial begin
        
    end
endmodule

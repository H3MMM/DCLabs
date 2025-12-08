`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/24 23:10:16
// Design Name: 
// Module Name: JKtest
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


module JKtest();
    reg SD_;
    reg RD_;
    reg CP;
    reg J;
    reg K;
    wire Q;
    wire Q_;

    JK test(
        .SD_(SD_),
        .RD_(RD_),
        .CP(CP),
        .J(J),
        .K(K),
        .Q(Q),
        .Q_(Q_)
    );

    initial begin
        CP = 1;
    end

    always #50 CP = ~CP;
    initial begin
        J = 0;
        K = 0;
        
        RD_ = 0;
        SD_ = 1;
        #50
        RD_=1;
        SD_=0;


        RD_ = 1;
        SD_ = 1;
        #20
        J = 0; K = 0;
        #50
        J = 0; K = 1;
        #50
        J = 1; K = 0;
        #50
        J = 1; K = 1;
        #50
        J = 0; K = 0;
    end


endmodule

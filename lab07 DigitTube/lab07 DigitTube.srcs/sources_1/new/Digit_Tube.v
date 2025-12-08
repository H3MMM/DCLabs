`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/05 14:57:49
// Design Name: 
// Module Name: Digit_Tube
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


module Digit_Tube(
        input rst,
        input clk_100MHz,
        input [31:0]SW,
        input [1:0] Sel,
        output [7:0] AN,
        output [7:0] SEG
    );

    wire clk_fresh;
    wire [31:0] A;
    wire [31:0] B;
    wire [31:0] C;
    wire [31:0] Data;

    wire [7:0] AN_tube, SEG_tube; 
    wire [7:0] AN_hdu, SEG_hdu;  

    assign A = 32'h12345678;
    assign B = 32'h87654321;
    assign C = 32'hABCDEF;

    Fdiv div(
        .clk(clk_100MHz),
        .rst(rst),
        .clk_fresh(clk_fresh)
    );

    MUX mux(
        .Sel(Sel),
        .A(SW),
        .B(),
        .C(B),
        .D(C),
        .Y(Data)
    );

    Tube tube(
        .rst(rst),
        .clk_fresh(clk_fresh),
        .Data(Data),
        .AN(AN_tube),
        .SEG(SEG_tube)
    );

    FlowHDU hdu(
        .rst(rst),
        .clk_100MHz(clk_100MHz),
        .AN(AN_hdu),
        .SEG(SEG_hdu)
    );

    assign AN  = (Sel == 2'b01) ? AN_hdu : AN_tube;
    assign SEG = (Sel == 2'b01) ? SEG_hdu : SEG_tube;


endmodule
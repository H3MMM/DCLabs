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
        input [15:0] Data,
        output [7:0] AN,
        output [7:0] SEG
    );

    wire clk_fresh;
    wire [31:0] Data_BCD;
    assign Data_BCD = {16'b0, Data};

    Fdiv div(
        .clk(clk_100MHz),
        .rst(rst),
        .clk_fresh(clk_fresh)
    );
  

    Tube tube(
        .rst(rst),
        .clk_fresh(clk_fresh),
        .Data(Data_BCD),
        .AN(AN),
        .SEG(SEG)
    );



endmodule
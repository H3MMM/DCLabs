`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/12 15:31:46
// Design Name: 
// Module Name: VendingMachine
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


module VendingMachine(
        input clk,
        input CLR,
        input [7:0] k,
        input seortb,
        input get,
        input sel,
        input finish,
        output [7:0] AN,
        output [7:0] SEG
    );
    
    wire [15:0] tubeOutput;

    Vending vending(
        .CLK(clk),
        .CLR(CLR),
        .k(k),
        .seortb(seortb),
        .get(get),
        .sel(sel),
        .finish(finish),
        .outputData(tubeOutput)
    );

    Digit_Tube digit_tube(
        .rst(CLR),
        .clk_100MHz(clk),
        .Data(tubeOutput),
        .AN(AN),
        .SEG(SEG)
    );


endmodule

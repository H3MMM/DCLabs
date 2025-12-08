`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/30 09:58:19
// Design Name: 
// Module Name: buttonDebouncing
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


module buttonDebouncing(
        input rst,
        input clk,
        input key_in,
        output [7:0] led_out
    );
    wire clk_10ms;
    wire key_out;

    Fdiv div(
        .rst(rst),
        .clk_100MHz(clk),
        .clk_10ms(clk_10ms)
    );

    debouncing debouncing(
        .clk(clk_10ms),
        .rst(rst),
        .key_in(key_in),
        .key_out(key_out)
    );

    shifter shifter(
        .rst(rst),
        .clk(key_out),
        .led_out(led_out)
    );

endmodule

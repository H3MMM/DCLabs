`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/05 14:36:01
// Design Name: 
// Module Name: Fdiv
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


module Fdiv(
        input clk,
        input rst,
        output clk_fresh
    );
    //分频2ms
    reg[16:0] count;
    always @(posedge rst or posedge clk) begin
        if(rst) count <= 0;
        else count <= count + 1'b1;
    end
    assign clk_fresh = count[16];
endmodule

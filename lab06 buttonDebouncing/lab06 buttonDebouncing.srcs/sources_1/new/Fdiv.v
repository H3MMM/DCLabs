`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/30 09:31:10
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
        input rst,
        input clk_100MHz,
        output reg clk_10ms
    );
    reg[19:0] counter;
    always @(posedge clk_100MHz or posedge rst) begin
        if (rst) begin
            counter <= 20'd0;
            clk_10ms <= 1'b0;
        end else if (counter == 20'd500_000)  begin
                clk_10ms <= ~clk_10ms;
                counter <= 20'd0;
            end else begin
                counter <= counter + 1'b1;
            end
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/30 10:04:24
// Design Name: 
// Module Name: shifter
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


module shifter(
        input rst,
        input clk,
        output reg [7:0] led_out
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            led_out <= 8'b0000_0001;
        end else begin
            led_out <= {led_out[6:0], led_out[7]};
        end
    end

endmodule

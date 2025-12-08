`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/14 14:40:05
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [2:0]code,
    input G1,G2A,G2B,
    output reg [7:0] Y
);
    always @(*) begin
        Y = 8'b11111111;
        if(G1 && !G2A && !G2B) begin
            Y[code] = 1'b0;
        end
    end
endmodule

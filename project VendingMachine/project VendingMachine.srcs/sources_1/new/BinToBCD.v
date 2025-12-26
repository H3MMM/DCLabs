`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/26 14:28:54
// Design Name: 
// Module Name: BinToBCD
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


module BinToBCD(
    input [7:0] bin_in,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones
    );
    integer i;
    reg [11:0] bcd;
    always @(*) begin
        bcd = 12'd0;
        for (i = 7; i >= 0; i = i - 1) begin
            if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;
            if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
            if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
            bcd = bcd << 1;
            bcd[0] = bin_in[i];
        end
        hundreds = bcd[11:8];
        tens = bcd[7:4];
        ones = bcd[3:0];
    end
endmodule

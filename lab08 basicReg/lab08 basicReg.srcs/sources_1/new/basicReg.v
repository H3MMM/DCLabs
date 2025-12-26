`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/24 20:23:47
// Design Name: 
// Module Name: basicReg
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


module basicReg(
        input clk,
        input CLR,
        input OE_,
        input [7:0] D,
        output [7:0] Q 
    );

    reg [7:0] F;

    always @(posedge clk or posedge CLR) begin
        if (CLR) begin
            F <= 8'b0;
        end else begin
            F <= D;
        end
    end

    assign Q = !OE_ ? F : 8'bz;

    
endmodule

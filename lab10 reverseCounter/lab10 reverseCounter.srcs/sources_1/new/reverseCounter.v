`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/25 15:55:16
// Design Name: 
// Module Name: reverseCounter
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


module reverseCounter(
        input CP,
        input LD_,
        input CT_,
        input U_D,
        input [3:0] D,
        output MAX_MIN,
        output RCO_,
        output reg [3:0] Q
    );

    always@(posedge CP or negedge LD_) begin
        if (!LD_) begin
            Q <= D;
        end else begin
            if (CT_) begin
                Q <= Q;
            end else if(!U_D) begin
                Q <= Q + 1;
            end else begin
                Q <= Q - 1;
            end
        end
    end


    assign MAX_MIN = (Q == 4'b0000 && U_D) || (Q == 4'b1111 && !U_D) ? 1'b1 : 1'b0;
    assign RCO_ = CP || CT_ || !MAX_MIN ? 1'b1 : 1'b0;
    
endmodule

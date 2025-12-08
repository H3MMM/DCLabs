`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/14 20:17:55
// Design Name: 
// Module Name: MUX4_1
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


module MUX4_1(
        input EN,
        input [1:0] S,
        input [3:0] A,
        input [3:0] B,
        input [3:0] C,
        input [3:0] D,

        output reg [3:0] Y
    );

    always @(*) begin
        if(EN) begin
            Y = 4'b0000;
        end
        else begin
            case(S)
                2'b00: Y = A;
                2'b01: Y = B;
                2'b10: Y = C;
                2'b11: Y = D;
            endcase
        end
    end
    
endmodule

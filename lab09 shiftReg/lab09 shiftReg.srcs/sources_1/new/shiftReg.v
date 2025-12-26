`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/25 15:00:57
// Design Name: 
// Module Name: shiftReg
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


module shiftReg(
        input cp,
        input CR_,
        input S1,S0,
        input [7:0] D,
        input SL,SR,
        output reg [7:0] Q
    );

    always@(posedge cp or negedge CR_) begin
        if(!CR_)
            Q <= 8'b0;
        else begin
            case({S1,S0})
                2'b00: Q <= Q; 
                2'b01: Q <= {SR, Q[7:1]};
                2'b10: Q <= {Q[6:0], SL};
                2'b11: Q <= D;
                default: Q <= Q;
            endcase
        end
    end

endmodule

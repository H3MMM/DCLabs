`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/15 19:46:09
// Design Name: 
// Module Name: MUX8_1
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


module MUX8_1(
        input [2:0] S,
        input [3:0] A, 
        input [3:0] B, 
        input [3:0] C, 
        input [3:0] D, 
        input [3:0] E, 
        input [3:0] F, 
        input [3:0] G, 
        input [3:0] H,

        output [3:0] Y 
    );

    wire [3:0] FHigh;
    wire [3:0] FLow;

    wire ENHigh = ~S[2];
    wire ENLow = S[2];

    MUX4_1 Low (
        .EN(ENLow),
        .S(S[1:0]),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Y(FLow)
    );

    MUX4_1 High (
        .EN(ENHigh),
        .S(S[1:0]),
        .A(E),
        .B(F),
        .C(G),
        .D(H),
        .Y(FHigh)
    );

    assign Y= FLow | FHigh;


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/13 18:40:41
// Design Name: 
// Module Name: AddSub
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


module AddSub(
    input  [3:0] A,
    input  [3:0] B,
    input  ADD_SUB, 
    output [3:0] F,
    output       Cout
    );

    wire [3:0] B_com;
    assign B_com = B ^ {4{ADD_SUB}}; //全1按位取反，全零不变

    FA_SC Bit4FA(
        .A(A),
        .B(B_com),
        .Cin(ADD_SUB),
        .F(F),
        .Cout(Cout)
    );
   
endmodule

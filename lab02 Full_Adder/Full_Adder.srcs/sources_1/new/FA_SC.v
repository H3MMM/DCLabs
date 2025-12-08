`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/26 11:01:20
// Design Name: 
// Module Name: FA_SC
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


module FA_SC(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] F,
    output Cout
);

    wire [3:0] C;
    
    CLA cla(
        .A(A),
        .B(B),
        .Cin(Cin),
        .C(C),
        .Cout(Cout)
    );

    Full_Adder FA0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .F(F[0]),
        .Cout()
    );
    
    Full_Adder FA1 (
        .A(A[1]),
        .B(B[1]),
        .Cin(C[0]),
        .F(F[1]),
        .Cout()
    );
    
    Full_Adder FA2 (
        .A(A[2]),
        .B(B[2]),
        .Cin(C[1]),
        .F(F[2]),
        .Cout()
    );
    
    Full_Adder FA3 (
        .A(A[3]),
        .B(B[3]),
        .Cin(C[2]),
        .F(F[3]),
        .Cout()
    );

endmodule

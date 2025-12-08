`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/24 15:08:11
// Design Name: 
// Module Name: Full_Adder
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



module Full_Adder(
    input A,
    input B,
    input Cin,
    output F,
    output Cout
);
    wire xor_ab; 
    wire and_ab;   
    wire and_xc;   

    xor u1 (xor_ab, A, B);
   
    xor u2 (F, xor_ab, Cin);
   
    and u3 (and_ab, A, B);
    and u4 (and_xc, xor_ab, Cin);
    or  u5 (Cout, and_ab, and_xc);

endmodule


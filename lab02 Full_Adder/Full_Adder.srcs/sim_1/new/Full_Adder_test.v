`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/24 15:40:29
// Design Name: 
// Module Name: Full_Adder_test
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


module Full_Adder_test();
    reg A, B, Cin;
    wire F, Cout;

    Full_Adder test (
        .A(A),
        .B(B),
        .Cin(Cin),
        .F(F),
        .Cout(Cout)
    );

    initial begin
        A = 0; B = 0; Cin = 0; #50;
        A = 0; B = 1; Cin = 0; #50;
        A = 0; B = 1; Cin = 1; #50;
        A = 0; B = 0; Cin = 1; #50;
        A = 1; B = 0; Cin = 0; #50;
        A = 1; B = 0; Cin = 1; #50;
        A = 1; B = 1; Cin = 0; #50;
        A = 1; B = 1; Cin = 1; #50;

        $finish;
    end
endmodule

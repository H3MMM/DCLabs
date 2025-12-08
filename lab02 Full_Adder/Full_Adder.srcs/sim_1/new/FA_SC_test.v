`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/27 13:25:46
// Design Name: 
// Module Name: FA_SC_test
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


module FA_SC_test();
    reg [3:0]A;
    reg [3:0]B;
    reg Cin;
    wire [3:0]F;
    wire Cout;

    FA_SC uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .F(F),
        .Cout(Cout)
    );
    
    initial begin
        // 0 + 0
        A = 4'b0000;
        B = 4'b0000;
        Cin = 1'b0;
        #50;
        // 1 + 2
        A = 4'b0001;
        B = 4'b0010;
        Cin = 1'b0;
        #50;
        // 6 + 5
        A = 4'b0110;
        B = 4'b0101;
        Cin = 1'b0;
        #50; 
        // 15 + 1
        A = 4'b1111;
        B = 4'b0001;
        Cin = 1'b0;
        #50;
        // 15 + 15 + 进位1
        A = 4'b1111;
        B = 4'b1111;
        Cin = 1'b1;
        #50;

        $finish;
    end
        
endmodule

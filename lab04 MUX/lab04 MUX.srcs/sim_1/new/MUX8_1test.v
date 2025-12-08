`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/21 14:33:03
// Design Name: 
// Module Name: MUX8_1test
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


module MUX8_1test ();
    reg [2:0] S;
    reg [3:0] A,B,C,D,E,F,G,H;
    wire [3:0] Y;

    MUX8_1 mux8_1(
        .S(S),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .G(G),
        .H(H),
        .Y(Y)
    );

    initial begin
        S = 3'b000;
        A=4'b1101;
        B=4'b0000;
        C=4'b0000;
        D=4'b0000;
        E=4'b0000;
        F=4'b0000;
        G=4'b0000;
        H=4'b0000;
        

        #50
        S = 3'b001;
        A=4'b0000;
        B=4'b1010;
        C=4'b0000;
        D=4'b0000;
        E=4'b0000;
        F=4'b0000;
        G=4'b0000;
        H=4'b0000;

        #50
        S = 3'b011;
        A=4'b0000;
        B=4'b0000;
        C=4'b0000;
        D=4'b0010;
        E=4'b0000;
        F=4'b0000;
        G=4'b0000;
        H=4'b0000;

        #50
        S = 3'b111;
        A=4'b0000;
        B=4'b0000;
        C=4'b0000;
        D=4'b0000;
        E=4'b0000;
        F=4'b0000;
        G=4'b0000;
        H=4'b1111;
        $finish;

    end
endmodule

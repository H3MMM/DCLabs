`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/14 15:52:59
// Design Name: 
// Module Name: MUXtest
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


module MUXtest();
    reg EN;
    reg [1:0] S;
    reg [3:0] A,B,C,D;
    wire [3:0] Y;

    MUX4_1 mux(
        .EN(EN),
        .S(S),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Y(Y)
    );

    initial begin
        EN = 1;
        S = 2'b01;
        A = 0;
        B = 1;
        C = 1;
        D = 1;
        #50

        EN = 0;
        S = 2'b00;
        repeat(4) begin
            #50
            S = S + 1;
        end

        #50
        EN = 1;

        #50
        EN = 0;
        A = 1;
        B = 0;
        C = 0;
        D = 0;
        S = 2'b00;
        $finish;

    end
endmodule

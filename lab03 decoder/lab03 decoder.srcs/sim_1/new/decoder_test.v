`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/14 14:41:14
// Design Name: 
// Module Name: decoder_test
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


module decoder_test();
    reg [2:0] code;
    reg G1,G2A,G2B;
    wire [7:0] Y;

    decoder test(
        .code(code),
        .G1(G1),
        .G2A(G2A),
        .G2B(G2B),
        .Y(Y)
    );

    initial begin
        code = 3'b111;
        G1 = 0;
        G2A = 0;
        G2B = 0;
        #50
        
        code = 3'b000;
        G1 = 1;
        G2A = 0;
        G2B = 0;

        repeat(8) begin
            #50
            code = code + 1;
        end

        $finish;

    end
endmodule

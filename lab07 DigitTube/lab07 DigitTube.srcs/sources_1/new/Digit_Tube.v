`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/05 14:57:49
// Design Name: 
// Module Name: Digit_Tube
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


module Digit_Tube(
        input rst,
        input clk_100MHz,
        input [31:0]SW,
        input [1:0] Sel,
        output reg [7:0] AN,
        output reg [7:0] SEG
    );

    wire clk_fresh;
    wire [31:0] A;
    wire [31:0] B;
    wire [31:0] C;
    wire [31:0] Data;

    wire [7:0] AN_tube, SEG_tude; 
    wire [7:0] AN_HelloHdU, SEG_HelloHdU;  
    wire [7:0] AN_ILovEHdU, SEG_ILovEHdU;  

    assign A = 32'h12345678;
    assign B = 32'h87654321;
    assign C = 32'hABCDEF;

    Fdiv div(
        .clk(clk_100MHz),
        .rst(rst),
        .clk_fresh(clk_fresh)
    );

    MUX mux(
        .Sel(Sel),
        .A(SW),
        .B(),
        .C(),
        .D(C),
        .Y(Data)
    );

    Tube tube(
        .rst(rst),
        .clk_fresh(clk_fresh),
        .Data(Data),
        .AN(AN_tube),
        .SEG(SEG_tude)
    );

    HelloHdU HelloHdU(
        .rst(rst),
        .clk_100MHz(clk_100MHz),
        .AN(AN_HelloHdU),
        .SEG(SEG_HelloHdU)
    );

    ILoveHdU ILoveHdU(
        .rst(rst),
        .clk_100MHz(clk_100MHz),
        .AN(AN_ILovEHdU),
        .SEG(SEG_ILovEHdU)
    );

    always @(*) begin
    case (Sel)
        2'b01: begin
            AN  = AN_HelloHdU;
            SEG = SEG_HelloHdU;
        end
        
        2'b10: begin
            AN = AN_ILovEHdU;
            SEG = SEG_ILovEHdU;
        end
        
        default: begin
            AN  = AN_tube;
            SEG = SEG_tude;
        end
    endcase
end

    


endmodule
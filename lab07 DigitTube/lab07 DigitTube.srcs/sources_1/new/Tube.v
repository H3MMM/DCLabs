`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/05 14:41:23
// Design Name: 
// Module Name: Tube
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


module Tube(
        input rst,
        input clk_fresh,
        input [31:0] Data,
        output reg [7:0] AN,
        output reg [7:0] SEG
    );

    reg [2:0] bit_select;
    reg [3:0] data_x;

    always @(posedge rst or posedge clk_fresh) begin
        if (rst) begin
            bit_select <= 0;
        end else begin
            bit_select <= bit_select + 1'b1;
        end
    end

    always @(*) begin
        case (bit_select)
            0:AN = 8'b1111_1110;
            1:AN = 8'b1111_1101;
            2:AN = 8'b1111_1011;
            3:AN = 8'b1111_0111;
            4:AN = 8'b1110_1111;
            5:AN = 8'b1101_1111;
            6:AN = 8'b1011_1111;
            7:AN = 8'b0111_1111;
        endcase
    end
    
    always @(*) begin
        case (bit_select)
            0:data_x = Data[3:0];
            1:data_x = Data[7:4];
            2:data_x = Data[11:8];
            3:data_x = Data[15:12];
            4:data_x = Data[19:16];
            5:data_x = Data[23:20];
            6:data_x = Data[27:24];
            7:data_x = Data[31:28];
        endcase
    end

    always @(*) begin
        case (data_x)
            4'h0:SEG = 8'b0000_0011;
            4'h1:SEG = 8'b1001_1111;
            4'h2:SEG = 8'b0010_0101;
            4'h3:SEG = 8'b0000_1101;
            4'h4:SEG = 8'b1001_1001;
            4'h5:SEG = 8'b0100_1001;
            4'h6:SEG = 8'b0100_0001;
            4'h7:SEG = 8'b0001_1111;
            4'h8:SEG = 8'b0000_0001;
            4'h9:SEG = 8'b0000_1001;
            4'hA:SEG = 8'b0001_0001;
            4'hB:SEG = 8'b1100_0001;
            4'hC:SEG = 8'b0110_0011;
            4'hD:SEG = 8'b1000_0101;
            4'hE:SEG = 8'b0110_0001;
            4'hF:SEG = 8'b0111_0001;
        endcase
    end
endmodule

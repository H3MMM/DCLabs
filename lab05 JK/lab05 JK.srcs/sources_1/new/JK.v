`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/21 15:27:38
// Design Name: 
// Module Name: JK
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


module JK(
    input SD_,
    input RD_,
    input CP,
    input J,
    input K,
    output reg Q,
    output Q_
    );

    always @(negedge CP or negedge SD_ or negedge RD_)
    begin
        if(!RD_) begin
            Q<=1'b0;
        end 
        else if(!SD_) begin
            Q<=1'b1;
        end
        else if(!RD_ && !SD_) begin
            Q<=1'b0;
        end
        else begin
            case({J,K})
                2'b00 : Q<=Q;
                2'b01 : Q<=1'b0;
                2'b10 : Q<=1'b1;
                2'b11 : Q<=~Q;
            endcase
        end
    end
    assign Q_ = ~Q;
    
endmodule

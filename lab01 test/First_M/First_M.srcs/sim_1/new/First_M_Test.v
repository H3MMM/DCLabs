`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 21:23:35
// Design Name: 
// Module Name: First_M_Test
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


module First_M_Test;
    reg      A,B,C,D,E;
    wire     F;
    First_M  The_UUT(A,B,C,D,E,F);
    
    initial {A,B,C,D,E} = 5'b0;  
    always 
    begin
        #100;
        {A,B,C,D,E} = {A,B,C,D,E} + 1'b1;
    end
endmodule


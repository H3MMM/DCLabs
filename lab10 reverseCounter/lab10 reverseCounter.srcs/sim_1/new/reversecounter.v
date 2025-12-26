`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/25 15:58:26
// Design Name: 
// Module Name: reversecounter
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


module reversecounter;
    reg CP, LD_, CT_, U_D;
    reg [3:0] D;
    wire MAX_MIN, RCO_;
    wire [3:0] Q;

    reverseCounter uut(
        .CP(CP), .LD_(LD_), .CT_(CT_), .U_D(U_D), .D(D), 
        .MAX_MIN(MAX_MIN), .RCO_(RCO_), .Q(Q)
    );

    initial CP = 1;
    always #50 CP = ~CP; 

    initial begin
        LD_ = 1; CT_ = 1; U_D = 0; D = 4'b0000;
        #50;
      
        LD_ = 0; D = 4'b1100;
        #50;
        LD_ = 1;
     
        CT_ = 0; U_D = 0;
        #400;
       
        U_D = 1; // 向下
        #300;
   
        CT_ = 1; 
        #300;

        $stop;
    end
endmodule
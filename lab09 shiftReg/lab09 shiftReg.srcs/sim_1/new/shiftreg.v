`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/25 15:26:21
// Design Name: 
// Module Name: shiftreg
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


module shiftreg;

    reg cp;
    reg CR_;
    reg S1, S0;
    reg [7:0] D;
    reg SL, SR;
    wire [7:0] Q;

    shiftReg uut (
        .cp(cp), 
        .CR_(CR_), 
        .S1(S1), 
        .S0(S0), 
        .D(D), 
        .SL(SL), 
        .SR(SR), 
        .Q(Q)
    );
 

    initial begin
        cp = 0;
        forever #50 cp = ~cp;
    end


    initial begin
       
        CR_ = 1; S1 = 0; S0 = 0; D = 0; SL = 0; SR = 0;
        #50;
       
        D = 8'b10101010;
        {S1, S0} = 2'b11; 
        #50;
        
        CR_ = 0;
        #50;
        
        CR_ = 1;
        {S1, S0} = 2'b01; 
        SR = 1;    
        #50;
     
        SR = 0;  
        #50;
        
        
        {S1, S0} = 2'b00;
        #50;
      
      
        {S1, S0} = 2'b10;
        SL = 1;   
        #50;
       
       
        #50;
        $stop;
    end

endmodule
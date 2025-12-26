`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/25 14:31:08
// Design Name: 
// Module Name: basicReg
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


module basicreg();
    reg clk;
    reg CLR;
    reg OE_;
    reg [7:0] D;
    wire [7:0] Q;

    basicReg uut (
        .clk(clk),
        .CLR(CLR),
        .OE_(OE_),
        .D(D),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #50 clk = ~clk;
    end

    initial begin
        CLR = 0;
        OE_ = 1; //高阻态，不给输出
        D = 8'h00;
        #50;
        
        //异步清零
        OE_ = 0;     
        D = 8'hFF; 
        #50;
        CLR = 1;    
        #50;  
        CLR = 0;    
       
        D = 8'h56;      
        
        //高阻态
        OE_ = 1;       
        #50;
        
        OE_ = 0;        
        #50;
       
        #50;
        $stop;
    end

endmodule
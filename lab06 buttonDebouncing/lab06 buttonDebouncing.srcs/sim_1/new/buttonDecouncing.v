`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/30 10:32:51
// Design Name: 
// Module Name: buttonDecouncing
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


module buttonDecouncing();

    reg rst;
    reg clk;
    reg key_in;

    wire [7:0] led_out;

    buttonDebouncing uut (
        .rst(rst),
        .clk(clk),
        .key_in(key_in),
        .led_out(led_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        key_in = 0;

        #100;
        rst = 0;

        #1000000;

        key_in = 1;
        #35000000;

        key_in = 0;
        #35000000;

        key_in = 1;
        #35000000;

        key_in = 0;
        #35000000;

        repeat(10) begin
            key_in = ~key_in;
            #20000; 
        end
        key_in = 0;

        #20000000;
        
        $stop;
    end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/12 15:31:12
// Design Name: 
// Module Name: Vending
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


module Vending(
        input CLK,
        input CLR,
        input [7:0] k,
        input seortb,
        input get,
        input sel,
        input finish,
        output reg [15:0] outputData
    );

    reg [2:0]price[3:0];
    reg [3:0]nums[3:0];
    reg [1:0]count;
    reg [6:0]money;
    reg [3:0]haveBuy;

    // --- 【新增】边沿检测信号定义 ---
    reg seortb_prev, get_prev, sel_prev, finish_prev;
    wire seortb_pulse = seortb & ~seortb_prev;
    wire get_pulse    = get & ~get_prev;
    wire sel_pulse    = sel & ~sel_prev;
    wire finish_pulse = finish & ~finish_prev;
   
    always@(posedge CLK or posedge CLR) begin
        if(CLR) begin
            price[0] <= 0;
            price[1] <= 0;
            price[2] <= 0;
            price[3] <= 0;
            nums[0] <= 0;
            nums[1] <= 0;
            nums[2] <= 0;
            nums[3] <= 0;
            count <= 0;
            money <= 0;
            haveBuy <= 0;
            seortb_prev <= 0; get_prev <= 0; sel_prev <= 0; finish_prev <= 0;
        end
        else begin
            seortb_prev <= seortb;
            get_prev    <= get;
            sel_prev    <= sel;
            finish_prev <= finish;

            if(sel_pulse) begin
                count <= (count + 1) % 4;
            end
            //补货功能
            if(k[7]) begin
               if(seortb_pulse) begin
                    nums[count] <= nums[count] + k[3:0];
                    price[count] <= k[6:4];
               end
            end
            //售卖功能
            else begin
                if(seortb_pulse) begin
                    if (money == 0) begin
                        money <= k[6:0];
                    end
                end
                if(get_pulse) begin
                    if(nums[count] > 0 && money >= price[count]) begin
                        nums[count] <= nums[count] - 1;
                        money <= money - price[count];
                        haveBuy <= haveBuy + 1;
                    end
                end
                if(finish_pulse) begin
                    haveBuy <= 0;
                end
            end
        end
    end

    always @(*) begin
    outputData = {2'b0, count,1'b0, price[count], nums[count], haveBuy}; 

    if (k[7] == 1'b1) begin
        outputData = {2'b0, count,1'b0, price[count], nums[count], haveBuy};
    end
    else begin
        if (finish) begin
            outputData = {9'b0, money};
        end
        else if (seortb) begin
            outputData = {9'b0, money};
        end
        else begin
            outputData = {2'b0, count,1'b0, price[count], nums[count], haveBuy};
        end
    end
end


endmodule

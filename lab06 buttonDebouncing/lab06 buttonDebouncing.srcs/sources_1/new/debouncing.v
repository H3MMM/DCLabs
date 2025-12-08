`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/30 09:42:36
// Design Name: 
// Module Name: debouncing
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


module debouncing(
        input clk,
        input rst,
        input key_in,
        output reg key_out
    );
        parameter S0 =3'd0,S1 =3'd1,S2 =3'd2,S3 =3'd3,S4 =3'd4,S5 =3'd5;
        reg[2:0] ST, Next_ST;
        //时序逻辑电路，在时钟正边沿转移状态
        always @(posedge clk or posedge rst) begin
            if(rst)
                ST <= key_in ? S3 : S0;
            else
                ST <= Next_ST;
        end
        //次态函数，产生下一个状态
        always @(*) begin
            case(ST)
                S0: Next_ST = key_in ? S1 : S0;
                S1: Next_ST = key_in ? S3 : S2;
                S2: Next_ST = key_in ? S1 : S0;
                S3: Next_ST = key_in ? S3 : S4;
                S4: Next_ST = key_in ? S5 : S0;
                S5: Next_ST = key_in ? S3 : S4;
                default: Next_ST = S0;
            endcase
        end
        //输出函数，对输出赋值
        always @(posedge rst or posedge clk) begin
            if(rst) key_out<=key_in;
            else begin
                case(Next_ST)
                    S0:key_out<=1'b0;
                    S1:key_out<=1'b0;
                    S2:key_out<=1'b0;
                    S3:key_out<=1'b1;
                    S4:key_out<=1'b1;
                    S5:key_out<=1'b1;
                    default:key_out<=1'b0;
                endcase
            end
        end


endmodule

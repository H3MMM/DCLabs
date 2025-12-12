`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/05 20:13:30
// Design Name: 
// Module Name: FlowHDU
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


`timescale 1ns / 1ps

module HelloHdU(
    input rst,
    input clk_100MHz,
    output reg [7:0] AN,
    output reg [7:0] SEG
    );

  
    parameter H = 8'b1001_0001; 
    parameter E = 8'b0110_0001; 
    parameter L = 8'b1110_0011; 
    parameter o = 8'b1100_0101; 
    parameter d = 8'b1000_0101; 
    parameter U = 8'b1000_0011; 
    parameter BLANK  = 8'b1111_1111; 

    wire clk_fresh;
    reg [2:0] bit_select;
    
    Fdiv div(
        .clk(clk_100MHz),
        .rst(rst),
        .clk_fresh(clk_fresh)
    );

    always @(posedge rst or posedge clk_fresh) begin
        if (rst) bit_select <= 0;
        else bit_select <= bit_select + 1'b1;
    end


    always @(*) begin
        case (bit_select)
            3'd0: AN = 8'b1111_1110; 
            3'd1: AN = 8'b1111_1101;
            3'd2: AN = 8'b1111_1011;
            3'd3: AN = 8'b1111_0111;
            3'd4: AN = 8'b1110_1111;
            3'd5: AN = 8'b1101_1111;
            3'd6: AN = 8'b1011_1111;
            3'd7: AN = 8'b0111_1111; 
        endcase
    end

    
    wire clk_200ms;
    reg [25:0] count;
    
    always @(posedge rst or posedge clk_100MHz) begin
        if(rst) count <= 0;
        else begin
            if (count >= 20000000) count <= 0;
            else count <= count + 1'b1;
        end
    end
    assign clk_200ms = (count == 20000000);
  
    reg [63:0] shift_reg; 
    reg [4:0]  wait_timer; // 3秒计数器
    
  
    localparam [31:0] hdu = 32'h01223045; 

    always @(posedge rst or posedge clk_100MHz) begin
        if (rst) begin
            shift_reg <= {32'h01223045, 32'hFFFFFFFF};
            wait_timer <= 0;
        end 
        else if (clk_200ms) begin
            if (shift_reg[31:0] == hdu) begin
                if (wait_timer < 15) begin //0.2*15=3s
                    wait_timer <= wait_timer + 1'b1;
                end else begin
                    wait_timer <= 0; 
                    shift_reg <= {shift_reg[59:0], shift_reg[63:60]};
                end
            end 
            else begin
                shift_reg <= {shift_reg[59:0], shift_reg[63:60]};
                wait_timer <= 0;
            end
        end
    end


    reg [3:0] current_index;
   
    always @(*) begin
        case (bit_select)
            3'd0: current_index = shift_reg[3:0];   
            3'd1: current_index = shift_reg[7:4];
            3'd2: current_index = shift_reg[11:8];
            3'd3: current_index = shift_reg[15:12];
            3'd4: current_index = shift_reg[19:16];
            3'd5: current_index = shift_reg[23:20];
            3'd6: current_index = shift_reg[27:24];
            3'd7: current_index = shift_reg[31:28]; 
            default: current_index = 4'hF;
        endcase
    end


    always @(*) begin
        case (current_index)
            4'h0: SEG = H;
            4'h1: SEG = E;
            4'h2: SEG = L;
            4'h3: SEG = o;
            4'h4: SEG = d;
            4'h5: SEG = U;
            4'hF: SEG = BLANK;
            default: SEG = BLANK;
        endcase
    end

endmodule

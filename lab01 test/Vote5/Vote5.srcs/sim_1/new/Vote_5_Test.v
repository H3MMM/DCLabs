`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/22 11:32:15
// Design Name: 
// Module Name: Vote_5_Test
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


module Vote_5_Test;
	reg A,B,C,D,E;
	wire F;

	//引用要测试的Vote_5模块，产生一个实例uut
	Vote_5 uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.E(E), 
		.F(F)
	);
/*下面是枚举，比较繁琐
	initial begin
		// Initialize Inputs
		A = 0;B = 0;C = 0;D = 0;E = 0;
		#100;
      {A,B,C,D,E}=5'd1;  
		#100;
      {A,B,C,D,E}=5'd2;  
		#100;
      {A,B,C,D,E}=5'd3;  
		#100;
      {A,B,C,D,E}=5'd4;  
		#100;
      {A,B,C,D,E}=5'd5;  
		#100;
      {A,B,C,D,E}=5'd6;  
		#100;
      {A,B,C,D,E}=5'd7;  
		#100;
      {A,B,C,D,E}=5'd8;  
		#100;
      {A,B,C,D,E}=5'd9;  
		#100;
      {A,B,C,D,E}=5'd10;  
		#100;
      {A,B,C,D,E}=5'd11;  
		#100;
      {A,B,C,D,E}=5'd12;  
		#100;
      {A,B,C,D,E}=5'd13;  
		#100;
      {A,B,C,D,E}=5'd14;  
		#100;
      {A,B,C,D,E}=5'd15;  
		#100;
      {A,B,C,D,E}=5'd16;  
		#100;
      {A,B,C,D,E}=5'd17;  
		#100;
      {A,B,C,D,E}=5'd18;  
		#100;
      {A,B,C,D,E}=5'd19;  
		#100;
      {A,B,C,D,E}=5'd20;  
		#100;
      {A,B,C,D,E}=5'd21;  
		#100;
      {A,B,C,D,E}=5'd22;  
		#100;
      {A,B,C,D,E}=5'd23;  
		#100;
      {A,B,C,D,E}=5'd24;  
		#100;
      {A,B,C,D,E}=5'd25;  
		#100;
      {A,B,C,D,E}=5'd26;  
		#100;
      {A,B,C,D,E}=5'd27;  
		#100;
      {A,B,C,D,E}=5'd28;  
		#100;
      {A,B,C,D,E}=5'd29;  
		#100;
      {A,B,C,D,E}=5'd30;  
		#100;
      {A,B,C,D,E}=5'd31;  
	end
 */

//======也可以通过always语句枚举，相对简洁================
    initial
        {A,B,C,D,E}=5'b0;
        
	always
	begin
		#100;
		{A,B,C,D,E}={A,B,C,D,E} + 1'b1;
	end
endmodule

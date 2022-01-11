`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:34:58 10/24/2015
// Design Name:   FourDigitLEDdriver
// Module Name:   C:/Users/Stefanos/Desktop/lab1/lab1/tb.v
// Project Name:  lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FourDigitLEDdriver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg reset;
	reg clk;
	reg [3:0] hex3;
	reg [3:0] hex2;
	reg [3:0] hex1;
	reg [3:0] hex0;

	// Outputs
	wire an3;
	wire an2;
	wire an1;
	wire an0;
	wire [6:0] led_seg;
	wire dp;

	// Instantiate the Unit Under Test (UUT)
	FourDigitLEDdriver uut (
		.reset(reset), 
		.clk(clk), 
		.hex3(hex3), 
		.hex2(hex2), 
		.hex1(hex1), 
		.hex0(hex0), 
		.an3(an3), 
		.an2(an2), 
		.an1(an1), 
		.an0(an0), 
		.led_seg(led_seg), 
		.dp(dp)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		clk = 0;
		hex3 = 4;
		hex2 = 5;
		hex1 = 6;
		hex0 = 7;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset=0;
		#10000 $finish;
		
	end
	
always #10 clk = ~ clk;
      
endmodule


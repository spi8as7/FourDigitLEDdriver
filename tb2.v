`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:25:30 10/27/2015
// Design Name:   system
// Module Name:   C:/Users/Stefanos/Desktop/lab1/lab1/tb2.v
// Project Name:  lab1 
// Target Device:  dddfd
// Tool versions:  
// Description: d
//
// Verilog Test Fixture created by ISE for module: system
//
// Dependencies:
// gddghgh
// Revision:dfdkhk
// Revision 0.01 - File Created
// Additional Comments:// 
////////////////////////////////////////////////////////////////////////////////

module tb2;

	// Inputs
	reg clk;
	reg reset;
	reg button;
	reg [31:0] message1;
	reg [31:0] message2;
	
	wire [3:0]hex0;
	wire [3:0]hex1;
	wire [3:0]hex2;
	wire [3:0]hex3;
	// Instantiate the Unit Under Test (UUT)
	system uut (
		.clk(clk), 
		.reset(reset),
		.button(button),
		.message1(message1),
		.message2(message2),
		.hex0(hex0),
		.hex1(hex1),
		.hex2(hex2),
		.hex3(hex3)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		clk = 0;
		button=0;
		
		message1=32'b00000001001000110100010101100111;
		message2=32'b10001001101010111100110111101111;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset=0;
		button=1;
		

		#100000$finish;
		
	end
	
always #10 clk = ~ clk;
always #2500button = ~ button;      
endmodule


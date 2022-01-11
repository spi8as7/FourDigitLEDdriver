`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:45:41 10/28/2015
// Design Name:   Test
// Module Name:   C:/Users/Stefanos/Desktop/lab1/lab1/tb3.v
// Project Name:  lab1
// Target Device:  
// Tool versions:  kkssf
// Description: 
//
// Verilog Test Fixture created by ISE for module: Test
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb3;

	// Inputs
	reg clk;
	reg reset;
	reg button;
	reg [31:0] message1;
	reg [31:0] message2;

	// Outputs
	wire aek;

	// Instantiate the Unit Under Test (UUT)!
	Test uut (
		.clk(clk), 
		.reset(reset),
		.button(button),
		.message1(message1), 
		.message2(message2), 
		.m_tick(aek)
	);

	initial begin
		// Initialize Inputsss
		clk = 0;
		reset = 1;
		button=1;
		message1=32'b00000001001000110100010101100111;
		message2=32'b10001001101010111100110111101111;

		// Wait 100 ns for global reset to finishssss
		#100;
        
		// Add stimulus here
		reset=0;
		
		//#310 button = ~ button;
		//#610 button = ~ button;
		//#2000000000 $finish;ggg
	end
always #1 clk = ~ clk;
always #200 button = ~ button;   
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:04 10/27/2015 
// Design Name: 
// Module Name:    system 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Rotate(
	 input clk,
	 input reset,
	 input m_tick,
	 input button,
	 input wire [31:0]message1,
	 input wire [31:0]message2,
    output reg[3:0] hex3,
    output reg[3:0] hex2,
    output reg[3:0] hex1,
    output reg[3:0] hex0
    );

//constant declaration 	 
localparam N=4;

//signal declaration
reg[N-1:0] q;
reg[5:0] xronos;
wire [N-1:0] q_next;
wire[5:0] xronos_next;
wire [3:0]array1[7:0];
wire [3:0]array2[7:0];
assign {array1[0],array1[1],array1[2],array1[3],array1[4],array1[5],array1[6],array1[7]}=message1;
assign {array2[0],array2[1],array2[2],array2[3],array2[4],array2[5],array2[6],array2[7]}=message2;	

always@(m_tick || button)
		if(reset)
			q<=0;
		else if(m_tick || button)	
			case(q)
				4'b0000: // 0
					begin
						hex0 <= array1[0];
						hex1 <= array1[1];
						hex2 <= array1[2];
						hex3 <= array1[3];
						q <= q_next;
					end
				4'b0001: // 1
					begin
						hex0 <= array1[1];
						hex1 <= array1[2];
						hex2 <= array1[3];
						hex3 <= array1[4];
						q <= q_next;
					end
				4'b0010: //2
					begin
						hex0 <= array1[2];
						hex1 <= array1[3];
						hex2 <= array1[4];
						hex3 <= array1[5];
						q <= q_next;
					end
				4'b0011: //3
					begin
						hex0 <= array1[3];
						hex1 <= array1[4];
						hex2 <= array1[5];
						hex3 <= array1[6];
						q <= q_next;
					end
				4'b0100: //4
					begin
						hex0 <= array1[4];
						hex1 <= array1[5];
						hex2 <= array1[6];
						hex3 <= array1[7];
						q <= q_next;
					end
				4'b0101: //5
					begin
						hex0 <= array1[5];
						hex1 <= array1[6];
						hex2 <= array1[7];
						hex3 <= array2[0];
						q <= q_next;
					end
				4'b0110: //6
					begin
						hex0 <= array1[6];
						hex1 <= array1[7];
						hex2 <= array2[0];
						hex3 <= array2[1];
						q <= q_next;
					end
				4'b0111: //7
					begin
						hex0 <= array1[7];
						hex1 <= array2[0];
						hex2 <= array2[1];
						hex3 <= array2[2];
						q <= q_next;
					end
				4'b1000:  //8
					begin
						hex0 <= array2[0];
						hex1 <= array2[1];
						hex2 <= array2[2];
						hex3 <= array2[3];
						q <= q_next;
					end
				4'b1001:  //9
					begin
						hex0 <= array2[1];
						hex1 <= array2[2];
						hex2 <= array2[3];
						hex3 <= array2[4];
						q <= q_next;
					end
				4'b1010: //10
					begin
						hex0 <= array2[2];
						hex1 <= array2[3];
						hex2 <= array2[4];
						hex3 <= array2[5];
						q <= q_next;
					end
				4'b1011: //11
					begin
						hex0 <= array2[3];
						hex1 <= array2[4];
						hex2 <= array2[5];
						hex3 <= array2[6];
						q <= q_next;
					end
				4'b1100: //12
					begin
						hex0 <= array2[4];
						hex1 <= array2[5];
						hex2 <= array2[6];
						hex3 <= array2[7];
						q <= q_next;
					end
				4'b1101: //13
					begin
						hex0 <= array2[5];
						hex1 <= array2[6];
						hex2 <= array2[7];
						hex3 <= array1[0];
						q <= q_next;
					end
				4'b1110: //14
					begin
						hex0 <= array2[6];
						hex1 <= array2[7];
						hex2 <= array2[0];
						hex3 <= array1[1];
						q <= q_next;
					end
				4'b1111: //15
					begin
						hex0 <= array2[7];
						hex1 <= array1[0];
						hex2 <= array1[1];
						hex3 <= array1[2];
						q <= q_next;
					end			
		endcase
assign q_next=q+1;		
FourDigitLEDdriver FourDigitLEDdriverINSTANCE(reset, clk, hex3, hex2, hex1, hex0, an3, an2, an1, an0);
endmodule

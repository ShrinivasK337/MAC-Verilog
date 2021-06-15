`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2021 08:50:29
// Design Name: 
// Module Name: FA
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


module FA(input A, 
input B,
input Cin,
output Cout,
output S
);

assign S  = (A ^ B) ^ Cin;

assign Cout = (A & B) | (B & Cin) | (Cin & A);

endmodule

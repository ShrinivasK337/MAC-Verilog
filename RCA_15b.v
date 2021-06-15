`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2021 08:55:10
// Design Name: 
// Module Name: RCA_15b
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


module RCA_16b(
input [15:0] A,
input [15:0] B,
output [15:0] S
    );
wire [15:0] C;

FA F0(A[0], B[0],1'b0,C[0],S[0]);
FA F1(A[1], B[1],C[0],C[1],S[1]);
FA F2(A[2], B[2],C[1],C[2],S[2]);
FA F3(A[3], B[3],C[2],C[3],S[3]);
FA F4(A[4], B[4],C[3],C[4],S[4]);
FA F5(A[5], B[5],C[4],C[5],S[5]);
FA F6(A[6], B[6],C[5],C[6],S[6]);
FA F7(A[7], B[7],C[6],C[7],S[7]);
FA F8(A[8], B[8],C[7],C[8],S[8]);
FA F9(A[9], B[9],C[8],C[9],S[9]);
FA F10(A[10], B[10],C[9],C[10],S[10]);
FA F11(A[11], B[11],C[10],C[11],S[11]);
FA F12(A[12], B[12],C[11],C[12],S[12]);
FA F13(A[13], B[13],C[12],C[13],S[13]);
FA F14(A[14], B[14],C[13],C[14],S[14]);
FA F15(A[15], B[15],C[14],C[15],S[15]);




endmodule

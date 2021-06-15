`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2021 11:30:27
// Design Name: 
// Module Name: MUL_8b
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


module MUL_8b(
output [15:0] prod, 
output busy, 
input [7:0] m1, 
input [7:0] m2, 
input clk, 
input start);

reg [7:0] A, Q, M;
reg Q_1;
reg [3:0] count;
wire [7:0] sum, difference;
always @(posedge clk)
    begin
    if (start) 
        begin
        A <= 8'b0;
        M <= m1;   
        Q <= m2;
        Q_1 <= 1'b0;
        count <= 4'b0;
        end
    else 
        begin
        case ({Q[0], Q_1})
            2'b0_1 : {A, Q, Q_1} <= {sum[7], sum, Q};
            2'b1_0 : {A, Q, Q_1} <= {difference[7], difference, Q}; 
            default: {A, Q, Q_1} <= {A[7], A, Q};
        endcase
        count <= count + 1'b1;  
        end
    end
    
alu adder (sum, A, M, 1'b0);
alu subtracter (difference, A, ~M, 1'b1);
assign prod = {A, Q};
assign busy = (count < 8);  

endmodule


module alu(out, a, b, cin);
output [7:0] out;
input [7:0] a;
input [7:0] b;
input cin;
assign out = a + b + cin;
endmodule
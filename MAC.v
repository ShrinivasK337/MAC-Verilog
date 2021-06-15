`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2021 13:54:30
// Design Name: 
// Module Name: MAC
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


module MAC(
input [7:0]A,  //input 1
input [7:0]B,  //input 2
input clk,     //clock
input set_b,   //set signal has to be given during every input A,B for them to be loaded.
input reset,   //setting accumulated value to zero
output [15:0]O,  //output
output busy,    //1 if booth multiplier is busy
output overflow  //checks if overflow has occured
);

reg MSB1, MSB2, MSB_past;   // for overflow calculation
reg [15:0] Acc; //register for accumulation
wire [15:0] temp; //temporary RCA output
wire [15:0] tempprod; //for multiplication port in booth mult. only produces correct output when busy=0
reg tempov; //for calc of overflow

MUL_8b Multiplier(tempprod,busy,A,B,clk,set_b); //inputs are only loaded 
RCA_16b Adder(tempprod,Acc,temp);

//always @(*)
 //   begin
 //   if(reset==1)
 //       begin
 //       Acc=16'b0000000000000000;
 //       tempov=1'b0;
 //       end
 //   end
    
always @(posedge clk)
    begin
    if(set_b==1)             
        begin
        MSB1<=A[7];
        MSB2<=B[7];
        end
    if(reset==1)
        begin
        Acc=16'b0000000000000000;
        tempov=1'b0;
        end
    end
always @(negedge clk)
    begin
    if(busy==0)   //booth multiplier only produces correct product when busy=0
        begin
        MSB_past<=Acc[15];  //storing past sign for overflow calculation
        Acc<=temp;
        end
    if ((~MSB_past&&Acc[15]&&~MSB1&&~MSB2||~MSB_past&&Acc[15]&&MSB1&&MSB2) || (MSB_past&&~Acc[15]&&MSB1&&~MSB2||MSB_past&&~Acc[15]&&~MSB1&&MSB2) ) //condition for overflow. basically if register changes
        begin                                                                                                                                      //sign unexpectedly                 
        tempov<=1'b1;  //overflow occurs
        end
end

assign O=Acc;  //MAC output

assign overflow=tempov; //overflow output

endmodule

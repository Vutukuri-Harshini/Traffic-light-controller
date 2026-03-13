`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2026 12:08:36
// Design Name: 
// Module Name: tlc_tb
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


module tlc_tb();
reg clk,rst,x;
wire [1:0]hw,cr;
tlc uut(.clk(clk),.rst(rst),.x(x),.hw(hw),.cr(cr));
initial clk=1'b0;
always #50 clk=~clk;
initial
   $monitor("%time: x=%b, highway=%2b, cr=%2b",$time,x,hw,cr);
initial
  begin
    rst=1; #100;
    rst=0;
    x=0; #100;
    x=1; #100;
    x=1; #100;
    x=0; #100;
    x=0; #100;
    x=1; #100;
    x=0; #100;
    x=1; #100;
  end
endmodule

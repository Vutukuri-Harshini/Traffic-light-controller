`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2026 11:14:20
// Design Name: 
// Module Name: tlc
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


module tlc(clk,rst,x,hw,cr);
input clk,rst,x;
output reg[1:0]hw,cr;
reg[2:0]ps,ns;
parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011;    //state encoding
parameter green=2'b01, yellow=2'b10, red=2'b11;          //light colour encoding
always@(posedge clk)
   begin 
     if(rst)
      begin
      ps<=s0;
      hw<=green;
      cr<=red;
      end
     else
      ps<=ns;
   end
 always@(ps,x)
   begin
     case(ps)
      s0:
         begin
          hw=green;
          cr=red;
         if(x)
          ns=s1;
         else
          ns=s0;
         end
      s1:
         begin
          hw=yellow;
          cr=red;
          ns=s2;
         end
      s2:
         begin
          hw=red;
          cr=green;
         if(x)
          ns=s2;
         else
          ns=s3;
         end
      s3:
         begin
          hw=red;
          cr=yellow;
          ns=s0;
         end
      default:
         begin
          hw=green;
          cr=red;
          ns=s0;
         end
     endcase
    end  
 endmodule

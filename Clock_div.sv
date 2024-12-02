`timescale 1ns / 1ps



module Clock_div(
input logic clk,
input logic reset_n,
output logic new_clk
 );
 
 
 always_ff@(posedge clk, negedge reset_n)
 begin
 
 if (!reset_n)
      new_clk<=0;
      
  else
      new_clk<=~new_clk;  
  
 end 



endmodule

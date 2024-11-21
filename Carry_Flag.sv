`timescale 1ns / 1ps



module Carry_Flag #(parameter n=1) (
input logic clk,
input logic reset_n,
input logic en,
input logic in_carry,
output logic out_carry

    );
    
always_ff@(posedge clk,negedge reset_n)
begin 
if (!reset_n)
out_carry<=0;

else if (en==1)
out_carry<=in_carry;
end     
    
endmodule

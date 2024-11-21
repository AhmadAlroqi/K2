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
    logic w1,w1;
    
    assign w1=out_carry & c;
    assign  w2=w1^j;
    
endmodule

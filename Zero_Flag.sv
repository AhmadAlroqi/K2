
`timescale 1ns / 1ps



module Zero_Flag (
input logic clk,
input logic reset_n,
input logic en,
input logic [7:0]in_zero,
output logic out_zero

    );
    
always_ff@(posedge clk,negedge reset_n)
begin 

 if (en==1 & in_zero==00000000)

out_zero<=1;

else 
out_zero<=0;


if (!reset_n)
out_zero<=0;

end     
    
endmodule
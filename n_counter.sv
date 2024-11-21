`timescale 1ns / 1ps

module n_counter #(parameter n = 8)(
    input logic clk,
    input logic reset_n,
    output logic [n-1:0] count
);

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)       
            count <= 0;  
        else if (count == n-1) 
            count <= 0;  
        else
            count <= count + 1;  
    end

endmodule

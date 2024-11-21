`timescale 1ns / 1ps

module Register #(
    parameter N = 4         
)(
    input logic clk,             
    input logic reset_n,             
    input logic en,             
    input logic [N-1:0] d,   
    output logic [N-1:0] q   
);

    always @(posedge clk or negedge reset_n) begin
        if (! reset_n)
            q <= {N{1'b0}};  
        else if (en)
            q <= d;             
    end

endmodule

/*
Register #(.WIDTH(4)) my_register (
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(d[3:0]),
    .q(q[3:0])
);
*/
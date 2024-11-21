`timescale 1ns / 1ps


module ALU# (parameter N = 8)(
    input logic [N-1:0] a,          
    input logic [N-1:0] b,          
    input logic op,               
    output logic [N-1:0] result,    
    output logic carry          
);
    
    logic [N-1:0]bcomp;
    logic [N-1:0]b2sout;
    
    assign bcomp= ~b+1;
           
    MUX #(.N(N)) b2comp(
    .a(b),
    .b(bcomp),
    .s(op),
    .y(b2sout)
    );

    assign {carry,result} = a + b2sout;    
    
endmodule

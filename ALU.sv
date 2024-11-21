`timescale 1ns / 1ps


module ALU(
    input logic [7:0] a,          
    input logic [7:0] b,          
    input logic op,               
    output logic [7:0] result,    
    output logic carry          
);
    
    logic [7:0]bcomp;
    logic [7:0]b2sout;
    
    assign bcomp= ~b+1;
           
    MUX #(.N(8)) b2comp(
    .a(b),
    .b(bcomp),
    .s(op),
    .y(b2sout)
    );

    assign {carry,result} = a + b2sout;    
    
endmodule

`timescale 1ns / 1ps

 module MUX # (parameter N = 8)
 (
    input logic [N-1:0] a,   
    input logic [N-1:0] b,   
    input logic s,             
    output logic [N-1:0] y   
);

    always @(*) begin
        if (s)
            y = a;               
        else
            y = b;              
    end

endmodule

/*MUX #(.N(3)) my_mux (
    .a(a[3:0]),
    .b(b[3:0]),
    .s(s),
    .y(y[3:0])
);
*/
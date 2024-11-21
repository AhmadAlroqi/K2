`timescale 1ns / 1ps

 module MUX # (parameter N = 4)
 (
    input logic [N-1:0] a,   
    input logic [N-1:0] b,   
    input logic s,             
    output logic [N-1:0] y   
);

    always @(*) begin
        if (s)
            y = b;               
        else
            y = a;              
    end

endmodule

/*MUX #(.WIDTH(3)) my_mux (
    .a(a[3:0]),
    .b(b[3:0]),
    .sel(sel),
    .y(y[3:0])
);
*/
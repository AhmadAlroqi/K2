`timescale 1ns / 1ps

module decoder(
    input logic [1:0] in,   
    output logic [3:0] out   
);
    always @(*) begin
            case (in)
                2'b00: out = 1; //RA
                2'b01: out = 2; //RB
                2'b10: out = 4; //R0
                default: out = 4'b0000;
            endcase
        
     end
endmodule

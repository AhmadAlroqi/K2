`timescale 1ns / 1ps
//localparam n = 8 ;
module ROM(
    input logic [3:0] address,
    output logic [7:0] data  
    );
always @(*)
    begin
    case (address)
        0 : data = 8'b00001000; // ra = 0
        1 : data = 8'b00011001; // rb = 1
        2 : data = 8'b00100000;// ro = ra
        3 : data = 8'b00010000;// b = rb + ra
        4 : data = 8'b01110000;// jc = imm
        5 : data = 8'b00000000; // ra = ra + rb
        6 : data = 8'b00010100; // rb = ra - rb;
        7 : data = 8'b00000100; // ra = ra - rb
        8 : data = 8'b10110010; // j = 2
      
        default : data = 8'b00110000; // Default value for addresses outside 0
    endcase      
    end
endmodule


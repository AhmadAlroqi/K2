`timescale 1ns / 1ps
module ROM1(
    input logic [3:0] address,
    output logic [7:0] data  
    );
always @(*)
    begin
    case (address)
        0 : data = 8'b1100_1000; // 
        1 : data = 8'b1111_1010; // 
        2 : data = 8'b0010_0000;// RA=0
        3 : data = 8'b1100_1001;// [2]=RA
        4 : data = 8'b1101_1010;// RO = RA      
        5 : data = 8'b00100000; // RA = [1] 
        6 : data = 8'b1111_1010; // RB = [2]     
        7 : data = 8'b00000000; // RO = RA  
        8 : data = 8'b11110000; //RA = RA + RB 
        9 : data = 8'b10110110; //JC=0           
        default : data = 8'b00110000; // Default value for addresses outside 0
    endcase      
    end
endmodule
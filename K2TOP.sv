`timescale 1ns / 1ps

module K2TOP(
    input logic clk,
    input logic reset_n,
    output logic [7:0] R0          // Output register R0
);

    logic [7:0] RA, RB; // Registers A and B
    logic [7:0] alu_result; // Result of the ALU
    logic [7:0]instruction; 
    logic [7:0] pc; 
    logic J, C, D1, D0, Sreg, S;
    logic [2:0]data;//imm
    logic [7:0]outmux;
    logic [3:0]outDecoder;
    logic  RA_en ,RB_en ,RO_en;
    logic alu_carry;
    logic w1,w2;
    logic out_carry;

    
    n_counter #(.n(8)) pc_inst (
        .clk(clk),
        .reset_n(reset_n),
        .load(w2),              
        .en(1'b1),                 
        .load_data({5'b0,data}),          
        .count(pc)
    );
       
    ROM rom1(
    .address(pc),
    .data(instruction)
    );
    
    
    
    assign {J, C, D1, D0, Sreg,data}= instruction;
    assign S = instruction[2];
     MUX m2(.a({5'b0,data}),
     .b(alu_result),
     .s(Sreg),
     .y(outmux)
     );
     
    decoder decoder1(
    .in({D1,D0}),
    .out(outDecoder)
    );
    
    assign RA_en = outDecoder[0];    
    Register #(.N(8)) reg_A (
        .clk(clk),
        .reset_n(reset_n),
        .en(RA_en),                 
        .d(outmux),      
        .q(RA)
    );

    // Register B
    assign RB_en = outDecoder[1];    
    Register #(.N(8)) reg_B (
        .clk(clk),
        .reset_n(reset_n),
        .en(RB_en),
        .d(outmux),           
        .q(RB)
    );
    assign RO_en = outDecoder[2];  
     Register #(.N(8)) reg_O (
        .clk(clk),
        .reset_n(reset_n),
        .en(RO_en),
        .d(RA),           
        .q(R0)
    );  
    ALU  #(.N(8)) alu(
    .a(RA),
    .b(RB),
    .op(S),
    .result(alu_result),
    .carry(alu_carry)
    );
    
    Carry_Flag DFF(
         .clk(clk),
        .reset_n(reset_n),
        .en(1),
        .in_carry(alu_carry),
        .out_carry(out_carry)
    );
    
    assign w1= out_carry & C;
    assign  w2 = w1 | J ;
    
    

    
    
    
    
    

   

endmodule

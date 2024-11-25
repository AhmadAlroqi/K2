`timescale 1ns / 1ps

module K2TOP(
    input logic clk,
    input logic reset_n,
    output logic [7:0] R0 ,RA,RB
             // Output register R0\
    
);

       



   // logic [7:0] RA, RB; // Registers A and B
    logic [7:0] alu_result; // Result of the ALU
    logic [7:0]instruction; 
    logic [7:0] pc; 
    logic J, C, D1, D0, Sreg, S;
    logic [2:0]data;//imm
    logic [7:0]outmux;
    logic [7:0]outmux2;
    logic [3:0]outDecoder;
    logic  RA_en ,RB_en ,RO_en;
    logic alu_carry;
    logic jump,jump_normal,jc,jz;
    logic control_write;
    logic out_carry;
    logic zero_flag;
    logic [7:0] Ram_out;
    logic control_mux;

    
    n_counter #(.n(8)) pc_inst (
        .clk(clk),
        .reset_n(reset_n),
        .load(jump),              
        .en(1'b1),                 
        .load_data({5'b0,data}),          
        .count(pc)
    );
       
    ROM1 rom1(
    .address(pc),
    .data(instruction)
    );
    
    assign control_write= J & C & D1 & D0 & Sreg;
    
    logic [3:0] ram_addr;
    assign ram_addr = data;
    RAM ram1(.clk(clk),
    .reset_n(reset_n),
    .write_enable(control_write),
    .address(ram_addr),
    .data_in(RA),
    .data_out(Ram_out)    
    );
    
    assign control_mux= Sreg& ~D1 &J &C;
    
    assign outmux2= control_mux ? Ram_out:data;
    
    
    
   assign {J, C, D1, D0, Sreg,data}= instruction;
   // assign J = instruction[7];
    //assign c = instruction[6];
    //assign D1 = instruction[5];
    //assign D2 = instruction[4];
    //assign Srag = instruction[3];
    //assign data = instruction[2];
    //C, D1, D0, Sreg,data;
    //= instruction;
    
    assign S = instruction[2];
     MUX m2(.a({5'b0,outmux2}),
     .b(alu_result),
     .s(Sreg),
     .y(outmux)
     );
     
    decodera decoder1(
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
    Zero_Flag z1(
    .clk(clk),
    .reset_n(reset_n),
    .en(1'b1),
    .in_zero(alu_result),
    .out_zero(zero_flag)
    
    );
    
        
     assign jump_normal= J&~C&~Sreg;
     assign jc=out_carry&~J&C&~Sreg;
     assign jz=zero_flag&J&C&~Sreg; 
     
     assign jump=jump_normal|jc|jz; 

   

endmodule

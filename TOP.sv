`timescale 1ns / 1ps


module TOP(
    input wire CLK100MHZ,    // using the same name as pin names
    input wire CPU_RESETN,BTNC,
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN,    
    input wire [15:0] SW  
    );
    
    logic reset_n;
    logic clk;
    logic R0;
    assign reset_n = CPU_RESETN;
    assign reset_n = CPU_RESETN;
    assign clk = CLK100MHZ;
    
    K2TOP(
        .clk(BTNC),
        .reset_n(reset_n),
        .R0(R0)
    );
    
    sev_seg_top s1(
    .out_SW(R0),
    .CLK100MHZ(CLK100MHZ) ,
    .CPU_RESETN(CPU_RESETN),
    .CA(CA),.CB(CB),.CC(CC),.CD(CD),
    .CE (CE),
    .CF(CF),
    .CG(CG),
    .AN(AN)
       );
    

    
    
    
endmodule

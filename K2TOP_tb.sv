`timescale 1ns / 1ps

module K2TOP_tb;

    // Testbench signals
    logic clk;
    logic reset_n;
    logic [7:0] R0;



    initial clk = 0;
    always #5 clk = ~clk; // Generate a 10 ns clock period

    K2TOP dut (
        .clk(clk),
        .reset_n(reset_n),
        .R0(R0)
    );


    // Test process
    initial begin
        // Initialize
        $display("Starting simulation...");
        
        reset_n = 0;
        #1;
        reset_n = 1;
        $display("De-asserting reset");

        #2000000;

        $display("Ending simulation.");
        $finish;
    end
endmodule





module RAM(
  
    input logic clk,
    input logic  write_enable,
    input logic [9:0]address,
    input logic [7:0]data_in,
    output logic  [7:0]data_out
    );
   

logic [7:0]ram_block[15:0];

always @(posedge clk) begin
        if(write_enable)
            ram_block[address] <= data_in;
end
  assign data_out = ram_block[address];
endmodule

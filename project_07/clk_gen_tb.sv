module freq_gen_tb;
    timeunit 1ns;
    timeprecision 1ps;
    // DUT parameters
   	localparam int DataWidth = 8;
    // DUT signals
    logic clk_in, rst, clk_out;
    logic  [DataWidth-1:0] freq_sel;
  
    // The DUT
  freq_gen #(.DataWidth(DataWidth)
            )dut (.clk_in,
                  .freq_sel,
                  .rst,
                  .clk_out);
   // Clock generation
  always #5 clk_in = ~clk_in;
  // Testbench stimulus
  initial begin
    // Initialize inputs
    clk_in = 0;
    freq_sel = 8'b0000_1000; // Set an initial value for freq_sel
    rst = 0;
    // Apply reset
    rst = 1;
    #10 rst = 0;
    // Test with different freq_sel values
    #20 freq_sel = 8'b0000_0100; // Set a new value for freq_sel
    #20 freq_sel = 8'b0000_0010; // Set another value for freq_sel
    // Test with reset again
    #20 rst = 1;
    #10 rst = 0;
    // End simulation
    #20 $finish;
  end
  // Monitor for observing the output
  always @(posedge clk_out) begin
    $display("Time %0t - clk_out = %b", $time, clk_out);
  end
endmodule


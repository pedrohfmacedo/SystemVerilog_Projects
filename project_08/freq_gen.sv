/*
      This is a frequency generator with a parallel data input,
      intended to generate the desired frequency
*/

// Set the timescale for the module
`timescale 1ns/1ps

module freq_gen #(
    int DataWidth = 8
) (
    input  logic clk_in, rst,
    input  logic [DataWidth-1:0] freq_sel,
    output logic clk_out);
  
// Internal variable to hold the counter value
  logic [DataWidth:0] counter;

// synchronous logic
  always_ff @(posedge clk_in) begin
    if (rst) begin
        counter <= 1'b0;
    end 
    else begin
        counter <= counter + freq_sel + 1'b1;
	end
end

//continuous assignment out
assign clk_out = counter[DataWidth];

endmodule

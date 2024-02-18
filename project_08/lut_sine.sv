/*
This is Arbitrary frequency generator (rectangular, sine, triangular) connected to a counter, and the counter used to generate addresses for a lookup table (LUT), with parallel data output. The parallel output signal can be viewed directly or converted to analog value with a converter DA R-2R.
*/

  `timescale 1ns/1ps
  `include "freq_gen.sv"
  `include "lut_sine.sv"
  `include "lut_rectangular.sv"

module wave_gen # (
  int DataWidth = 16,            // Width of the output data (default: 16 bits)
  int LutSize = 32,              // Size of the Look-Up Table (default: 32 entries)
  int SelWidth = $clog2(LutSize) // Width of the Look-Up Table selector (calculated as log2 of LUT size)
) ( input logic clk, rst,
   input logic [DataWidth-1:0] freq_sel,
   input logic [SelWidth-1:0] wave_sel,
   input logic [SelWidth-1:0] duty_cycle, 
   output logic [DataWidth-1:0] wave
  );
  
  // Constants to identify waveforms
  localparam logic SINE_WAVE = 2'b0;
  localparam logic RECTANGULAR_WAVE = 1'b1;
  
  //Connect Frequency Generetor 
  wire clk_out;
  
  freq_gen # (
    .DataWidth(DataWidth)
  ) inst1 (.clk_in(clk), .rst(rst), .freq_sel(freq_sel), .clk_out(clk_out));
  
  //The Counter used to generate addresses for a LUTs
  logic [DataWidth-1:0] counter;

  always @(clk_out) begin // Make it level-sensitive to not lose frequency
    if (rst) begin
        counter <= 1'b0;
    end 
    else begin
        counter <= counter + 1'b1;
    end
end
// LUTs instantiations
  
  logic signed [DataWidth-1:0] sine;
  logic signed [DataWidth-1:0] rectangular;
  
  lut_sine inst2(
    .clk(clk),
    .rst(rst),
    .lut_sel(counter),
    .sine(sine)
);
  
  lut_rectangular inst3(
    .clk(clk),
    .rst(rst),
    .lut_sel(counter),
    .duty_cycle(duty_cycle),
    .rectangular(rectangular)
);
  
  // Out
always_comb begin
    case(wave_sel)
        SINE_WAVE: wave = sine;
        RECTANGULAR_WAVE: wave = rectangular;
        default: wave = 1'b0;
    endcase
end

endmodule

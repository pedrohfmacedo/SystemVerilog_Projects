package test_pkg;

  `timescale 1ns/1ps
  `include "freq_gen.sv"
  `include "lut_sine.sv"
  `include "lut_rectangular.sv"

  localparam int DataWidth = 16,            // Width of the output data (default: 16 bits)
  localparam int LutSize = 32,              // Size of the Look-Up Table (default: 32 entries)
  localparam int SelWidth = $clog2(LutSize) // Width of the Look-Up Table selector (calculated as log2 of LUT size)
endpackage
  

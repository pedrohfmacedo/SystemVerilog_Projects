module waveform_gen_tb;

    // Specifying time units for the simulation
    timeunit 1ns;
    timeprecision 1ps;
    // Includes
    `include "wave_gen.sv"
    `include "freq_gen.sv"
    `include "lut_sine.sv"
    `include "lut_rectangular.sv"
 	
    localparam int DataWidth = 16;            // Width of the output data (default: 16 bits)
    localparam int LutSize = 32;              // Size of the Look-Up Table (default: 32 entries)
    localparam int SelWidth = $clog2(LutSize); // Width of the Look-Up Table selector (calculated as log2 of LUT size)
  
    // DUT signals
  	logic rst, clk;
    logic        [DataWidth-1:0] freq_sel;
    logic        [SelWidth-1:0] wave_sel;
    logic        [SelWidth-1:0] duty_cycle;
    logic        [SSelWidth-1:0] freq_sel;
    logic        [DataWidth-1:0] wave;
  
    // DUT
    wave_gen #(.DataWidth(DataWidth),
                    .LutSize(LutSize),
                    .SelWidth(SelWidth)
                  )  dut (
                    .clk(clk),
                    .rst(rst),
                    .freq_sel(freq_sel),
                    .wave_sel(wave_sel),
                    .duty_cycle(duty_cycle), 
                    .wave(wave)
    );
  
   // Gerar clock
  initial begin
  repeat(100)
    begin #5 clk = ~clk;end
  end
  
    initial begin
        clk = 0;
        rst = 1;
        freq_sel = 0;
    #5    
        rst = 0;
        freq_sel = $urandom();
    #5
        freq_sel = $urandom();
    #5 
     	freq_sel = $urandom();
    #5
      	freq_sel = $urandom();
    #5
      	freq_sel = $urandom();
      
    end

  
  initial begin
    $display("--------Initiate------------*- ");
    $monitor("Time =%3d, clk=%b , freq_in=%d, rst =%b, sen=%b", $time , clk, freq_sel, rst, ,wave);
    /*
    $dumpfile("dump.vcd");
    $dumpvars(1, waveform_tb);
    */
  end 
	  

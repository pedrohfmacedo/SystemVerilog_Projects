`include "freq_gen.sv"

module freq_gen_tb;

    // Set the timescale for the simulation
    timeunit 1ns;
    timeprecision 1ps;

    // DUT parameters interns
    localparam int DataWidth = 8;

    // DUT signals
    logic clk_out, clk_in, rst;
    logic [DataWidth-1:0] freq_sel;
  
    // The DUT
    freq_gen #(.DataWidth(DataWidth)
    	) dut (.clk_in, .rst, .freq_sel, .clk_out );

    // Simulation variables
    int n_periods = 3; // Size of time window for each input value
    real start, finished;
    real freq_o; // Actual output frequency
    real freq_expct; // Expected output frequency
    real margin = 5; // Percentage margin of error
    bit verbose = 0; 
    int n_mismatches; // Counter for the number of frequency mismatches

    // Input clock 
    localparam real FREQ_I = 600e6; // Hz
    localparam real PERIOD = 1 / FREQ_I * 1s; // simulation time units
    localparam int MAX_CYCLES = 10000;
  
   //Clock update and initialization
    initial begin
        clk_in = 0; 
      forever 
        #(PERIOD/2) clk_in = ~clk_in;
      $display ("\nSimulation reached the time limit. End simulation.\n");
        $finish;
    end
    
    // The conference
    initial begin
    // Specifying time format (%t)
        $timeformat(-9, 3, "ns", 10); // e.g.: " 900.000ns"
      $display("*_________________________________________________*");

        $display("Original frequency is %.2e Hz.", FREQ_I);
        $display("Original period is %.3e s.", 1 / FREQ_I);
        $display("Original period is %.3f simulation time units.", PERIOD);
        
        rst = 1;
        #3 rst = 0;
        $display("%t: Reset", $realtime);
        freq_sel = 0;

    // With each value read, the input will be valid in each time 
   // and then the value of the average output frequency is calculated
do begin
    // Set the number of periods and record the start time
    n_periods = freq_sel + 2;
    start = $realtime;

    // Wait for the specified number of periods at the falling edge of clk_out
    repeat(n_periods) @(negedge clk_out);

    // Record the finish time and calculate the actual output frequency
    finished = $realtime;
    freq_o = 1s / ((finished - start) / n_periods);

    // Calculate the expected frequency based on the frequency selection
    freq_expct = FREQ_I * (freq_sel + 1) / 2.0**(DataWidth + 1);

    // Check the match between the expected and actual frequencies
    check(freq_expct, freq_o, margin);

    // Display information if verbose mode is enabled
    if (verbose)
        $display("%t: Freq sel = 0x%h. Output freq = %.2e. Expected freq = %.2e.", $realtime, freq_sel, freq_o, freq_expct);

    // Increment the frequency selection
    freq_sel += 1;
end while (freq_sel != '0);

        $display("%t: Simulation end. Number of mismatches: %0d.", $realtime, n_mismatches);
        $display("#==========================================================#");
        $finish;
    end

    //_________________Tasks_________________//
  
task check (real expected, real actual, real margin);
    real abs_margin;

	// Checks if the margin is within the valid range
    if (!(margin >= 0 && margin <= 100)) begin
        $display("The margin is outside the valid percentage!");
    end else begin
    //Calculate the absolute margin
        abs_margin = expected * margin / 100;
    // Check if the difference between expected and actual is outside the margin
        if (expected - actual > abs_margin || actual - expected > abs_margin) begin
            $display("%t: ERROR! Expected = %.2e. Actual = %.2e.", $realtime, expected, actual);
            n_mismatches=n_mismatches+1;
        end
    end
endtask
  
  /*   // System tasks to dump VCD waveform file
  initial begin
    $dumpvars;
    $dumpfile ("dump.vcd");
  end
*/
endmodule

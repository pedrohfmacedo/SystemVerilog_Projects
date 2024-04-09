 Code your testbench here
 or browse Examples
module i2s_tb();
  
  timeunit 1ns;
  timeprecision 1ps;
  
  DUT signals
  localparam int WIDTH = 16;
  logic clk, rst, ready, SCLK, WS, SD;
  logic [2WIDTH-10] Tx;
  
  DUT
  i2s # (.WIDTH(WIDTH)
        ) DUT (
    .clk(clk),
    .rst(rst),
    .Tx(Tx),
    .ready(ready),
    .SCLK(SCLK),
    .WS(WS),
    .SD(SD)
  );
  
  initial begin
    $monitor(Time= %g, ready%d, SCLK%d, WS%d, SD%d., $time, ready, SCLK, WS, SD );
    $monitor(State%d, Ready_temp %d, Tx_temp,= %d, WS_temp = %d , SD_Temp = %d, DUT.state, DUT.ready_temp, DUT.Tx_temp, DUT.WS_temp, DUT.SD_temp);
      $dumpfile(mef.vcd);
      $dumpvars(0,DUT);
    end
  
  always begin #1 clk = ~clk; end
  
  initial begin
    clk = 0;
    rst = 1;
    #1 rst = 0;
    #1 Tx = 32'b110000101010101001011001;
    #100 $finish;
    end
  
  
  
  
endmodule

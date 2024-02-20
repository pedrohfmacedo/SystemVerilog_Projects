/*The I2S Transmitter module converts digital audio signals into a suitable format for transmission, enabling efficient communication and audio playback on connected devices." */

module i2s # (
  int WIDTH= 16
)(
  input logic clk, 	// Input clock for the audio interface
  input logic rst, 	// Reset input for the audio interface (active high)
  input logic [2*WIDTH-1:0] tx, //Transmission data
  input logic ready, // Ready signal to indicate a new data transmission
  
  //I2S interface
   output logic SCLK,  // Serial Clock for the I2S
   output logic WS,    // Left/Right clock
   output logic SD     // Serial data for the I2S 
);
  
  // Constants for 
  parameter S0 = 1'b0; // Stte Reset
  parameter S1 = 1'b1; // State Load Word
  parameter S2 = 1'    // State TransmitWord
  
  //States
  logic [2:0] state, next_state;
  
  localparam int BIT_WIDTH = $clog2(2*WIDTH);
  logic [BIT_WIDTH-1:0] bit_cnt; // Counter of bits transmitted
  
  always_comb begin
    case (state)
      SO:
        next_state = S1;
      S1:
        next_state = S2;
      S2:
        next_state = S3;
      default: next_state = S0;
  end
      
  always_ff @(posedge clk)begin
    if (rst) begin
      state <=S0;
    end
    else begin
      state <= next_state;
 	 end
  end
  
  
  
endmodule

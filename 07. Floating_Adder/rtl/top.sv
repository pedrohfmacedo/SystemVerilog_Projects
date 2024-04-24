`include "floatpkg.sv"
 
import floatpkg::float_t;

module top(
	input  float_t x,
	input  float_t y,
	output float_t out,
        output reg  overflow);

  float_t big, smal;
  logic [7:0] dif;
  logic bit_round;
 
  always_comb
  begin
    if (x.exponent > y.exponent) begin
      big  = x;
      smal = y; end
    else        begin 
      big  = y;
      smal = x; end
   
   dif = big.exponent - smal.exponent;
   out.fraction = smal.fraction >> dif;
   out.exponent = big.exponent;
   out.signal = smal.signal;

   bit_round = out.fraction[0];

   if (out.exponent  > 8'b11111111) begin
      overflow = 1; end // Ocorreu Overflow
   else begin
      overflow = 0; end // Sem overflow
  end
  
  if (bit_round && out.fraction[22:1]== 23'b11111111111111111111111) begin
      out = {out.exponent,out.fraction[22:1]} + (bit_round && ((out.fraction[22:1] != 23'b11111111111111111111111)));end 
	end
endmodule

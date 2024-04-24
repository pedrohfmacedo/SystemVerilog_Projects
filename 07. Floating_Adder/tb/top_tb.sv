`include "floatpkg.sv"
`include "top.sv"

import floatpkg::float_t;

module fp_sorter_tb;
    float_t x;
    float_t y;
    float_t out;
    reg overflow;

    top uut(.x(x), .y(y), .out(out),.overflow(overflow));

  task check_overflow;
         if (overflow) begin
             $display("Ocorreu Oveflow!"); end
    endtask

    initial
    begin
    x ='{1'b0, 8'b00000000, 23'b00000000000000000000000};   y ='{1'b0, 8'b00000000, 23'b00000000000000000000000}; #10;
    x ='{1'b0, 8'b11111111, 23'b11111111000000000000000};   y ='{1'b0, 8'b00000001, 23'b11110000000000000000000}; #10;
    x ='{1'b0, 8'b00001111, 23'b00000000000000011111111};   y ='{1'b0, 8'b00000001, 23'b00000000000000001111000}; #10;
    x ='{1'b0, 8'b00000000, 23'b00000000000000000000000};   y ='{1'b0, 8'b00000001, 23'b00000000000000001111000}; #10;
    x ='{1'b0, 8'b00000000, 23'b00000000000000000000000};   y ='{1'b1, 8'b00000001, 23'b00000000000000001111000}; #10;
    x ='{1'b0, 8'b00000000, 23'b00000000000000001111000};   y ='{1'b0, 8'b00001111, 23'b00000000000000001111111}; #10;
        $stop;
    end

  initial 
    begin
	      $monitor("Time = %g,  X =  %b, Y = %b, X+Y = %b , OVERFLOW: %b ", $time, x, y, out, overflow);
    check_overflow;  
 end
 

endmodule

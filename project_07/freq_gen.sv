`timescale 1ns/1ps

module freq_gen #(
  parameter DataWidth = 8)(
  input logic clk_in,           
  input logic [DataWidth-1:0] freq_sel,
  input rst,
  output logic clk_out
);
  
  logic [DataWidth:0] counter;
  
  
  always@(posedge clk_in) begin
    if(rst) begin
		counter<= 1'b0;
        clk_out<= 1'b0;
    end
    else begin
      counter<=counter+freq_sel+1;
    end
  end
   
  always@(*) begin
    if (counter >=freq_sel)begin 
      clk_out = counter[DataWidth];
    end
    else begin
      clk_out = 0;
    end
  end
  
endmodule

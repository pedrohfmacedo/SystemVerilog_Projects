// Code your testbench here
// or browse Examples

module teste ();
  logic E;
  logic [3:0] S;
  logic [3:0] B;

  
  ConverterBCD Teste (E,S,B);
  initial begin
    $dumpfile("teste_bcd.vcd");
    $dumpvars(E,S,B);
  end
    
  initial begin 
 	E=0;
    $monitor(B);
    E=3;
    $monitor(B);
  end
endmodule

// Code your testbench here
// or browse Examples
module mef_tb();
  
  logic E,CLK,CLR,Y;
  
  mef inst1(E,CLK,CLR,Y);
  
  initial 
    begin
      $monitor("time = %g,  E = %b, Y = %b", $time, E,Y);
      $dumpfile("mef.vcd");
      $dumpvars(0,inst1);
    end
  //Iniciando as variáveis em um valor conhecido		
  initial 
    begin
      E = 1;
      CLK = 0;
      CLR = 1;
    end 
  //Atualização do clock 
  always
    begin
      #1 CLK = ~CLK;
    end
  //Variações das entradas
  initial
    begin
      #2 CLR = 0;
      
      #2 E   = 0;
      #2 E   = 0;
      #2 E   = 0;
      #2 E   = 0;
      
      #2 E   = 1;
      #2 E   = 0;
      #2 E   = 0;
      #2 E   = 0;
      #2 E   = 0;
      
    end
  
  //Tempo para finalizar a simulação
  initial
  	begin
      #20 $finish;
     end

endmodule

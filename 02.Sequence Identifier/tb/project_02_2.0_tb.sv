module mef_tb();
  
  logic E,clk,clr,Y; 
  logic  [3:0] user_seq;
  //instanciando DUT  
  mef inst1(.E(E),.clk(clk),.clr(clr),.user_seq(user_seq),.Y(Y));
  
  initial 
    begin
      $monitor("Time = %g,  E = %b, Y = %b.", $time, E,Y);
      $dumpfile("mef.vcd");
      $dumpvars(0,inst1);
    end
  //Iniciando as variáveis em um valor conhecido		
  initial 
    begin
      E = 1;
      clk = 0;
      clr = 1;
      //definindo a detecção da sequência 
      user_seq = 4'b1001;
    end 
  //Atualização do clock 
  always
    begin
      #1 clk = ~clk;
    end
  //Variações das entradas
  initial
    begin
      #1 clr = 0;
      #2 E   = 1;
      #2 E   = 0;
      #2 E   = 0;
      #2 E   = 1;
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

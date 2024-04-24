module tbc_tb();
  
 logic clk,clr,right, left, haz, la, lb, lc, ra, rb, rc;
 logic [2:0] estado;
  
 localparam SIMULATION_TIME = 2000;
 parameter TIME_TEST = 20;
  
 t_bird_control inst1(.clk(clk),.clr(clr),.right(right),.left(left),.haz(haz),.la(la),.lb(lb),.lc(lc),.ra(ra),.rb(rb),.rc(rc),.estado(estado));
  
  initial 
    begin
      $monitor("Time = %g, Haz = %b, Left = %b, right = %b, clk = %b, state = ", $time, haz, left, right, clk, estado);
      $dumpfile("tbc.vcd");
      $dumpvars(0,inst1);
    end
  //Iniciando as variáveis em um valor conhecido	
 initial 
   begin
     haz = 0;
     left = 0;
     right = 0;
     clr = 1;
     clk = 0;
   end   
  //Atualização do clock 
	always begin
    	repeat (SIMULATION_TIME) begin  // 2 segundos (2 * 10^9 ns) - Ciclo ininterrupto
      	#1 clk = ~clk;
    	end
    end
  //Variações das entradas
  initial
    begin
      #1 clr = 0;
      #1 haz = 1; left = 0; right = 0;
	  #1 haz = 0; left = 0; right = 0;
      #1 haz = 0; left = 1; right = 1;
      #1 haz = 0; left = 1; right = 0;
      #1 haz = 0; left = 0; right = 1;
      #1 haz = 0; left = 1; right = 0;
      #1 haz = 0;
      #1 haz = 0;
      #1 haz = 0; left = 1; right = 0;
      #1 haz = 1;
      #1 haz = 0;
      #1 haz = 0; left = 1; right = 0;
      #1 haz = 0;
      #1 haz = 1;
      #1 haz = 0; left = 1; right = 0;
      #1 haz = 1;     
    end
 
  //Tempo para finalizar a simulação
  initial
  	begin
      #TIME_TES $finish;
     end

endmodule

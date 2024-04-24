
module huffman_decoder_tb();
  //definindo fios
  logic e,clk,rst;
  logic [5:0] s;
  
  //Instanciando módulo top
  huffman_decoder inst1(.e(e),.clk(clk),.rst(rst),.s(s));
  
  initial 
    begin
      $monitor("time = %g,  E = %b, Y = %b", $time, e, s);
      $dumpfile("huffman_decoder.vcd");
      $dumpvars(0,inst1);
    end
  //Iniciando as variáveis em um valor conhecido		
  initial 
    begin
      e = 1;
      clk = 0;
      e = 1;
      rst = 1;
      e = 0;
    end 
  //Atualização do clock 
  always
    begin
      repeat (2000000) begin  // 2 segundos (2 * 10^9 ns) - Ciclo interru
      #1 clk = ~clk;
    end
    end
  //Variações das entradas
  initial
    begin
      #1 rst = 0;
       #2  e =0;
       #2  e =0;
       #2  e =1;
       #2  e =1;
       #2  e =0;
       #2  e =1;
       #2  e =1;
       #2  e =0;
       #2  e =1;
       #2  e =1;
       #2  e =1;
       #2  e =0;
       #2  e =0;
       #2  e =0;

       #2  e =1;
       #2  e =1;
       #2  e =1;
       #2  e =0;
       #2  e =0;
       #2  e =1;

       #2  e =1;
       #2  e =1;
       #2  e =1;
       #2  e =0;
       #2  e =1;
       #2  e =0;

       #2  e =1;
       #2  e =1;
       #2  e =1;
       #2  e =0;
       #2  e =1;
       #2  ee =1;
       #2  ie =0;

	end
  //Tempo para finalizar a simulação
  initial
  	begin
      #110 $finish;
     end

endmodule

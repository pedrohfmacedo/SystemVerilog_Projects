//1º módulo de teste realiza os testes de valores conhecidos e aleatórios sobre os metódos $urandom e $random_range
module median_tb();
  
  logic [7:0] a,b,c,d,e,f,g,h,i,s0,s1,s2,s3,s4,s5,s6,s7,s8;
  
  median inst1(a,b,c,d,e,f,g,h,i,s0,s1,s2,s3,s4,s5,s6,s7,s8);
  
    initial 
    begin
      $dumpfile("median.vcd");
      $dumpvars(0,inst1);
      $monitor("A Filtragem é: %0d %0d %0d %0d %0d %0d %0d %0d %0d e a mediana é %0d",s0,s1,s2,s3,s4,s5,s6,s7,s8,s4);
      //$monitor("A Mediana é: %0d",s4); 
    end
  //Iniciando as variáveis em um valores conhecidos	
  
/*
  initial 
    begin
	  a = 8'b00000001; //1 -
      b = 8'b00000010; //2 -
      c = 8'b00001100; //12
      d = 8'b00001000; //8
      e = 8'b00000100; //4 -
      f = 8'b00001010; //10
      g = 8'b00000110; //6 -
      h = 8'b00000011; //3 -
      i = 8'b00010011; //3 -
      end
*/
  //Iniciando as variáveis em valores desconhecidos usando o método $urandom;
/*
  initial
    begin
	  a = $urandom; 
      b = $urandom; 
      c = $urandom; 
      d = $urandom; 
      e = $urandom; 
      f = $urandom; 
      g = $urandom; 
      h = $urandom; 
      i = $urandom; 
    end
*/
   //Iniciando as variáveis em valores desconhecidos usando o método $urando_range;
      initial 
    begin
      a = $urandom_range(10, 50); 
      b = $urandom_range(7, 10); 
      c = $urandom_range(10, 30); 
      d = $urandom_range(40, 50); 
      e = $urandom_range(0, 50); 
      f = $urandom_range(2, 11); 
      g = $urandom_range(100, 110); 
      h = $urandom_range(3, 5); 
      i = $urandom_range(5, 7); 
    end
  
//2º módulo de teste realiza os testes no módulo utlizando um loop para geração de valores desconhecidos 
module median_tb();
  
  
  logic [7:0] a,b,c,d,e,f,g,h,i,s0,s1,s2,s3,s4,s5,s6,s7,s8;
  logic [7:0] l[8];
  
  median inst1(l[0],l[1],l[2],l[3],l[4],l[5],l[6],l[7],l[8],s0,s1,s2,s3,s4,s5,s6,s7,s8);
  
       initial 
    begin
      $dumpfile("median.vcd");
      $dumpvars(0,inst1);
      $monitor("A Filtragem é: %0d %0d %0d %0d %0d %0d %0d %0d %0d e a mediana é %0d",s0,s1,s2,s3,s4,s5,s6,s7,s8,s4);
    end
  
  initial begin
    // Loop para gerar 8 valores aleatórios
    for (int i = 0; i < 8; i++) begin
      // Gerando um valor aleatório de 0 a 99
      l[i] = $urandom;
      // Exibindo o valor gerado
      $display("Valor Aleatório[%0d]: %0d", i, l[i]);
    end
  end
endmodule

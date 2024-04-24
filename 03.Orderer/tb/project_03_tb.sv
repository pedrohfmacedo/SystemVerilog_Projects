// Code your testbench here
// or browse Examples
//1º módulo de teste realiza os testes de valores conhecidos e aleatórios sobre os metódos $urandom e $random_range
module ordener_tb();
  
  logic [7:0] a,b,c,d,e,f,g,h,s0,s1,s2,s3,s4,s5,s6,s7;
  
  ordener2 inst1(a,b,c,d,e,f,g,h,s0,s1,s2,s3,s4,s5,s6,s7);
  
    initial 
    begin
      $dumpfile("ordener2.vcd");
      $dumpvars(0,inst1);
      $monitor("A Filtragem é: %0d %0d %0d %0d %0d %0d %0d %0d",s0,s1,s2,s3,s4,s5,s6,s7);
    end
  /*
  //Iniciando as variáveis em um valores conhecidos	
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
*/
  
/*
  //Iniciando as variáveis em valores desconhecidos usando o método $urandom;
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
      $display("Os números gerados foram: %0d %0d %0d %0d %0d %0d %0d %0d",a,b,c,d,e,f,g,h);
    end
*/
/*
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
      $display("Os números gerados foram: %0d %0d %0d %0d %0d %0d %0d %0d",a,b,c,d,e,f,g,h);
    end
*/
endmodule



//módulo que gera um loop de vários valores aleatórios e verifica
module ordener_tb2();
  
  
  logic [7:0] a,b,c,d,e,f,g,h,s0,s1,s2,s3,s4,s5,s6,s7;
  logic [7:0] l[7];
  
  ordener2 inst1(l[0],l[1],l[2],l[3],l[4],l[5],l[6],l[7],s0,s1,s2,s3,s4,s5,s6,s7);
  
    initial 
    begin
      $dumpfile("ordener2.vcd");
      $dumpvars(0,inst1);
      $monitor("A Filtragem é: %0d %0d %0d %0d %0d %0d %0d %0d",s0,s1,s2,s3,s4,s5,s6,s7);
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



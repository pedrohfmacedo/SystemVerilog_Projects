module ordener_tb();
  
  logic [7:0] a,b,c,d,e,f,g,h,s0,s1,s2,s3,s4,s5,s6,s7;
  
  ordener2 inst1(a,b,c,d,e,f,g,h,s0,s1,s2,s3,s4,s5,s6,s7);
  
    initial 
    begin
      $dumpfile("ordener2.vcd");
      $dumpvars(0,inst1);
      $monitor("A Filtragem é:",s0,s1,s2,s3,s4,s5,s6,s7);
    end
  
  //Iniciando as variáveis em um valores conhecidos	
  initial 
    begin
	  a = 8'd1;
      b = 8'b00000010;
      c = 8'b00001100;
      d = 8'b00001000;
      e = 8'b00000100;
      f = 8'd10;
      g = 8'b00000110;
      h = 8'b00000011;
      i = 8'b00000000;
      $display("A Filtragem é:",s0,s1,s2,s3,s4,s5,s6,s7);
    end
  
endmodule
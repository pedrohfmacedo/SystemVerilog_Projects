//Neste projeto, foi utilizado a utlização de blocos menores de comparações, chamado "ordena_3", para organizarem os valores em grupos e realizar as comparações entre os resultados encontrados nestas conexões.
module median (
  input logic [7:0] a, b, c, d, e, f, g, h, i,
  output logic [7:0] s0, s1, s2, s3, s4, s5, s6, s7, s8
);
  //fios para conexão dos módulos
  logic [7:0] m1, m2, m3, n1, n2, n3, o1, o2, o3;
  logic [7:0] m10,m20,m30,n10,n20,n30,o10,o20,o30;
  logic [7:0] m100,n100,o100;
  
  //primeias conexões dos módulos
  ordena_3 inst1 (.a(a), .b(b), .c(c), .maior(m1), .meio(n1), .menor(o1));
  ordena_3 inst2 (.a(d), .b(e), .c(f), .maior(m2), .meio(n2), .menor(o2));
  ordena_3 inst3 (.a(g), .b(h), .c(i), .maior(m3), .meio(n3), .menor(o3));
  
  ordena_3 inst4 (.a(m1), .b(m2), .c(m3), .maior(m10), .meio(n10), .menor(o10));
  //maior número = m10, segundo maior número = n10, terceiro maior número = o10;
  ordena_3 inst5 (.a(o1), .b(o2), .c(o3), .maior(m20), .meio(n20), .menor(o20));
  //menor número = o20, segundo menor número = n20, terceiro menor número = m20;
  ordena_3 inst6 (.a(n1), .b(n2), .c(n3), .maior(m30), .meio(n30), .menor(o30));
  ordena_3 inst7 (.a(o30), .b(n20), .c(m20), .maior(m100), .meio(n100), .menor(o100));
  //meior menor = o30, meio meio = n30, meio maior = m30;
  
  assign s0 = o20;
  assign s1 = o100;	  
  assign s2 = n100;
  assign s3 = m100;
  assign s4 = n30;
  assign s5 = m30;
  assign s6 = o10;
  assign s7 = n10;
  assign s8 = m10;
  
endmodule
//módulo ordena_3 realiza a organização crescente entre 3 números.
module ordena_3(input logic [7:0]a,b,c,
                output logic [7:0]maior,meio,menor);
  
    always@(*) begin
      if(a>b && a>c && b>c) begin
              maior=a;
        	  meio =b;
      		  menor=c;
      end
      else if(a>b && a>c && b<c) begin
              maior=a;
        	  meio =c;
      		  menor=b;
      end
      else if(b>a && b>c && a>c) begin
              maior=b;
        	  meio =a;
      		  menor=c;
      end
      else if(b>a && b>c && a<c) begin
              maior=b;
        	  meio =c;
      		  menor=a;
      end
      else if(c>a && c>b && a>b) begin
              maior=c;
        	  meio =a;
      		  menor=b;
      end
      else begin
              maior=c;
        	  meio =b;
      		  menor=a;
      end
   end
endmodule

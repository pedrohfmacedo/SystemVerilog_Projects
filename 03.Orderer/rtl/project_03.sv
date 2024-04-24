//Neste projeto, foi utilizado a utlização de blocos menores de comparações, chamado "ordena_2", para organizarem os valores em grupos e realizar as comparações entre os resultados encontrados nestas conexões.
module ordener2 (
  input logic [7:0] a, b, c, d, e, f, g, h,
    output logic [7:0] s0, s1, s2, s3, s4, s5, s6, s7
);

  logic [7:0] h1, h2, h3, h4, h5, n1, n2, n3, n4;
  logic [7:0] h10, h20, h30, h40, n10, n20, n30, n40;
  logic [7:0] h100, h200, h300, h400, h500, h600, h700, h800;
  
  ordena_2 inst1(.a(a), .b(b), .maior(h1), .menor(n1));
  ordena_2 inst2(.a(c), .b(d), .maior(h2), .menor(n2));
  ordena_2 inst3(.a(e), .b(f), .maior(h3), .menor(n3));
  ordena_2 inst4(.a(g), .b(h), .maior(h4), .menor(n4));  
  // 2 maiores números
  ordena_2 inst5(.a(h1),  .b(h2),  .maior(h10),  .menor(n10));
  ordena_2 inst6(.a(h3),  .b(h4),  .maior(h20),  .menor(n20));
  ordena_2 aux01(.a(h10), .b(h20), .maior(h100), .menor(h200)); //h100 maior número e h200 é o segundo maior número
  //2 menores números
  ordena_2 inst7 (.a(n1), .b(n2), .maior(h30),   .menor(n30));
  ordena_2 inst8 (.a(n3), .b(n4), .maior(h40),   .menor(n40));
  ordena_2 aux02(.a(n30), .b(n40),.maior(h400),  .menor(h300)); //h300 menor númeor e h400 é o segundo menor
  // meio
  ordena_2 inst9 (.a(n10), .b(n20), .maior(h500), .menor(h600)); //
  ordena_2 inst10(.a(h30), .b(h40), .maior(h700), .menor(h800));
  
  assign s0 = h300;
  assign s1 = h400;	  
  assign s2 = h800;
  assign s3 = h700;
  assign s4 = h600;
  assign s5 = h500;
  assign s6 = h200;
  assign s7 = h100;

endmodule

//módulo ordena_2realiza a organização crescente entre 2 números.
module ordena_2(input logic [7:0]a,b,
                output logic [7:0]maior,menor);
  
    always@(*) begin
      if(a<b) begin
              maior=b;
      		  menor=a;
      end
              else begin
              maior=a;
      		  menor=b;
      end
   end
endmodule

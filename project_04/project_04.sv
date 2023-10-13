
module ordener2(input logic [7:0] a,b,c,d,e,f,g,h,
               output logic[7:0] s0,s1,s2,s3,s4,s5,s6,s7);
  
  logic [7:0]h1,h2,h3,h4,h5,n1,n2,n3,n4;
  logic [7:0]h10,h20,h30,h40,h50,n10,n20,n30,n40;
  logic [7:0]h100,h200,h300,h400,h500,n100,n200,n300,n400;
  
  always@(*) begin
    //1
    ordena_2(.a(a), .b(b), .maior(h1), .menor(n1));
    ordena_2(.a(c),.b(d),.maior(h2),.menor(n2));
    ordena_2(.a(e),.b(f),.maior(h3),.menor(n3));
    ordena_2(.a(g),.b(d),.maior(h4),.menor(n4));
    //maiores
    ordena_2(.a(h1),.b(h2),.maior(h10),.menor(n10));
    ordena_2(.a(h3),.b(h4),.maior(h20),.menor(n20));
    //menores
    ordena_2(.a(n1),.b(n2),.maior(h30),.menor(n30));
    ordena_2(.a(n3),.b(n4),.maior(h40),.menor(n40));
    //meio
    ordena_2(.a(n30),.b(h10),.maior(h50),.menor(n50));
    ordena_2(.a(n20),.b(h20),.maior(h60),.menor(n60));
    
    ordena_2(.a(h50),.b(h60),.maior(h200),.menor(n200));
    ordena_2(.a(n50),.b(n60),.maior(h300),.menor(n300));
    ordena_2(.a(h300),.b(n200),.maior(h500),menor(n500));
    
    //extremos
    ordena_2(.h10,.h20,.h100,.n100);
    ordena_2(.h30,.h40,.h400,.n400);
    
    s7=h100;
    s6=n100;
    s5=h200;
    s4=h500;
    s0=n400;
    s1=h300;
    s2=n300;
    s3=n400;
  end
endmodule

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

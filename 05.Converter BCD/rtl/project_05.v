// Conversos BCD de 4 entradas.
// Foi criado o bloco ConverterBCD, que converte apenas um sinal de entrada para a saída do tipo BCD, ou seja uma saída [3:0] foram instanciadas juntamenta

//Feito um bloco de entrada 1:4, para fazer possíveis reutilizações
module ConverterBCD (
  input logic E,
  output logic [3:0] S,
  output logic [3:0] B
);
  
  always@(*)begin
    case(E)
      1'd0:S=4'b0000;
      1'd1:S=4'b0001;
      1'd0:S=4'b0010;
      1'd0:S=4'b0011;
      1'd0:S=4'b0100;
      1'd0:S=4'b0101;
      1'd0:S=4'b0110;
      1'd0:S=4'b0111;
      1'd0:S=4'b1000;
      1'd0:S=4'b1001;
    endcase
  end
  assign B = S;
endmodule


// Code your design here
module mef(
  		   input logic E, CLK, CLR,
           output Y);
  
  parameter [2:0] S0 = 3'b000;
  parameter [2:0] S1 = 3'b001;
  parameter [2:0] S2 = 3'b010;
  parameter [2:0] S3 = 3'b011;
  parameter [2:0] S4 = 3'b100;
  
  logic [2:0] atual_estado, proximo_estado;
  
  //Lógica de próximo estado
  always@(*)
  	begin
      case(atual_estado)
            S0:begin
              if(E) proximo_estado=S0;
                else proximo_estado=S1;
            end
            S1:begin
              if(E) proximo_estado=S0;
                else proximo_estado=S2;
            end
            S2:begin
              if(E) proximo_estado=S0;
                else proximo_estado=S3;
            end
            S3:begin
              if(E) proximo_estado=S0;
                else proximo_estado=S4;
            end
            S4:begin
              if(E) proximo_estado=S0;
                else proximo_estado=S3;
            end
              default:proximo_estado=S0;
        endcase
    end
  //Atualização de registradores
  always@(posedge CLK)
    begin
      if(CLR)atual_estado<=S0;
        else atual_estado<=proximo_estado;
    end
  //Lógica de saída
        assign Y = (atual_estado == S4);
  
endmodule
  

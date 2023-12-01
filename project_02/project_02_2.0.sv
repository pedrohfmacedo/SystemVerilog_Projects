//Minúsculo: p, código em ascii: 0x56; 
//Sequência: 0001
module mef(
  		   input logic E, clk, clr,
  		   input logic [3:0] user_seq,
           output Y);
  
  parameter [2:0] 
  S0 = 3'b000, 
  S1 = 3'b001, 
  S2 = 3'b010, 
  S3 = 3'b011, 
  S4 = 3'b100;
  
  logic [2:0] atual_estado, proximo_estado;
  
  //Lógica de próximo estado
  always@(*)
  	begin
       case(atual_estado)
         S0 : proximo_estado = (E == user_seq[3]) ?  S1 : 
                             S0 ;

         S1 : proximo_estado = (E == user_seq[2]) ?  S2 :
           (E == user_seq[3]) ?  S1 : 
                            S0 ;

         S2 : proximo_estado = (E == user_seq[1]) ?  S3 :
           (E == user_seq[2]) ?  S2 :
           (E == user_seq[3]) ?  S1 : 
                             S0 ;

         S3 : proximo_estado = (E == user_seq[0]) ?  S4 :  
           (E == user_seq[1]) ?  S3 :
           (E == user_seq[2]) ?  S2 :
           (E == user_seq[3]) ?  S1 : 
                            S0 ;

                                                
         S4: proximo_estado =  (E == user_seq[0]) ?  S4 :  
           (E == user_seq[1]) ?  S3 :
           (E == user_seq[2]) ?  S2 :
           (E == user_seq[3]) ?  S1 : 
                            S0 ;
            default: proximo_estado = S0;
        endcase
    end
  //Atualização de registradores
  always@(posedge clk)begin
      if(clr)begin
        atual_estado<=S0;
      end
        else begin
          atual_estado<=proximo_estado;
        end
    end
  //Lógica de saída
  assign Y = (atual_estado == S4);
  
endmodule
  

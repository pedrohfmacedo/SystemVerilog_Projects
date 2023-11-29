module mef(
  		   input logic E, CLK, CLR,
  output Y[7:0]);

 			 parameter [7:0] S1 = 8'b00;
 			 parameter [7:0] S2 = 8'b01;
 			 parameter [7:0] S3 = 8'b10;
 			 parameter [7:0] S4 = 8'b110;
 			 parameter [7:0] S5 = 8'b111000;
 			 parameter [7:0] S6 = 8'b111001;
			 parameter [7:0] S7 = 8'b111010;
       parameter [7:0] S8 = 8'b1110110;
  		 parameter [7:0] S9 = 8'b1110111;
			 parameter [7:0] S10 = 8'b1111000;
		 	 parameter [7:0] S11 = 8'b1111001;
  		 parameter [7:0] S12 = 8'b1111010;
	  	 parameter [7:0] S13 = 8'b1111011;
 			 parameter [7:0] S14 = 8'b1111100;
 			 parameter [7:0] S15 = 8'b1111101;
 			 parameter [7:0] S16 = 8'b1111110;
 			 parameter [7:0] S17 = 8'b11111110;
  		 parameter [7:0] S18 = 8'b11111111;

  		parameter [4:0] code1 = 5'b000001;
    	parameter [4:0] code2 = 5'b000010;
     	parameter [4:0] code3 = 5'b000011;
     	parameter [4:0] code4 = 5'b000100;
    	parameter [4:0] code5 = 5'b000101;
    	parameter [4:0] code6 = 5'b000110;
      parameter [4:0] code7 = 5'b000111;
      parameter [4:0] code8 = 5'b001000;
      parameter [4:0] code9 = 5'b001001;
      parameter [4:0] code10 = 5'b001010;
      parameter [4:0] code11 = 5'b001011;
      parameter [4:0] code12 = 5'b001100;
      parameter [4:0] code13 = 5'b001101;
      parameter [4:0] code14 = 5'b001110;
      parameter [4:0] code15 = 5'b001111;
      parameter [4:0] code16 = 5'b010000;
      parameter [4:0] code17 = 5'b010001;
      parameter [4:0] code17 = 5'b010010;
 	 
      logic [7:0] atual_estado, proximo_estado;
  
  //Lógica de próximo estado
  always@(atual_estado or E)
  	begin
      case(atual_estado)
        S1  : proximo_estado = E ? S1 : S2;
        S2  : proximo_estado = E ? S1 : S3;
        S3  : proximo_estado = E ? S2 : S3; 
        S4  : proximo_estado = E ? S0 : S1;
        S5  : proximo_estado = E ? S0 : S1;
        S6  : proximo_estado = E ? S0 : S2;
        S7  : proximo_estado = E ? S0 : S3; 
        S8  : proximo_estado = E ? S0 : S1;
        S9  : proximo_estado = E ? S0 : S1;
        S10 : proximo_estado = E ? S0 : S2;
        S11 : proximo_estado = E ? S0 : S3; 
        S12 : proximo_estado = E ? S0 : S1;
        S13 : proximo_estado = E ? S0 : S1;
        S14 : proximo_estado = E ? S0 : S2;
        S15 : proximo_estado = E ? S0 : S3; 
        S16 : proximo_estado = E ? S0 : S1;
        S17 : proximo_estado = E ? S0 : S1;
        S18: proximo_estado = E ? S0 : S2;
        default proximo_estado = 0;
      endcase
    end
  //Atualização de registradores
  always@(posedge CLK)
    begin
      atual_estado <= CLR ? 0: proximo_estado;
    end
  //Lógica de saída
  assign Y = (atual_estado == code1 )? 1 :
             (atual_estado == code2)? 2:
             (atual_estado == code3)? 3:
             (atual_estado == code4)? 4:
             (atual_estado == code5)? 5:
             (atual_estado == code6)? 6:
             (atual_estado == code7)? 7:
             (atual_estado == code8)? 8:
             (atual_estado == code9)? 9:
             (atual_estado == code10)? 10:
             (atual_estado == code11)? 11:
             (atual_estado == code12)? 12:
             (atual_estado == code13)? 13:
             (atual_estado == code14)? 14:
             (atual_estado == code15)? 15:
             (atual_estado == code16)? 16:
             (atual_estado == code17)? 17:
             (atual_estado == code18)? 18:0;
     
endmodule
  

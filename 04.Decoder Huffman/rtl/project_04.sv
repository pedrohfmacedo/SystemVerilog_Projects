//decodificador de huffman com entrada em série
module huffman_decoder(
  input logic e, clk, rst, 
  output logic [5:0] s);
  
  //limpador
  logic clr;
 // estados 
  logic [3:0] atual_estado, proximo_estado;
  logic [7:0] counter;
  
 //estados do huffman_decoder
  parameter [1:0] S1 = 2'b00;
  parameter [1:0] S2 = 2'b01;
  parameter [1:0] S3 = 2'b10;
  parameter [2:0] S4 = 3'b110;
  parameter [5:0] S5 = 6'b111000;
  parameter [5:0] S6 = 6'b111001;
  parameter [5:0] S7 = 6'b111010;
  parameter [6:0] S8 = 7'b1110110;
  parameter [6:0] S9 = 7'b1110111;
  parameter [6:0] S10 = 7'b1111000;
  parameter [6:0] S11 = 7'b1111001;
  parameter [6:0] S12 = 7'b1111010;
  parameter [6:0] S13 = 7'b1111011;
  parameter [6:0] S14 = 7'b1111100;
  parameter [6:0] S15 = 7'b1111101;
  parameter [6:0] S16 = 7'b1111110;
  parameter [7:0] S17 = 8'b11111110;
  parameter [7:0] S18 = 8'b11111111;
  //saídas esperadas para cada estado
  parameter [5:0] code0 = 6'b000000;
  parameter [5:0] code1 = 6'b000001;
  parameter [5:0] code2 = 6'b000010;
  parameter [5:0] code3 = 6'b000011;
  parameter [5:0] code4 = 6'b000100;
  parameter [5:0] code5 = 6'b000101;
  parameter [5:0] code6 = 6'b000110;
  parameter [5:0] code7 = 6'b000111;
  parameter [5:0] code8 = 6'b001000;
  parameter [5:0] code9 = 6'b001001;
  parameter [5:0] code10 =6'b001010;
  parameter [5:0] code11 =6'b001011;
  parameter [5:0] code12 =6'b001100;
  parameter [5:0] code13 =6'b001101;
  parameter [5:0] code14 =6'b001110;
  parameter [5:0] code15 =6'b001111;
  parameter [5:0] code16 =6'b010000;
  parameter [5:0] code17 =6'b010001;
  parameter [5:0] code18 =6'b010010;
  //Lógica de próximo estado
  always@(atual_estado) begin
      case(atual_estado)
        4'bzzzz:begin proximo_estado = 0;
        end
        0:begin proximo_estado = 1;
          counter[7]= e;
          clr = 0;
        end
        1:begin proximo_estado = 2;
          counter[6] = e;
          case(counter[7:6])
               S1:begin
                 s = code1;
                 clr = 1;
               end
               S2:begin 
                 s = code2;
                 clr = 1;
               end
               S3:begin
                 s = code3;
                 clr = 1;
               end
          endcase
        end
        2:begin proximo_estado = 3;
          counter[5] = e;
          case(counter[7:5])
            S4:begin
              s = code4;
              clr = 1;
            end
          endcase
        end
        3:begin proximo_estado = 4;
          counter[4] = e;
          clr = 0;
        end
        4:begin proximo_estado = 5;
          counter[3] = e;
          clr = 0;
        end
        5:begin proximo_estado = 6;
          counter[2] = e;
          case(counter[7:2])
            S5:begin
              s = code5;
              clr = 1;
            end
            S6:begin
              s = code6;
              clr = 1;
            end
            S7:begin
              s = code7;
              clr = 1;
            end
            default: clr = 0;
          endcase
        end
        6:begin proximo_estado = 7;
          counter[1] = e;
          case (counter[7:1])
            S8:begin 
              s = code8;
              clr = 1;
            end
            S9:begin
              s = code9;
              clr = 1;
            end
            S10:begin
              s = code10;
              clr = 1;
            end
            S11:begin
              s = code11;
              clr = 1;
            end
            S12:begin 
              s = code12;
              clr = 1;
            end
            S13:begin
              s = code13;
              clr = 1;
            end
            S14:begin
              s = code14;
              clr = 1;
            end
            S15:begin
              s = code15;
              clr = 1;
            end
            S16:begin
              s = code16;
              clr = 1;
            end
            default: clr = 0;
          endcase
        end
        7:begin proximo_estado = 4'bzzzz;
          counter[0] = e;
          case (counter)
            S17:begin
              s = code17;
              clr = 1;
            end
            S18:begin
              s = code18;
              clr = 1;
            end
            default: clr = 0;
          endcase
        end
        
      endcase
 	   end
  //Atualização de registradores
  always@(posedge clk) begin
    if (rst) begin
      atual_estado <= 4'bzzzz;
    end
    else begin
      atual_estado <= proximo_estado;
    end
    if(clr)begin
      atual_estado <= 0;
    end
    end

endmodule
  

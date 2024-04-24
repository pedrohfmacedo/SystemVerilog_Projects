module BCD_to_Binary_FSM(
    input logic clk,         // Clock de entrada
    input logic reset,       // Sinal de reset assíncrono
  input logic [15:0] bcd_in, // Entrada BCD de 4 bits
  output logic [15:0] binary_out // Saída binária de 4 bits
);
  
//Os estados da máquina
  parameter [1:0] S0 = 2'b00; // Estado inicial
  parameter [1:0] S1 = 2'b01; // Estado para converter dígito BCD para binário
  parameter [1:0] S2 = 2'b10; // Verificará se o próximo dígito BCD é zero ou não
  parameter [1:0] S3 = 2'b11; // Estado final, finaliza

  logic [1:0] next_state,current_state;
  logic [3:0] temp_binary;
  logic [3:0] bcd_digit [3:0];
  
	//next state logic
  always@(*) begin
   // Divide o barramento de entrada em dígitos individuais
        bcd_digit[0] = bcd_in[3:0];
        bcd_digit[1] = bcd_in[7:4];
        bcd_digit[2] = bcd_in[11:8];
        bcd_digit[3] = bcd_in[15:12];
        case (current_state)
            S0: begin
              if (bcd_in == 16'b0000_0000_0000_0000)
                    next_state = S3; // Número BCD é zero, estado final
                else
                    next_state = S1; // Próximo estado para converter o BCD
            	end

			S1: begin
                for (int i = 0; i < 4; i++) begin
                     logic [3:0] current_bcd_digit = bcd_digit[i];
                    if (current_bcd_digit >= 4'b1010) // Maior ou igual a 10 em BCD
                        temp_binary[i] = 4'b0000; // Valor inválido, atribui 0
                    else if (current_bcd_digit >= 4'b1000) // 8 ou 9 em BCD
                        temp_binary[i] = 4'b1000; // 8 em binário
                    else if (current_bcd_digit >= 4'b0110) // 6 ou 7 em BCD
                        temp_binary[i] = 4'b0110; // 6 em binário
                    else if (current_bcd_digit >= 4'b0101) // 5 em BCD
                        temp_binary[i] = 4'b0101; // 5 em binário
                    else if (current_bcd_digit >= 4'b0100) // 4 em BCD
                        temp_binary[i] = 4'b0100; // 4 em binário
                    else if (current_bcd_digit >= 4'b0011) // 3 em BCD
                        temp_binary[i] = 4'b0011; // 3 em binário
                    else if (current_bcd_digit >= 4'b0010) // 2 em BCD
                        temp_binary[i] = 4'b0010; // 2 em binário
                    else if (current_bcd_digit >= 4'b0001) // 1 em BCD
                        temp_binary[i] = 4'b0001; // 1 em binário
                    else
                        temp_binary[i] = 4'b0000; // 0 em binário
                end
               next_state = S2; // Próximo estado para converter o próximo dígito BCD
            end
            S2: begin
              if (bcd_in == 16'b0000_0000_0000_0000)
                    next_state = S3; // Número BCD é zero, estado final
                else
                    next_state = S1; // Próximo estado para converter o próximo dígito BCD
            end
         
            default: next_state = S0;
        endcase
    end
  
  	//output logic e update state register 
    always@(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= S0;
            binary_out <= 0;
            temp_binary <= 0;
        end 
      	else begin
            current_state <= next_state;
          binary_out <= {temp_binary[3],temp_binary[2],temp_binary[1],temp_binary[0]};
        end
    end
endmodule


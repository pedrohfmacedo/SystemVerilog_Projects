// Conversor de uma entrada BCD para um saída binária
module BCD_to_Binary_FSM(
    input logic clk,         // Clock de entrada
    input logic reset,       // Sinal de reset assíncrono
    input logic [3:0] bcd_in, // Entrada BCD de 4 bits
    output logic [3:0] binary_out // Saída binária de 4 bits
);
  
//Os estados da máquina
  parameter [1:0] S0 = 2'b00; // Estado inicial
  parameter [1:0] S1 = 2'b01; // Estado para converter dígito BCD para binário
  parameter [1:0] S2 = 2'b10; // Verificará se o próximo dígito BCD é zero ou não
  parameter [1:0] S3 = 2'b11; // Estado final, finaliza

  logic [1:0] next_state,current_state;
  logic [3:0] temp_binary;
  
	//next state logic
  always@(*) begin
        case (current_state)
            S0: begin
                if (bcd_in == 4'b0000)
                    next_state = S3; // Número BCD é zero, estado final
                else
                    next_state = S1; // Próximo estado para converter o BCD
            	end

            S1: begin
                if (bcd_in >= 4'b1010) // Maior ou igual a 10 em BCD
                  next_state = S3;// Valor inválido, estado final
                else if (bcd_in >= 4'b1000) // 8 ou 9 em BCD
                  temp_binary = 4'b1000; // 8 em binário
                else if (bcd_in >= 4'b0110) // 6 ou 7 em BCD
                  temp_binary = 4'b0110; // 6 em binário
              else if (bcd_in == 4'b0101) // 5 em BCD
                  temp_binary = 4'b0101; // 5 em binário
              else if (bcd_in == 4'b0100) // 4 em BCD
                  temp_binary = 4'b0100; // 4 em binário
              else if (bcd_in == 4'b0011) // 3 em BCD
                  temp_binary = 4'b0011; // 3 em binário
              else if (bcd_in == 4'b0010) // 2 em BCD
                  temp_binary = 4'b0010; // 2 em binário
              else if (bcd_in == 4'b0001) // 1 em BCD
                  temp_binary = 4'b0001; // 1 em binário
                else 
                  temp_binary = 4'b0000;  // 0 em binário
                next_state = S2; // Próximo estado para multiplicar por 10
            	end

         
            S2: begin
                if (bcd_in == 4'b0000)
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
            binary_out <= temp_binary;
        end
    end

endmodule

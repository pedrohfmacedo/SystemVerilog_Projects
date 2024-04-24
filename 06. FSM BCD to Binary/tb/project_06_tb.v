// Code your testbench here
// or browse Examples
module teste();

//variaveis para teste
logic clk,reset;
  logic [3:0] bcd_in;
  logic [3:0] binary_out;

BCD_to_Binary_FSM inst1 (clk,reset,bcd_in,binary_out);

initial
begin
  $monitor ("time = %g, Entrada em BCD =%b, Saída em Binary = %b", $time, bcd_in, binary_out);
  
  $dumpfile ("fsm_bcd_binary.vcd");
  $dumpvars(0,inst1);
end

//iniciando as variaveis
initial 
  begin
    clk =0;
    reset = 1;
  end
  
//variando o clock
always
  begin
    #1 clk = ~clk;
  end

//testando entradas
initial
  begin
    #1 reset = 0;
    #2 bcd_in = 4'b0000;
    #2 bcd_in = 4'b1111;
    #2 bcd_in = 4'b0001;
    #2 bcd_in = 4'b0101;
  end
//tempo para finalização do teste
  
initial 
  begin
    #20 $finish;
  end
endmodule

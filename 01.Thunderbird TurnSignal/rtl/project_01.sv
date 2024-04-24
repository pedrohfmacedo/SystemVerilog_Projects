// Code your design here
module t_bird_control(
		input logic clk,
  		input logic clr,
  		input logic right, left, haz, 
		output logic la, lb, lc, ra, rb, rc,
 		output logic[2:0] estado);

// Declaração dos estados
typedef enum logic [2:0] {
    idle = 3'b000,
    lr3 =  3'b001,
    r1 =   3'b010,
    r2 =   3'b011,
    r3 =   3'b100,
  	l1 =   3'b101,
  	l2 =   3'b110,
  	l3 =   3'b111
} state_s;
  
  logic [2:0] state, next_state;
  
 //Lógica de próximo estado 
  always@(*)
    begin
      case(state)
            idle:begin
              if(haz || left && right) next_state = lr3;
              else if(!haz || left || !right) next_state = l1;
              else if(!haz || !left|| right)  next_state = r1;
              else next_state = idle;
            end
            lr3:begin
               next_state = idle;
            end
            r1:begin
              if(haz) next_state = lr3;
              else next_state = r2;
            end
            r2:begin
              if(haz) next_state = lr3;
              else next_state = r3;
            end
            r3:begin
			  next_state = idle;
            end
            l1:begin
              if(haz) next_state = lr3;
              else next_state = l2;
            end
            l2:begin
              if(haz) next_state = lr3;
              else next_state = l3;
            end
            l3:begin
			  next_state = idle;
            end
              default:next_state = idle;
        endcase
  end

  //Atualização de registradores
  always@(posedge clk)begin
      	if(clr) 
        	state <= idle;
      	else 
        	state <= next_state;
    	end
 

    //Lógica de saída
	assign la = (state == l1) || (state == l2) || (state == l3);
    assign lb = (state == l2) || (state == l3);
    assign lc = (state == l3) || (state == lr3);
    assign ra = (state == r1) || (state == r2) || (state == r3);
    assign rb = (state == r1) || (state == r2);
    assign rc = (state == r3) || (state == lr3);
  
   assign estado = state;
  
endmodule

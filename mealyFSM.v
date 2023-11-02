module mealyFSM (
input      clk,
input      reset_n,
input      in,
output reg out
);
reg  Current_state; 
reg  Next_state; 
  localparam S0 = 1'b0; 
  localparam S1 = 1'b1;  
always @(posedge clk or negedge reset_n) begin
    if(!reset_n) 
		Current_state <= S0;
    else 
		Current_state <= Next_state;
end
always @(*) 
begin
	Next_state = S0; 
	case(Current_state)	
	S0: begin
			out = 1'b0;
	     if(in) Next_state = S1;
		  else   Next_state = S0;
		 end				
	S1 : 
	     if(in) begin
		  Next_state = S1;
		  out = 1'b1;
		  end else begin 
		  Next_state = S0;
		  out = 1'b0;
		 end
	endcase
end 
endmodule





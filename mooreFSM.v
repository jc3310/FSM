module mooreFSM (
input      clk,
input      reset_n,
input      in,
output reg out
);
reg [1:0] Current_state; 
reg [1:0] Next_state; 
  localparam S0 = 2'b00; 
  localparam S1 = 2'b01; 
  localparam S2 = 2'b10; 
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
	     if(in) Next_state = S1;
		  else   Next_state = S0;
		 end
				
	S1 : begin
	     if(in) Next_state = S2;
		  else   Next_state = S0;
		 end
	S2: begin
	     if(in) Next_state = S2;
		  else   Next_state = S0;
		 end
	endcase
end 
always @(*) 
begin
	out = 0;
	case(Current_state)
	S0 : out = 0;
	S1 : out = 0;
	S2 : out = 1;
	endcase
end
endmodule

module send_reset(
	input clk,
	input b0,
	input b1,
	input b2,
	input b3,
	output reg reset
	);
	
	always @(posedge clk) begin
		if(b0 | b1 | b2 | b3)
			reset <= 0;
		else
			reset <= 1;
	end
	
endmodule
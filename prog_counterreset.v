module prog_counterreset (
   input             clk,
	input             reset,
   output reg [2:0]  q
   ); 
	

	always @(posedge clk)
		if (reset)
			q <= 0;
		else if (q < 2)
			q <= q + 1;

endmodule

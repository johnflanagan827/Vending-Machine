module prog_counter100s (
   input             clk,
	input             reset,
   output reg [2:0]  q
   ); 
	

	always @(posedge clk)
		if (reset)
			q <= 0;
		else if (q < 6)
			q <= q + 1;

endmodule

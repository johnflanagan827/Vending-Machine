module regfile (
   input        clk,
   input  [3:0] rw,
   input  [3:0] ra,
   input  [3:0] rb,
   input  [9:0] din,
   output [9:0] douta,
   output [9:0] doutb,
	output [9:0] dout_r4
   );
   
   reg [9:0] reg_array [0:15];
	
	// r0: stores 1
	// r1: stores 10
	// r2: stores 100
	// r3: stores 4 (for shifting)
	// r4: stores amount paid
	
	always @(posedge clk)
		reg_array[rw] <= din;
	
	assign douta   = reg_array[ra];
	assign doutb   = reg_array[rb];
	assign dout_r4 = reg_array[4];
		
endmodule
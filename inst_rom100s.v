module inst_rom100s (
   input    [2:0]  addr,
   output   [18:0] dout
   );
	
	// r2:  stores 100
	// r3:  stores 4 (for shifting)
	// r4:  stores amount paid
	
   reg [18:0] mem [0:15];
   
   initial begin
		mem[0] = 19'h7f000; // Dummy - Write end_addr as 12
		mem[1] = 19'h72006; // Load 100 into r2
		mem[2] = 19'h73004; 
		mem[3] = 19'h52230;
		mem[4] = 19'h32230;
		mem[5] = 19'h04240; // Add 100 to r4
		mem[6] = 19'h7f000; // Dummy - Write end_addr as 12
   end
   
	assign dout = mem[addr];
	
endmodule
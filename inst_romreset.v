module inst_romreset (
   input    [2:0]  addr,
   output   [18:0] dout
   );
	
	// r1:  stores 10
	// r4:  stores amount paid

	
   reg [18:0] mem [0:15];
    
   initial begin
	
		mem[0]  = 19'h7f000; // Dummy instruction - Write end_addr as 0
		mem[1]  = 19'h74000; // Load 0 into r4 - MUST BE INITIALIZED FOR OPERATIONS WITH r4
		mem[2]  = 19'h7f000; // Dummy instruction - Write end_addr as 0
		
   end
   
	assign dout = mem[addr];
	
endmodule
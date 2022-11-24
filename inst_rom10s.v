module inst_rom10s (
   input    [2:0]  addr,
   output   [18:0] dout
   );
	
	// r1:  stores 10
	// r4:  stores amount paid

	
   reg [18:0] mem [0:15];
    
   initial begin
	
		mem[0]  = 19'h7f000; // Dummy - Write end_addr as 6
		mem[1]  = 19'h7100a; // Load 10 into r1
		mem[2]  = 19'h04140; // Add 10 to r4
		mem[3]  = 19'h7f000; // Dummy - Write end_addr as 6
		
   end
   
	assign dout = mem[addr];
	
endmodule
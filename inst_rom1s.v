module inst_rom1s (
   input    [2:0]  addr,
   output   [18:0] dout
   );
	
	// r0:  stores 1
	// r4:  stores amount paid
	
	
   reg [18:0] mem [0:15];
    
   initial begin
	
		mem[0]  = 19'h7f000; // Dummy 
      mem[1]  = 19'h70001; // Load 1 into r0
		mem[2]  = 19'h04040; // Add 1 to r4
		mem[3]  = 19'h7f000; // Dummy - Write end_addr as 3
		
   end
   
	assign dout = mem[addr];
	
endmodule
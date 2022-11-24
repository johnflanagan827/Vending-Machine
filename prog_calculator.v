module prog_calculator (
   input        clk,
   input        reset,
	input  [2:0] rom_num,
	output [9:0] paid
   );
   
	wire [2:0]  pc0;
	wire [18:0] inst0;
	
	wire [2:0]  pc1;
	wire [18:0] inst1;
	
	wire [2:0]  pc2;
	wire [18:0] inst2;
	
	wire [2:0]  pc3;
	wire [18:0] inst3;
	
	reg  [18:0] result_inst;
	
	// PC and ROM for 'add one' function
	prog_counter10s prog_counter_0 (
      .clk        (clk),
      .reset      (reset),
      .q          (pc0)
   );
	
   inst_rom1s rom_0 (
      .addr    (pc0),
      .dout    (inst0)
   );
	
	// PC and ROM for 'add ten' function
	prog_counter10s prog_counter_1 (
      .clk        (clk),
      .reset      (reset),
      .q          (pc1)
   );
	
   inst_rom10s rom_1 (
      .addr    (pc1),
      .dout    (inst1)
   );
	
	// PC and ROM for 'add hundred' function
	prog_counter100s prog_counter_2 (
      .clk        (clk),
      .reset      (reset),
      .q          (pc2)
   );
	
   inst_rom100s rom_2 (
      .addr    (pc2),
      .dout    (inst2)
   );
	
	// PC and ROM for 'reset' function
	prog_counterreset prog_counter_3 (
      .clk        (clk),
      .reset      (reset),
      .q          (pc3)
   );
	
   inst_romreset rom_3 (
      .addr    (pc3),
      .dout    (inst3)
   );
	
	always @(*) begin
	
		if (rom_num == 0)
			result_inst = inst0;
		else if (rom_num == 1)
			result_inst = inst1;
		else if (rom_num == 2)
			result_inst = inst2;
		else if (rom_num == 3)
			result_inst = inst3;
		else
			result_inst = 19'h7f000;
			
	end		
	
   
   calculator calculator_0 (
      .clk     (clk),
      .op      (result_inst[18:16]),
      .rw      (result_inst[15:12]),
      .ra      (result_inst[11:8] ),
      .rb      (result_inst[7:4]  ),
      .imm4    (result_inst[3:0]  ),
		.paid    (paid)
   );
	
endmodule
   
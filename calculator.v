module calculator (
   input        clk,
   input  [2:0] op,
   input  [3:0] rw,
   input  [3:0] ra,
   input  [3:0] rb,
   input  [3:0] imm4,
	output [9:0] paid
   );

	wire [9:0] a0;
	wire [9:0] b0;
	wire [9:0] y0;
	
   regfile regfile_0 (
      .clk     (clk),
      .ra      (ra),
      .rb      (rb),
      .din     (y0),
      .rw      (rw),
      .douta   (a0),
      .doutb   (b0),
		.dout_r4 (paid)
   );
   
   alu alu_0 (
      .a       (a0),
      .b       (b0),
      .imm4    (imm4),
      .op      (op),
      .y       (y0)
   );
   
endmodule

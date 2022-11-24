module alu (
   input       [9:0] a,
   input       [9:0] b,
   input       [3:0] imm4,
   input       [2:0] op,
   output reg  [9:0] y
   );
   
   always @(*)
		case (op)
			0: y = a + b; 
			1: y = a - b;
			2: y = a & b;
			3: y = a | b;
			4: y = ~a;
			5: y = a << b;
			6: y = a >> b;
			7: y = {6'b0, imm4};
		endcase

endmodule

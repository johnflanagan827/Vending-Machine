module key_addr(
	input            b0,
	input            b1,
	input            b2,
	input            b3,
	output reg [3:0] start_addr,
	output reg [3:0] end_addr,
	output reg       reset
	);
	
	initial begin
		start_addr = 0;
		end_addr = 0;
		reset = 1;
	end
	
	always @(*) begin
		if (b1) begin
			start_addr = 5;
			end_addr = 6;
			reset = 1;
		end
	
		else if (b0) begin
			start_addr = 2;
			end_addr = 3; 
			reset = 1;
		end
	
		else if (b2) begin
			start_addr = 8;
			end_addr = 12;
			reset = 1;
		end
		
		else if (b3) begin
			start_addr = 0;
			end_addr = 0;
			reset = 1;
		end
		
		else
			start_addr = 13;
			end_addr = 0;
			reset = 0;
	end
	
endmodule
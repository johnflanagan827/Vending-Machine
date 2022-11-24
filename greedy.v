module greedy (
	input clk,
	input reset,
	input [9:0] change,
	output reg [3:0] quarters,
	output reg [3:0] dimes,
	output reg [3:0] nickels,
	output reg [3:0] pennies
	);
	
	reg [9:0] current_change;
	
	initial begin
		current_change = 0;
		quarters = 0;
		dimes = 0;
		nickels = 0;
		pennies = 0;
	end
	
	always @(posedge clk) begin
		
		if (~reset) begin
			current_change = 0;
			quarters = 0;
			dimes = 0;
			nickels = 0;
			pennies = 0;
		end 
		
		if(change[9] == 0) begin
			if (current_change + 25 <= change) begin
				current_change <= current_change + 10'd25;
				quarters <= quarters + 1'b1;
			end
			else if (current_change + 10 <= change) begin
				current_change <= current_change + 10'd10;
				dimes <= dimes + 1'b1;
			end
			else if (current_change + 5 <= change) begin
				current_change <= current_change + 10'd5;
				nickels <= nickels + 1'b1;
			end
			else if (current_change + 1 <= change) begin
				current_change <= current_change + 10'd1;
				pennies <= pennies + 1'b1;
			end
		end
		else begin
			quarters = 0;
			dimes = 0;
			nickels = 0;
			pennies = 0;
		end
	end
	
endmodule

module prices(
	input s0,
	input s1,
	input s2,
	input s3,
	output [9:0] p
	);
	
	reg [9:0] doritos;
	reg [9:0] milky_way;
	reg [9:0] coke;
	reg [9:0] chex_mix;
	
	always @(s0)
		if (s0)
			doritos = 200;
		else
			doritos = 0;
	
	always @(s1)
		if (s1) 
			 milky_way = 75;
		else
			milky_way = 0;
	
	always @(s2)
		if (s2) 
			coke = 99;
		else
			coke = 0;
	
	always @(s3)
		if (s3) 
			chex_mix = 125;
		else
			chex_mix = 0;	
		
	assign p = doritos + milky_way + coke + chex_mix;

endmodule
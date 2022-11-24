module key_to_rom(
	input            b0,
	input            b1,
	input            b2,
	input            b3,
	output reg [2:0] rom_num
	);

	always @(*) begin
	
		if(b3)      // execute the 'reset' ROM
			rom_num = 3; 
		else if(b2) // execute the 'add hundred' ROM
			rom_num = 2;
		else if(b1) // execute the 'add ten' ROM
			rom_num = 1;
		else if(b0) // execute the 'add one' ROM
			rom_num = 0;
		else        // do nothing
			rom_num = 4;
			
	end

endmodule
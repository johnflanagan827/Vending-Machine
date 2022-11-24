module bin_to_bcd(
    input [9:0] bin,
    output reg [15:0] bcd
    );

    integer i;
    
    always @(bin)
		begin
			bcd = 0;
         for (i = 0; i < 10; i = i + 1) 
				begin
					bcd = {bcd[14:0],bin[9-i]};      
               if(i < 9 && bcd[3:0] >= 5)
						bcd[3:0] = bcd[3:0] + 4'd3;
               if(i < 9 && bcd[7:4] >= 5)
						bcd[7:4] = bcd[7:4] + 4'd3;
               if(i < 9 && bcd[11:8] >= 5)
						bcd[11:8] = bcd[11:8] + 4'd3;
					if(i < 9 && bcd[15:12] >= 5)
						bcd[15:12] = bcd[15:12] + 4'd3;
				end
      end

endmodule
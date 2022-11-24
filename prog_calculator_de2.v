module prog_calculator_de2 (
   input  [3:0] KEY, 
	input  [3:0] SW,
   output [6:0] LEDG,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5,
	output [6:0] HEX6,
	output [6:0] HEX7,
	
	input        CLOCK_50,
	output       LCD_ON,
	output       LCD_BLON,
	output       LCD_RW,
	output       LCD_EN,
	output       LCD_RS,
	inout  [7:0] LCD_DATA
   );
	
   wire        key0_db;
	wire        key1_db;
	wire        key2_db;
	wire        key3_db;
	
	wire [2:0]  rom_num;
	
   wire        reset;
   wire [9:0]  paid;
	wire [9:0]  owed;
   wire [9:0]  change;
	
	wire [15:0] paid_BCD;
	wire [15:0] owed_BCD;
	
   wire [4:0]  lcd_index;
   wire [7:0]  lcd_char;
	
	wire [3:0]  quarters;
	wire [3:0]  dimes;
	wire [3:0]  nickels;
	wire [3:0]  pennies;
   
   assign LEDG[0] = ~KEY[0];
	assign LEDG[2] = ~KEY[1];
	assign LEDG[4] = ~KEY[2];
	assign LEDG[6] = ~KEY[3];
	
	assign change = paid - owed;
	
   debounce debounce_0 (
      .CLOCK_50   (CLOCK_50  ),
      .in         (~KEY[0]	  ),
      .out        (key0_db   )
   );
	
	debounce debounce_1(
		.CLOCK_50   (CLOCK_50  ),
      .in         (~KEY[1]	  ),
      .out        (key1_db   )
   );
	debounce debounce_2(
		.CLOCK_50   (CLOCK_50  ),
      .in         (~KEY[2]	  ),
      .out        (key2_db   )
   );
	debounce debounce_3(
		.CLOCK_50   (CLOCK_50  ),
      .in         (~KEY[3]	  ),
      .out        (key3_db   )
   );
	
	send_reset(
		.clk   (CLOCK_50),
		.b0    (key0_db),
		.b1    (key1_db),
		.b2    (key2_db),
		.b3    (key3_db),
		.reset (reset)
	);
	
	key_to_rom(
		.b0      (key0_db),
		.b1      (key1_db),
		.b2      (key2_db),
		.b3      (key3_db),
		.rom_num (rom_num)
	);
   
   prog_calculator prog_calculator_0 (
      .clk        (CLOCK_50  ),
      .reset      (reset     ),
		.rom_num    (rom_num   ),
      .paid       (paid      )
   );
	
	prices prices_0(
		.s0 (SW[0]),
		.s1 (SW[1]),
		.s2 (SW[2]),
		.s3 (SW[3]),
		.p  (owed)
	);
	
	bin_to_bcd bin_to_bcd_0(
		.bin (owed),
		.bcd (owed_BCD)
	);
	
	bin_to_bcd bin_to_bcd_1(
		.bin (paid),
		.bcd (paid_BCD)
	);

	greedy greedy_0(
		.clk      (CLOCK_50),
		.reset    (reset),
		.change   (change),
		.quarters (quarters),
		.dimes    (dimes),
		.nickels  (nickels),
		.pennies  (pennies)
	);
	
	assign HEX0 = 7'b0001100;
	
	hexdigit h1(
		.in(pennies),
		.out(HEX1)
	);
	
	assign HEX2 = 7'b0101011;
	
	hexdigit h3(
		.in(nickels),
		.out(HEX3)
	);
	
	assign HEX4 = 7'b0100001;
	
	hexdigit h5(
		.in(dimes),
		.out(HEX5)
	);
	
	assign HEX6 = 7'b0011000;
	
	hexdigit h7(
		.in(quarters),
		.out(HEX7)
	);
	
   LCD_msg_table LCD_msg_table_0 (
      .price_owed (owed_BCD     ),
		.price_paid (paid_BCD     ),
      .lcd_index  (lcd_index    ),
      .lcd_char   (lcd_char     )
   );
   
   LCD_Controller LCD_Controller_0 (
      .lcd_char   (lcd_char ),
      .lcd_index  (lcd_index),
      .CLOCK_50   (CLOCK_50 ),
      .LCD_ON     (LCD_ON   ),	
      .LCD_BLON   (LCD_BLON ),
      .LCD_RW     (LCD_RW   ),	
      .LCD_EN     (LCD_EN   ),	
      .LCD_RS     (LCD_RS   ),	
      .LCD_DATA   (LCD_DATA )	
	);
   
endmodule

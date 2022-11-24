module LCD_msg_table (
   input       [15:0]	price_owed,
	input			[15:0]	price_paid,
   input       [4:0]  	lcd_index,
   output reg  [7:0]		lcd_char
   );
   
   always @(*)
      case (lcd_index)
         0:  lcd_char = "p";
         1:  lcd_char = "r";
         2:  lcd_char = "i";
         3:  lcd_char = "c";
         4:  lcd_char = "e";
			
         6:  lcd_char = "o";
         7:  lcd_char = "w";
         8:  lcd_char = "e";
         9:  lcd_char = "d";
         10: lcd_char = "=";
         11: lcd_char = {4'b0, price_owed[15:12]};
         12: lcd_char = {4'b0, price_owed[11:8]};
			13:  lcd_char = ".";
         14: lcd_char = {4'b0, price_owed[7:4]}; 
			15: lcd_char = {4'b0, price_owed[3:0]};
         
         
         16:  lcd_char = "p";
         17:  lcd_char = "r";
         18:  lcd_char = "i";
         19:  lcd_char = "c";
         20:  lcd_char = "e";
			
         22:  lcd_char = "p";
         23:  lcd_char = "a";
         24:  lcd_char = "i";
         25:  lcd_char = "d";
         26:  lcd_char = "=";
         27: lcd_char = {4'b0, price_paid[15:12]};
         28: lcd_char = {4'b0, price_paid[11:8]};
			29:  lcd_char = ".";
         30: lcd_char = {4'b0, price_paid[7:4]}; 
			31: lcd_char = {4'b0, price_paid[3:0]};
         
         default: lcd_char = " ";
      endcase        
endmodule

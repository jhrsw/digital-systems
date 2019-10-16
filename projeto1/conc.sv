module conc(input a[9:0], b[9:0], output s[14:0]);
	
	assign s = {a[6:0], b[7:0]};
	
endmodule
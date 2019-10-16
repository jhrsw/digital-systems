module conc(input [9:0] a, b, output [14:0] s);
	
	assign s = {a[6:0], b[7:0]};
	
endmodule
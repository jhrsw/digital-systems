module janela(input [9:0] h, v, output s);

	reg jan;

	always @(h, v)
		begin
			if(h < 256 & v < 128)
				jan = 1;
			else
				jan = 0;
		end
		
	assign s = jan;
endmodule
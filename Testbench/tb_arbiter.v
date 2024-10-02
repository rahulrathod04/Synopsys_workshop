module tb_arbiter();
	reg 	clk, 
		rst_n;
	reg 	[3:0] req;
	wire 	[3:0] grant;

	round_robin_arbiter DUT(.clk(clk), .rst_n(rst_n), .req(req), .grant(grant));

	initial
	begin
		clk 	    = 1'b0;
		rst_n 	    = 1'b0;
		req 	    = 4'b0000;
		#10 rst_n   = 1'b1;
		#50 req     = 4'b1000;
		#50 req     = 4'b1100;
		#50 req     = 4'b1110;
		#50 req     = 4'b1111;
		#500 $finish;
	end
	
	always #5 clk = ~clk;

	initial 
	begin
		$vcdpluson();
	end
endmodule


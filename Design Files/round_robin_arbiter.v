module round_robin_arbiter (
    input clk,
    input i_rst_n,
    input [3:0] i_req,     
    output reg [3:0] o_grant     
);
    reg [3:0] shift_reg;       

    always @(posedge clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            shift_reg <= 4'b0001;  
            o_grant <= 4'b0000;
        end else begin
            o_grant <= 4'b0000;
            if (i_req & shift_reg)
                o_grant <= shift_reg;
	    else
		o_grant <= 4'b0000; 

	    if (i_req)
           	 shift_reg <= {shift_reg[2:0], shift_reg[3]};
	    else 
		 shift_reg <= 4'b0001;
        end
    end
endmodule


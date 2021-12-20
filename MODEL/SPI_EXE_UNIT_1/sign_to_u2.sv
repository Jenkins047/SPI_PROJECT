module sign_to_u2(i_data, o_u2);

	parameter LEN=8;
	input logic [LEN-1:0] i_data;
	output logic [LEN-1:0] o_u2;

	always @(*)
	begin
		o_u2 = '0;
		if(i_data[LEN-1])
		begin
			o_u2 = ~({1'b0, i_data[LEN - 2:0]}) + 1'b1;
		end		
		else
			o_u2 = i_data;
	end

endmodule

module u2tosign_module(i_data, o_res);

	parameter LEN = 3;
	input logic [LEN-1:0] i_data;
	output logic [LEN-1:0] o_res;
	
	always @(*)
	begin
		o_res = '0;
		if(i_data[LEN-1])
		begin
			o_res = ~i_data + 1'd1;
			o_res[LEN-1] = 1'd1;
		end
		else
			o_res = i_data;
	end

endmodule

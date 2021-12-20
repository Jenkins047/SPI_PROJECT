module zero_counter(i_data, o_amountOfZeroes);
	parameter I_LEN = 8;
	input logic [I_LEN-1:0] i_data;
	output logic [$clog2(I_LEN)-1:0] o_amountOfZeroes;
	logic [$clog2(I_LEN)-1:0] s_zero;
	
	always @(*)
	begin
		s_zero = '0;
		for(int j = 0; j < I_LEN; j++)
		begin : LOOP
			if(~i_data[j])
				s_zero++;
		end
		o_amountOfZeroes = s_zero;
	end
endmodule



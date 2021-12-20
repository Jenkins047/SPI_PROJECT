module exe_unit(i_argA, i_argB, i_oper, o_result, o_SF, o_OF, o_NF, o_BF, o_err);
	parameter N=4, M=9;
	input logic [M-1:0] i_argA, i_argB;
	input logic [N-1:0] i_oper;
	output logic [M-1:0] o_result;
	output logic o_SF, o_OF, o_NF, o_BF;
	
	logic [2:0] s_crc4;
	logic [2:0] s_crc4_chk;
	logic [$clog2(M)-1:0] s_onehot;
	logic [$clog2(M):0] s_z1;
	logic [M-1:0] signModule;
	logic [M-1:0] U2;
	logic [$clog2(M)-1:0] encode;
	logic [M-1:0] s_ones;
	output logic o_err;
	
	zero_counter #(.I_LEN(2*M)) z1(.i_data({i_argA, i_argB}), .o_amountOfZeroes(s_z1));
	
	u2tosign_module #(.LEN(M)) u2_1(.i_data(i_argA), .o_res(signModule));
	
	sign_to_u2 #(.LEN(M)) sign1(.i_data(i_argA), .o_u2(U2));
	
	priority_encoder #(.LEN(M)) pEncoder(.i_data(i_argA), .o_y(encode));
	
	onehot2nkb_encoder #(.LEN(M)) onehot(.i_onehot(i_argA), .o_nkb(s_onehot), .o_err(o_err));
	
	crc_eval #(.WCODE(M), .WPOLY(4))
	crc4(.i_data(i_argA), 
		.i_poly(i_argB[3:0]), 
		.i_crc(3'b0),
		.o_crc(s_crc4));
		
	crc_eval #(.WCODE(M), .WPOLY(4))
	crc4_chck(.i_data(i_argA),
		  .i_poly(i_argB[3:0]),
		  .i_crc(i_argB[M-1:M-4]),
		  .o_crc(s_crc4_chk));
		  
	always @(*)
	begin

		s_ones = '0;
		o_result = '0;
		case(i_oper)
			4'd0: o_result = i_argA - i_argB;
			4'd1: o_result = i_argA ^ i_argB;
			4'd2: o_result = ~(i_argA & i_argB);
			4'd3: o_result = i_argA << i_argB;
			4'd4: o_result = i_argA >> i_argB;
			4'd5: o_result[2:0] = s_crc4;
			4'd6: o_result[2:0] = s_crc4_chk;
			4'd7: o_result[2:0] = s_onehot;
			4'd8: o_result[$clog2(M):0] = s_z1;
			4'd9: o_result = signModule;
			4'd10: o_result = U2;
			4'd11: o_result[$clog2(M)-1:0] = encode;
			default o_result = '0;
		endcase
		
		o_SF = o_result[M-1];
		if(o_result == '1)
			o_OF = '1;
		else
			o_OF = '0;

		for(int i = 0; i < M;i++)
		begin
			if(o_result[i] == 1'b1)
				s_ones++;
		end


		if(s_ones == 1)
			o_BF = 1'b1;
		else
			o_BF = 1'b0;

		if(s_ones % 2)
			o_NF = '0;
		else
			o_NF = '1;
			
	end
	
endmodule

module n_to_onehot(i_a, o_one_hot, o_vf);
    parameter M = 8;

    input logic  [M-1:0] i_a;
    output logic [M-1:0]  o_one_hot;
    output logic o_vf;

    always_comb
    begin
    {o_vf, o_one_hot} = '0;
    o_one_hot = '0;
        for (int i=0; i < M; i++)
            if ((i + 1) == i_a)
                o_one_hot[i] = 1'b1;
        if (i_a >= M)
            o_vf = 1'b1;
    end

endmodule
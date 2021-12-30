module thermometer_encoder(i_a, o_thermo, o_vf);

    parameter M = 8;

    input  logic [M-1:0] i_a;
    output logic [M-1:0]  o_thermo;
    output logic o_vf;

    always_comb
    begin
        {o_vf, o_thermo} = '0;

        for (int i=0; i < M; i++)
        begin: LOOP
            if ((i_a - 1) >= i)
                o_thermo[i] = 1'b1;
        end: LOOP
        if (i_a > M)
            o_vf = 1'b1;
    end
endmodule
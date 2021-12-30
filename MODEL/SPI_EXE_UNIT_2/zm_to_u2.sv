module zm_to_u2(i_a, o_out);

    parameter M = 8;

    input logic [M-1:0] i_a;
    output logic [M-1:0] o_out;

    always @(*)
    begin
        o_out = '0;

        if (i_a[M-1] === 0)
            o_out = i_a;

        if (i_a[M-1] === 1)
        begin
            o_out = ~({1'b0, i_a[M-2:0]}) + 1'b1;
        end
    end
endmodule
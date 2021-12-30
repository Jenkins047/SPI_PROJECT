module adder(  i_a, i_b, o_sum, o_cout);
    parameter M = 8;
    input  logic [M-1:0] i_a, i_b;
    output logic [M-1:0] o_sum;
    output logic o_cout;

    always_comb
    begin

        {o_cout, o_sum} = i_a + i_b;

    end
endmodule
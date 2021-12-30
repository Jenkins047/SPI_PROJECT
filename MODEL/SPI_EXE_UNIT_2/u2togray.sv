module u2togray (i_a, o_gray);

    parameter M = 8;
    input logic [M-1:0] i_a;
    output logic [M-1:0] o_gray;

    always_comb 
    begin
        o_gray  = i_a ^ (i_a >> 1);
    end
endmodule


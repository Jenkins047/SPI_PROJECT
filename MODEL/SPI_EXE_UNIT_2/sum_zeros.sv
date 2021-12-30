module sumzeros(i_a, i_b, o_zeros);

    parameter M = 8;

    input logic [M-1:0] i_a, i_b;
    output logic [M-1:0] o_zeros;
    
    always @(*)
    begin
        o_zeros = '0;
        for (int i=0; i < 8; i++)
        begin : LOOP
            if(i_a[i] == 1'b0)
                o_zeros++;
            if(i_b[i] == 1'b0)
                o_zeros++;
        end : LOOP
    end
endmodule
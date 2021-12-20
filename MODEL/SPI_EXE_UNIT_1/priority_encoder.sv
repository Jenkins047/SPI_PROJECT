module priority_encoder(i_data, o_y);
    parameter LEN = 8;
    input logic [LEN-1:0] i_data;
    output logic [$clog2(LEN) - 1:0] o_y;
    logic s_stop;
    always @(*)
    begin
        s_stop = 1'd0;
        o_y = '1;
        for(int i = LEN - 1; i >= 0; i--)
        begin
            if(i_data[i] == 1'd0 && !s_stop)
                o_y = o_y - 1'd1;
            else
                s_stop = '1;
        end
    
    end

endmodule

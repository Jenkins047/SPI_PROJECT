module spi_exe_unit_1 (i_rst, i_sclk, i_mosi, o_miso, i_cs);
parameter BITS = 20;
localparam M = 8;
localparam N = 4;
input logic i_rst, i_sclk, i_mosi, i_cs;
output logic o_miso;

logic [M-1:0] s_argA_next, s_argA;
logic [M-1:0] s_argB_next, s_argB;
logic [N-1:0] s_oper_next, s_oper;
logic [M-1:0] s_result_next, s_result;
logic [N-1:0] s_flags_next, s_flags;

exe_unit #(.N(4), .M(8)) exe1 (.i_argA(s_argA_next),
                               .i_argB(s_argB_next),
                               .i_oper(s_oper_next),
                               .o_result(s_result_next),
                               .o_SF(s_flags_next[0]),
                               .o_OF(s_flags_next[1]),
                               .o_NF(s_flags_next[2]),
                               .o_BF(s_flags_next[3])
                               );

shifter #(.N(BITS)) shift_in (.i_clk_p(i_sclk),
                               .i_rst_n(i_rst),
                               .i_bit(i_mosi),
                               .i_en(s_en),
                               .i_wrt(s_wrt_in),
                               .o_data({s_argA_next,
                                        s_argB_next,
                                        s_oper_next}));

shifter #(.N(BITS)) shift_out (.i_clk_p(i_sclk),
                               .i_rst_n(i_rst),
                               .i_data({s_result, s_flags}),
                               .i_en(s_en),
                               .i_wrt(s_wrt_out),
                               .o_bit(o_miso));


localparam STATE_NUMBER = 5;
localparam STATE_READY = 0, STATE_TRANSFER = 1, STATE_LOAD = 2;
logic [$clog2(STATE_NUMBER)-1:0] s_state, s_state_next;
logic s_en, s_wrt_in, s_wrt_out;

always @(*)
begin
    case(s_state)
        STATE_READY:
        begin
            if(!i_cs)
            begin
                s_state_next = STATE_TRANSFER;
            end
        end

        STATE_TRANSFER:
        begin
            s_en = '1;
            s_wrt_in = '0;
            s_wrt_out = '0;
            if(i_cs)
                s_state_next = STATE_LOAD;
        end

        STATE_LOAD:
        begin
            s_en = '1;
            s_wrt_out = '1;
            s_state_next = STATE_READY;
        end
    endcase
end

//FSM
always @(posedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_state <= STATE_READY;
 else
     s_state_next <= s_state_next;
end

//i_argA
always @(posedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_argA <= 0;
 else
     s_argA <= s_argA_next;
end

//i_argB
always @(posedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_argB <= 0;
 else
     s_argB <= s_argB_next;
end

//i_oper
always @(posedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_oper <= 0;
 else
     s_oper <= s_oper_next;
end

//o_result
always @(posedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_result <= 0;
 else
     s_result <= s_result_next;
end

//flags
always @(posedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_flags <= 0;
 else
     s_flags <= s_flags_next;
end

endmodule
module spi_exe_unit_1 (i_rst, i_sclk, i_mosi, o_miso, i_cs);
parameter BITS = 20;
localparam M = 8;
localparam N = 4;
input logic i_rst, i_sclk, i_mosi, i_cs;
output logic o_miso;

logic [M-1:0] s_argA, s_argB, s_result;
logic [N-1:0] s_oper;
logic [3:0] s_flags;
logic [M-1:0] s_argA_next, s_argB_next, s_result_next;
logic [N-1:0] s_oper_next;
logic [3:0] s_flags_next;
logic [M-1:0] s_data_next;
logic [3:0] s_cycles;
logic s_we, s_inter;
logic argA_enable, argB_enable, oper_enable;

exe_unit #(.N(N), .M(M)) exe1 (
                               .i_argA(s_argA),
                               .i_argB(s_argB),
                               .i_oper(s_oper),
                               .o_result(s_result_next),
                               .o_SF(s_flags_next[0]),
                               .o_OF(s_flags_next[1]),
                               .o_NF(s_flags_next[2]),
                               .o_BF(s_flags_next[3])
                               );

logic s_en_in, s_wrt_in;
shifter #(.N(M)) shift_in (
                               .i_clk_p(i_sclk),
                               .i_rst_n(i_rst),
                               .i_bit(i_mosi),
                               .i_en(s_en_in),
                               .i_wrt(s_wrt_in),
                               .o_data(s_data_next)
                             );

logic s_en_out, s_wrt_out;
shifter #(.N(M+N)) shift_out (   
                               .i_clk_p(i_sclk),
                               .i_rst_n(i_rst),
                               .i_data({s_result, s_flags}),
                               .i_en(s_en_out),
                               .i_wrt(s_wrt_out),
                               .o_bit(o_miso)
                            );

watchdog #(.N(4)) w1 (
                        .i_clk_p(i_sclk),
                        .i_rst_n(i_rst),
                        .i_cycles(s_cycles),
                        .i_we(s_we),
                        .o_inter(s_inter)
                        );

localparam STATE_NUMBER = 4;
localparam [$clog2(STATE_NUMBER)-1:0] STATE_READY = 0, LOAD_A = 1, LOAD_B = 2, LOAD_OPER = 3;
logic [$clog2(STATE_NUMBER)-1:0] s_state, s_state_next;

always @(*)
begin
    {s_en_in, s_en_out} = '0;
    {s_wrt_in, s_wrt_out} = '0;
    {argA_enable, argB_enable, oper_enable} = '0;
    s_we = '0;
    s_state_next = s_state;
    s_cycles = '0;
    s_argA_next = '0;
    s_argB_next = '0;
    s_oper_next = '0;
    //s_result_next = '0;
    //s_flags_next = '0;

    case(s_state)
        STATE_READY:
        begin
            if(!i_cs)
            begin
                s_we = '1;
                s_cycles = M;
                s_state_next = LOAD_A;
            end
        end

        LOAD_A:
        begin
            s_en_in = '1;
            if(s_inter)
            begin
                argA_enable = '1;
                s_argA_next = s_data_next;
                s_we = '1;
                s_cycles = M;
                s_state_next = LOAD_B;
            end
        end

        LOAD_B:
        begin
            if(s_inter)
            begin
                argB_enable = '1;
                s_argB_next = s_data_next;
                s_we = '1;
                s_cycles = N;
                s_state_next = LOAD_OPER;
            end
        end

        LOAD_OPER:
        begin
            if(s_inter)
            begin
                oper_enable = '1;
                s_oper_next = s_data_next;
                s_state_next = STATE_READY;
            end
        end

    endcase
end

always @(posedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_state <= STATE_READY;
 else
     s_state <= s_state_next;
end

always @(posedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_argA <= '0;
 else
 if(argA_enable)
     s_argA <= s_argA_next;
end

always @(posedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_argB <= '0;
 else
 if(argB_enable)
     s_argB <= s_argB_next;
end

always @(posedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_oper <= '0;
 else
  if(oper_enable)
     s_oper <= s_oper_next;
end

always @(posedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_result <= '0;
 else
     s_result <= s_result_next;
end

always @(posedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_flags <= '0;
 else
     s_flags <= s_flags_next;
end

endmodule
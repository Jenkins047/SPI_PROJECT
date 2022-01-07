/* Generated by Yosys 0.12+54 (git sha1 59a715034, gcc 9.3.0-17ubuntu1~20.04 -fPIC -Os) */

module spi_exe_unit_3_rtl(i_rst, i_sclk, i_mosi, o_miso, i_cs);
  wire [4:0] _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  input i_cs;
  input i_mosi;
  input i_rst;
  input i_sclk;
  output o_miso;
  reg s_bit;
  wire s_bit_next;
  wire s_transfer;
  wire \shift_out.i_bit ;
  wire \shift_out.i_clk_p ;
  wire [4:0] \shift_out.i_data ;
  wire \shift_out.i_en ;
  wire \shift_out.i_rst_n ;
  wire \shift_out.i_wrt ;
  wire \shift_out.o_bit ;
  wire [4:0] \shift_out.o_data ;
  reg [4:0] \shift_out.s_shifter ;
  assign s_transfer = ~i_cs;
  assign o_miso = s_bit & s_transfer;
  always @(negedge i_sclk, negedge i_rst)
    if (!i_rst) s_bit <= 1'h0;
    else s_bit <= s_bit_next;
  assign _01_ = ~\shift_out.i_wrt ;
  assign _02_ = \shift_out.i_data [0] & \shift_out.i_wrt ;
  assign _03_ = \shift_out.i_bit  & _01_;
  assign _00_[0] = _02_ | _03_;
  assign _04_ = \shift_out.i_wrt  & \shift_out.i_data [1];
  assign _05_ = _01_ & \shift_out.s_shifter [0];
  assign _00_[1] = _04_ | _05_;
  assign _06_ = \shift_out.i_wrt  & \shift_out.i_data [2];
  assign _07_ = _01_ & \shift_out.s_shifter [1];
  assign _00_[2] = _06_ | _07_;
  assign _08_ = \shift_out.i_wrt  & \shift_out.i_data [3];
  assign _09_ = _01_ & \shift_out.s_shifter [2];
  assign _00_[3] = _08_ | _09_;
  assign _10_ = \shift_out.i_wrt  & \shift_out.i_data [4];
  assign _11_ = _01_ & \shift_out.s_shifter [3];
  assign _00_[4] = _10_ | _11_;
  always @(posedge \shift_out.i_clk_p , negedge \shift_out.i_rst_n )
    if (!\shift_out.i_rst_n ) \shift_out.s_shifter [0] <= 1'h0;
    else if (\shift_out.i_en ) \shift_out.s_shifter [0] <= _00_[0];
  always @(posedge \shift_out.i_clk_p , negedge \shift_out.i_rst_n )
    if (!\shift_out.i_rst_n ) \shift_out.s_shifter [1] <= 1'h0;
    else if (\shift_out.i_en ) \shift_out.s_shifter [1] <= _00_[1];
  always @(posedge \shift_out.i_clk_p , negedge \shift_out.i_rst_n )
    if (!\shift_out.i_rst_n ) \shift_out.s_shifter [2] <= 1'h0;
    else if (\shift_out.i_en ) \shift_out.s_shifter [2] <= _00_[2];
  always @(posedge \shift_out.i_clk_p , negedge \shift_out.i_rst_n )
    if (!\shift_out.i_rst_n ) \shift_out.s_shifter [3] <= 1'h0;
    else if (\shift_out.i_en ) \shift_out.s_shifter [3] <= _00_[3];
  always @(posedge \shift_out.i_clk_p , negedge \shift_out.i_rst_n )
    if (!\shift_out.i_rst_n ) \shift_out.s_shifter [4] <= 1'h0;
    else if (\shift_out.i_en ) \shift_out.s_shifter [4] <= _00_[4];
  assign \shift_out.o_bit  = \shift_out.s_shifter [4];
  assign \shift_out.o_data  = \shift_out.s_shifter ;
  assign \shift_out.i_bit  = i_mosi;
  assign \shift_out.i_clk_p  = i_sclk;
  assign \shift_out.i_data  = 5'h00;
  assign \shift_out.i_en  = s_transfer;
  assign \shift_out.i_rst_n  = i_rst;
  assign \shift_out.i_wrt  = 1'h0;
  assign s_bit_next = \shift_out.o_bit ;
endmodule

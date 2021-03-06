/* Generated by Yosys 0.10.0 (git sha1 UNKNOWN, gcc 10.3.0-1ubuntu1 -fPIC -Os) */

module \$paramod$0f84a70ebc21543b73842bcb7d89a48776b55cdb\crc_eval (i_data, i_poly, i_crc, o_crc);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire [10:0] crc_tmp;
  wire [31:0] i;
  input [2:0] i_crc;
  input [7:0] i_data;
  input [3:0] i_poly;
  output [2:0] o_crc;
  wire [2:0] poly_tmp;
  assign _00_ = i_poly[0] & i_data[0];
  assign o_crc[0] = i_crc[0] ^ _00_;
  assign _01_ = i_data[0] & i_poly[1];
  assign _02_ = i_poly[0] & i_data[1];
  assign _03_ = i_crc[1] ^ _02_;
  assign o_crc[1] = _01_ ^ _03_;
  assign _04_ = i_data[1] & i_poly[1];
  assign _05_ = i_crc[2] ^ _04_;
  assign _06_ = i_poly[0] & i_data[2];
  assign _07_ = i_data[0] & i_poly[2];
  assign _08_ = _06_ ^ _07_;
  assign o_crc[2] = _05_ ^ _08_;
  assign crc_tmp = { 8'hxx, o_crc };
  assign i = 32'd4294967295;
  assign poly_tmp = i_poly[3:1];
endmodule

module \$paramod\adder\M=s32'00000000000000000000000000001000 (i_a, i_b, o_sum, o_cout);
  wire _00_;
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
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  wire _29_;
  input [7:0] i_a;
  input [7:0] i_b;
  output o_cout;
  output [7:0] o_sum;
  assign _00_ = i_a[0] & i_b[0];
  assign _01_ = i_a[1] & i_b[1];
  assign _02_ = i_a[1] ^ i_b[1];
  assign _03_ = _00_ & _02_;
  assign o_sum[1] = _00_ ^ _02_;
  assign _04_ = _01_ | _03_;
  assign _05_ = i_a[2] & i_b[2];
  assign _06_ = i_a[2] ^ i_b[2];
  assign _07_ = _04_ & _06_;
  assign o_sum[2] = _04_ ^ _06_;
  assign _08_ = _05_ | _07_;
  assign _09_ = i_a[3] & i_b[3];
  assign _10_ = i_a[3] | i_b[3];
  assign _11_ = i_a[3] ^ i_b[3];
  assign o_sum[3] = _08_ ^ _11_;
  assign _12_ = i_a[4] & i_b[4];
  assign _13_ = i_a[4] ^ i_b[4];
  assign _14_ = _08_ & _10_;
  assign _15_ = _09_ | _14_;
  assign _16_ = _13_ & _15_;
  assign o_sum[4] = _13_ ^ _15_;
  assign _17_ = _12_ | _16_;
  assign _18_ = i_a[5] & i_b[5];
  assign _19_ = i_a[5] ^ i_b[5];
  assign _20_ = _17_ & _19_;
  assign o_sum[5] = _17_ ^ _19_;
  assign _21_ = _18_ | _20_;
  assign _22_ = i_a[6] & i_b[6];
  assign _23_ = i_a[6] ^ i_b[6];
  assign _24_ = _21_ & _23_;
  assign o_sum[6] = _21_ ^ _23_;
  assign _25_ = _22_ | _24_;
  assign _26_ = i_a[7] & i_b[7];
  assign _27_ = i_a[7] | i_b[7];
  assign _28_ = i_a[7] ^ i_b[7];
  assign o_sum[7] = _25_ ^ _28_;
  assign o_sum[0] = i_a[0] ^ i_b[0];
  assign _29_ = _25_ & _27_;
  assign o_cout = _26_ | _29_;
endmodule

module \$paramod\n_to_onehot\M=s32'00000000000000000000000000001000 (i_a, o_one_hot, o_vf);
  wire _00_;
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
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  input [7:0] i_a;
  output [7:0] o_one_hot;
  output o_vf;
  assign _00_ = ~i_a[3];
  assign _01_ = ~i_a[2];
  assign _02_ = ~i_a[1];
  assign _03_ = ~i_a[0];
  assign _04_ = i_a[7] | i_a[6];
  assign _05_ = ~_04_;
  assign _06_ = i_a[5] | i_a[4];
  assign _07_ = ~_06_;
  assign _08_ = _05_ & _07_;
  assign _09_ = _02_ & _03_;
  assign _10_ = i_a[3] & _01_;
  assign _11_ = _09_ & _10_;
  assign o_one_hot[7] = _08_ & _11_;
  assign _12_ = _00_ & _08_;
  assign o_vf = ~_12_;
  assign _13_ = _02_ & i_a[0];
  assign _14_ = _01_ & _12_;
  assign o_one_hot[0] = _13_ & _14_;
  assign _15_ = i_a[1] & _03_;
  assign o_one_hot[1] = _14_ & _15_;
  assign _16_ = i_a[1] & i_a[0];
  assign o_one_hot[2] = _14_ & _16_;
  assign _17_ = i_a[2] & _12_;
  assign o_one_hot[3] = _09_ & _17_;
  assign o_one_hot[4] = _13_ & _17_;
  assign o_one_hot[5] = _15_ & _17_;
  assign o_one_hot[6] = _16_ & _17_;
endmodule

module \$paramod\sumzeros\M=s32'00000000000000000000000000001000 (i_a, i_b, o_zeros);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  input [7:0] i_a;
  input [7:0] i_b;
  output [7:0] o_zeros;
  assign _044_ = ~i_b[3];
  assign _045_ = ~i_a[3];
  assign _046_ = ~i_b[1];
  assign _047_ = ~i_b[2];
  assign _048_ = ~i_a[4];
  assign _049_ = ~i_b[4];
  assign _050_ = ~i_a[5];
  assign _051_ = ~i_a[6];
  assign _052_ = ~i_a[7];
  assign _053_ = i_b[0] | i_a[0];
  assign _054_ = i_a[1] | _053_;
  assign _055_ = ~_054_;
  assign _056_ = i_b[0] & i_a[0];
  assign _057_ = i_a[1] & _056_;
  assign _058_ = ~_057_;
  assign _059_ = i_a[1] & _053_;
  assign _060_ = _056_ | _059_;
  assign _061_ = _055_ | _060_;
  assign _062_ = _058_ & _061_;
  assign _063_ = ~_062_;
  assign _064_ = i_b[1] | _063_;
  assign _065_ = i_b[1] & _063_;
  assign _066_ = _046_ ^ _062_;
  assign _067_ = i_a[2] | _065_;
  assign _068_ = _064_ & _067_;
  assign _069_ = i_a[2] ^ _066_;
  assign _070_ = i_b[2] | _069_;
  assign _071_ = _047_ ^ _069_;
  assign _072_ = i_a[3] | _071_;
  assign _073_ = _045_ ^ _071_;
  assign _074_ = i_b[3] | _073_;
  assign _075_ = ~_074_;
  assign _076_ = _044_ ^ _073_;
  assign _077_ = i_a[4] | _076_;
  assign _078_ = _048_ ^ _076_;
  assign _079_ = i_b[4] | _078_;
  assign _080_ = _049_ ^ _078_;
  assign _081_ = i_a[5] | _080_;
  assign _082_ = _050_ ^ _080_;
  assign _083_ = i_b[5] | _082_;
  assign _084_ = ~_083_;
  assign _085_ = i_b[5] ^ _082_;
  assign _086_ = ~_085_;
  assign _087_ = _051_ & _085_;
  assign _088_ = i_a[6] | _086_;
  assign _089_ = i_a[6] ^ _085_;
  assign _090_ = i_b[6] | _089_;
  assign _091_ = ~_090_;
  assign _092_ = i_b[6] ^ _089_;
  assign _093_ = _052_ & _092_;
  assign _094_ = ~_093_;
  assign _095_ = i_a[7] ^ _092_;
  assign _096_ = i_b[7] | _095_;
  assign o_zeros[0] = i_b[7] ^ _095_;
  assign _097_ = _060_ & _068_;
  assign _098_ = _060_ | _068_;
  assign _099_ = _060_ ^ _068_;
  assign _100_ = _070_ & _072_;
  assign _101_ = _098_ & _100_;
  assign _102_ = _099_ ^ _100_;
  assign _103_ = _074_ | _102_;
  assign _104_ = _074_ ^ _102_;
  assign _105_ = _075_ ^ _102_;
  assign _106_ = _077_ | _105_;
  assign _107_ = ~_106_;
  assign _108_ = _079_ | _105_;
  assign _109_ = _079_ ^ _104_;
  assign _110_ = _077_ & _109_;
  assign _111_ = _107_ | _110_;
  assign _112_ = _081_ | _111_;
  assign _113_ = ~_112_;
  assign _114_ = _083_ | _111_;
  assign _115_ = _084_ ^ _111_;
  assign _116_ = _081_ & _115_;
  assign _000_ = _113_ | _116_;
  assign _001_ = _088_ | _000_;
  assign _002_ = ~_001_;
  assign _003_ = _090_ | _000_;
  assign _004_ = _090_ ^ _000_;
  assign _005_ = _091_ ^ _000_;
  assign _006_ = _088_ & _005_;
  assign _007_ = _087_ | _004_;
  assign _008_ = _001_ & _007_;
  assign _009_ = _002_ | _006_;
  assign _010_ = _093_ & _008_;
  assign _011_ = _094_ | _009_;
  assign _012_ = _096_ | _009_;
  assign _013_ = ~_012_;
  assign _014_ = _096_ ^ _009_;
  assign _015_ = _093_ | _014_;
  assign o_zeros[1] = _011_ & _015_;
  assign _016_ = _097_ | _101_;
  assign _017_ = ~_016_;
  assign _018_ = _103_ | _016_;
  assign _019_ = _103_ ^ _017_;
  assign _020_ = ~_019_;
  assign _021_ = _106_ & _108_;
  assign _022_ = _019_ | _021_;
  assign _023_ = _020_ ^ _021_;
  assign _024_ = _112_ | _023_;
  assign _025_ = _112_ ^ _023_;
  assign _026_ = _113_ ^ _023_;
  assign _027_ = _114_ | _026_;
  assign _028_ = _114_ ^ _025_;
  assign _029_ = ~_028_;
  assign _030_ = _001_ | _028_;
  assign _031_ = _001_ ^ _029_;
  assign _032_ = _003_ | _031_;
  assign _033_ = _003_ ^ _031_;
  assign _034_ = _010_ & _033_;
  assign _035_ = _010_ ^ _033_;
  assign _036_ = _013_ & _035_;
  assign o_zeros[2] = _013_ ^ _035_;
  assign _037_ = _018_ & _022_;
  assign _038_ = _024_ & _037_;
  assign _039_ = _027_ & _038_;
  assign _040_ = _030_ & _039_;
  assign _041_ = _032_ & _040_;
  assign _042_ = ~_041_;
  assign _043_ = _034_ | _042_;
  assign o_zeros[4] = _036_ & _043_;
  assign o_zeros[3] = _036_ ^ _043_;
  assign o_zeros[7:5] = 3'h0;
endmodule

module \$paramod\thermometer_encoder\M=s32'00000000000000000000000000001000 (i_a, o_thermo, o_vf);
  wire _00_;
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
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  input [7:0] i_a;
  output [7:0] o_thermo;
  output o_vf;
  assign _00_ = ~i_a[3];
  assign _01_ = ~i_a[2];
  assign _02_ = ~i_a[0];
  assign _03_ = ~i_a[1];
  assign _04_ = i_a[0] & i_a[1];
  assign _05_ = _02_ & _03_;
  assign _06_ = i_a[0] | i_a[1];
  assign _07_ = i_a[2] & _06_;
  assign _08_ = _00_ & _07_;
  assign _09_ = _01_ & _05_;
  assign _10_ = i_a[2] | _06_;
  assign _11_ = i_a[3] & _09_;
  assign _12_ = i_a[3] & _10_;
  assign _13_ = _08_ | _11_;
  assign _14_ = _04_ & _13_;
  assign _15_ = i_a[7] | i_a[6];
  assign _16_ = i_a[5] | i_a[4];
  assign _17_ = _15_ | _16_;
  assign _18_ = ~_17_;
  assign _19_ = _09_ | _17_;
  assign o_thermo[7] = i_a[3] | _19_;
  assign o_thermo[6] = _14_ | o_thermo[7];
  assign _20_ = i_a[3] | i_a[2];
  assign _21_ = _02_ & _08_;
  assign o_thermo[5] = o_thermo[6] | _21_;
  assign _22_ = i_a[0] & _03_;
  assign _23_ = _02_ | i_a[1];
  assign _24_ = _18_ & _22_;
  assign _25_ = _17_ | _23_;
  assign _26_ = _13_ & _24_;
  assign o_thermo[4] = o_thermo[5] | _26_;
  assign _27_ = _05_ | _20_;
  assign o_thermo[3] = _17_ | _27_;
  assign o_thermo[2] = _04_ | o_thermo[3];
  assign o_thermo[1] = _20_ | _25_;
  assign o_vf = _12_ | _17_;
  assign o_thermo[0] = 1'h1;
endmodule

module \$paramod\u2togray\M=s32'00000000000000000000000000001000 (i_a, o_gray);
  input [7:0] i_a;
  output [7:0] o_gray;
  assign o_gray[0] = i_a[1] ^ i_a[0];
  assign o_gray[1] = i_a[1] ^ i_a[2];
  assign o_gray[2] = i_a[2] ^ i_a[3];
  assign o_gray[3] = i_a[3] ^ i_a[4];
  assign o_gray[4] = i_a[4] ^ i_a[5];
  assign o_gray[5] = i_a[5] ^ i_a[6];
  assign o_gray[6] = i_a[6] ^ i_a[7];
  assign o_gray[7] = i_a[7];
endmodule

module \$paramod\zm_to_u2\M=s32'00000000000000000000000000001000 (i_a, o_out);
  wire _00_;
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
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  input [7:0] i_a;
  output [7:0] o_out;
  assign _00_ = ~i_a[7];
  assign _01_ = _00_ & i_a[1];
  assign _02_ = i_a[0] & i_a[1];
  assign _03_ = ~_02_;
  assign _04_ = i_a[0] | i_a[1];
  assign _05_ = i_a[7] & _04_;
  assign _06_ = _03_ & _05_;
  assign o_out[1] = _01_ | _06_;
  assign o_out[2] = i_a[2] ^ _05_;
  assign _07_ = i_a[2] | _04_;
  assign _08_ = i_a[7] & _07_;
  assign o_out[3] = i_a[3] ^ _08_;
  assign _09_ = i_a[3] | _07_;
  assign _10_ = i_a[7] & _09_;
  assign o_out[4] = i_a[4] ^ _10_;
  assign _11_ = i_a[4] | _09_;
  assign _12_ = i_a[7] & _11_;
  assign o_out[5] = i_a[5] ^ _12_;
  assign _13_ = i_a[5] | _11_;
  assign _14_ = i_a[7] & _13_;
  assign o_out[6] = i_a[6] ^ _14_;
  assign _15_ = i_a[7] & i_a[6];
  assign o_out[7] = _14_ | _15_;
  assign o_out[0] = i_a[0];
endmodule

module exe_unit_rtl_2(i_oper, i_argA, i_argB, o_result, o_OF, o_SF, o_BF, o_VF);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  wire _179_;
  wire _180_;
  wire _181_;
  wire _182_;
  wire _183_;
  wire _184_;
  wire _185_;
  wire _186_;
  wire _187_;
  wire _188_;
  wire _189_;
  wire _190_;
  wire _191_;
  wire _192_;
  wire _193_;
  wire _194_;
  wire _195_;
  wire _196_;
  wire _197_;
  wire _198_;
  wire _199_;
  wire _200_;
  wire _201_;
  wire _202_;
  wire _203_;
  wire _204_;
  wire _205_;
  wire _206_;
  wire _207_;
  wire _208_;
  wire _209_;
  wire _210_;
  wire _211_;
  wire _212_;
  wire _213_;
  wire _214_;
  wire _215_;
  wire _216_;
  wire _217_;
  wire _218_;
  wire _219_;
  wire _220_;
  wire _221_;
  wire _222_;
  wire _223_;
  wire _224_;
  wire _225_;
  wire _226_;
  wire _227_;
  wire _228_;
  wire _229_;
  wire _230_;
  wire _231_;
  wire _232_;
  wire _233_;
  wire _234_;
  wire _235_;
  wire _236_;
  wire _237_;
  wire _238_;
  wire _239_;
  wire _240_;
  wire _241_;
  wire _242_;
  wire _243_;
  wire _244_;
  wire _245_;
  wire _246_;
  wire _247_;
  wire _248_;
  wire _249_;
  wire _250_;
  wire _251_;
  wire _252_;
  wire _253_;
  wire _254_;
  wire _255_;
  wire _256_;
  input [7:0] i_argA;
  input [7:0] i_argB;
  input [3:0] i_oper;
  output o_BF;
  output o_OF;
  output o_SF;
  output o_VF;
  wire o_VFa;
  wire o_VFn;
  wire o_VFt;
  wire [7:0] o_adder;
  wire [2:0] o_crc4;
  wire [7:0] o_onehot;
  output [7:0] o_result;
  wire [7:0] o_sum_zeros;
  wire [7:0] o_thermometer;
  wire [7:0] o_u2togray;
  wire [7:0] o_zm_to_u2;
  wire [31:0] s_jedynki;
  assign _243_ = ~i_oper[1];
  assign _244_ = ~i_oper[0];
  assign _245_ = ~i_oper[2];
  assign _246_ = ~i_oper[3];
  assign _247_ = ~o_onehot[0];
  assign _248_ = ~i_argB[0];
  assign _249_ = ~o_adder[0];
  assign _250_ = ~o_thermometer[1];
  assign _251_ = ~o_sum_zeros[1];
  assign _252_ = ~o_crc4[1];
  assign _253_ = ~o_zm_to_u2[1];
  assign _254_ = ~i_argA[2];
  assign _255_ = ~o_adder[1];
  assign _256_ = ~i_argA[3];
  assign _000_ = ~i_argA[4];
  assign _001_ = ~i_argA[5];
  assign _002_ = ~i_argA[6];
  assign _003_ = ~i_argA[7];
  assign _004_ = _245_ & i_oper[3];
  assign _005_ = i_oper[2] | _246_;
  assign _006_ = _243_ & i_oper[0];
  assign _007_ = i_oper[1] | _244_;
  assign _008_ = _004_ & _006_;
  assign _009_ = _005_ | _007_;
  assign _010_ = o_thermometer[0] & _008_;
  assign _011_ = i_oper[2] & _246_;
  assign _012_ = _245_ | i_oper[3];
  assign _013_ = i_oper[1] & _244_;
  assign _014_ = _243_ | i_oper[0];
  assign _015_ = _011_ & _013_;
  assign _016_ = _012_ | _014_;
  assign _017_ = o_zm_to_u2[0] & _015_;
  assign _018_ = _010_ | _017_;
  assign _019_ = _243_ & _244_;
  assign _020_ = i_oper[1] | i_oper[0];
  assign _021_ = _004_ & _019_;
  assign _022_ = _005_ | _020_;
  assign _023_ = o_sum_zeros[0] & _021_;
  assign _024_ = _245_ & _246_;
  assign _025_ = i_oper[2] | i_oper[3];
  assign _026_ = _019_ & _024_;
  assign _027_ = _020_ | _025_;
  assign _028_ = _249_ | _027_;
  assign _029_ = i_oper[1] & i_oper[0];
  assign _030_ = _243_ | _244_;
  assign _031_ = _024_ & _029_;
  assign _032_ = _025_ | _030_;
  assign _033_ = i_argA[1] & _031_;
  assign _034_ = _006_ & _011_;
  assign _035_ = o_u2togray[0] & _034_;
  assign _036_ = _033_ | _035_;
  assign _037_ = ~_036_;
  assign _038_ = _006_ & _024_;
  assign _039_ = _007_ | _025_;
  assign _040_ = i_argB[0] ^ i_argA[0];
  assign _041_ = _248_ ^ i_argA[0];
  assign _042_ = _039_ | _041_;
  assign _043_ = _004_ & _013_;
  assign _044_ = _005_ | _014_;
  assign _045_ = _247_ | _044_;
  assign _046_ = _011_ & _029_;
  assign _047_ = _012_ | _030_;
  assign _048_ = o_crc4[0] & _046_;
  assign _049_ = _013_ & _024_;
  assign _050_ = _014_ | _025_;
  assign _051_ = _040_ | _050_;
  assign _052_ = _023_ | _048_;
  assign _053_ = _018_ | _052_;
  assign _054_ = ~_053_;
  assign _055_ = _028_ & _045_;
  assign _056_ = _042_ & _051_;
  assign _057_ = _055_ & _056_;
  assign _058_ = _037_ & _057_;
  assign _059_ = _054_ & _058_;
  assign o_result[0] = ~_059_;
  assign _060_ = o_u2togray[1] & _034_;
  assign _061_ = o_onehot[1] & _043_;
  assign _062_ = _255_ | _027_;
  assign _063_ = _011_ & _019_;
  assign _064_ = i_argA[0] & _063_;
  assign _065_ = ~_064_;
  assign _066_ = _254_ | _032_;
  assign _067_ = _253_ | _016_;
  assign _068_ = i_argA[1] ^ i_argB[1];
  assign _069_ = ~_068_;
  assign _070_ = _049_ & _069_;
  assign _071_ = _252_ | _047_;
  assign _072_ = _251_ | _022_;
  assign _073_ = _071_ & _072_;
  assign _074_ = _038_ & _068_;
  assign _075_ = _250_ | _009_;
  assign _076_ = _066_ & _067_;
  assign _077_ = _065_ & _076_;
  assign _078_ = _060_ | _061_;
  assign _079_ = ~_078_;
  assign _080_ = _077_ & _079_;
  assign _081_ = _070_ | _074_;
  assign _082_ = ~_081_;
  assign _083_ = _062_ & _075_;
  assign _084_ = _073_ & _083_;
  assign _085_ = _082_ & _084_;
  assign _086_ = _080_ & _085_;
  assign o_result[1] = ~_086_;
  assign _087_ = o_adder[2] & _026_;
  assign _088_ = o_onehot[2] & _043_;
  assign _089_ = o_u2togray[2] & _034_;
  assign _090_ = i_argA[3] & _031_;
  assign _091_ = i_argA[2] ^ i_argB[2];
  assign _092_ = _254_ ^ i_argB[2];
  assign _093_ = _038_ & _091_;
  assign _094_ = _049_ & _092_;
  assign _095_ = o_crc4[2] & _046_;
  assign _096_ = o_sum_zeros[2] & _021_;
  assign _097_ = o_zm_to_u2[2] & _015_;
  assign _098_ = o_thermometer[2] & _008_;
  assign _099_ = i_argA[1] & _063_;
  assign _100_ = _096_ | _098_;
  assign _101_ = _090_ | _100_;
  assign _102_ = _087_ | _101_;
  assign _103_ = _093_ | _095_;
  assign _104_ = _089_ | _103_;
  assign _105_ = _088_ | _094_;
  assign _106_ = _097_ | _099_;
  assign _107_ = _105_ | _106_;
  assign _108_ = _104_ | _107_;
  assign o_result[2] = _102_ | _108_;
  assign _109_ = ~o_result[2];
  assign _110_ = i_argA[4] & _031_;
  assign _111_ = i_argA[2] & _063_;
  assign _112_ = o_sum_zeros[3] & _021_;
  assign _113_ = o_adder[3] & _026_;
  assign _114_ = o_onehot[3] & _043_;
  assign _115_ = o_zm_to_u2[3] & _015_;
  assign _116_ = _256_ ^ i_argB[3];
  assign _117_ = i_argA[3] ^ i_argB[3];
  assign _118_ = _038_ & _117_;
  assign _119_ = _049_ & _116_;
  assign _120_ = _118_ | _119_;
  assign _121_ = o_thermometer[3] & _008_;
  assign _122_ = o_u2togray[3] & _034_;
  assign _123_ = _110_ | _121_;
  assign _124_ = _112_ | _123_;
  assign _125_ = _120_ | _124_;
  assign _126_ = _111_ | _122_;
  assign _127_ = _113_ | _115_;
  assign _128_ = _114_ | _127_;
  assign _129_ = _126_ | _128_;
  assign o_result[3] = _125_ | _129_;
  assign _130_ = ~o_result[3];
  assign _131_ = i_argA[4] ^ i_argB[4];
  assign _132_ = _000_ ^ i_argB[4];
  assign _133_ = _038_ & _131_;
  assign _134_ = _049_ & _132_;
  assign _135_ = i_argA[3] & _063_;
  assign _136_ = o_onehot[4] & _043_;
  assign _137_ = o_zm_to_u2[4] & _015_;
  assign _138_ = i_argA[5] & _031_;
  assign _139_ = _137_ | _138_;
  assign _140_ = o_adder[4] & _026_;
  assign _141_ = o_sum_zeros[4] & _021_;
  assign _142_ = _140_ | _141_;
  assign _143_ = o_thermometer[4] & _008_;
  assign _144_ = o_u2togray[4] & _034_;
  assign _145_ = _133_ | _143_;
  assign _146_ = _135_ | _145_;
  assign _147_ = _142_ | _146_;
  assign _148_ = _134_ | _144_;
  assign _149_ = _136_ | _139_;
  assign _150_ = _148_ | _149_;
  assign o_result[4] = _147_ | _150_;
  assign _151_ = ~o_result[4];
  assign _152_ = i_argA[5] ^ i_argB[5];
  assign _153_ = _001_ ^ i_argB[5];
  assign _154_ = _038_ & _152_;
  assign _155_ = _049_ & _153_;
  assign _156_ = i_argA[4] & _063_;
  assign _157_ = o_adder[5] & _026_;
  assign _158_ = o_zm_to_u2[5] & _015_;
  assign _159_ = i_argA[6] & _031_;
  assign _160_ = _158_ | _159_;
  assign _161_ = o_thermometer[5] & _008_;
  assign _162_ = o_onehot[5] & _043_;
  assign _163_ = o_sum_zeros[5] & _021_;
  assign _164_ = o_u2togray[5] & _034_;
  assign _165_ = _154_ | _161_;
  assign _166_ = _156_ | _165_;
  assign _167_ = _162_ | _163_;
  assign _168_ = _166_ | _167_;
  assign _169_ = _155_ | _164_;
  assign _170_ = _157_ | _160_;
  assign _171_ = _169_ | _170_;
  assign o_result[5] = _168_ | _171_;
  assign _172_ = ~o_result[5];
  assign _173_ = i_argA[6] ^ i_argB[6];
  assign _174_ = _002_ ^ i_argB[6];
  assign _175_ = _038_ & _173_;
  assign _176_ = _049_ & _174_;
  assign _177_ = _175_ | _176_;
  assign _178_ = i_argA[5] & _063_;
  assign _179_ = o_adder[6] & _026_;
  assign _180_ = o_u2togray[6] & _034_;
  assign _181_ = o_sum_zeros[6] & _021_;
  assign _182_ = _180_ | _181_;
  assign _183_ = i_argA[7] & _031_;
  assign _184_ = o_onehot[6] & _043_;
  assign _185_ = o_thermometer[6] & _008_;
  assign _186_ = o_zm_to_u2[6] & _015_;
  assign _187_ = _183_ | _185_;
  assign _188_ = _178_ | _187_;
  assign _189_ = _177_ | _188_;
  assign _190_ = _179_ | _186_;
  assign _191_ = _184_ | _190_;
  assign _192_ = _182_ | _191_;
  assign o_result[6] = _189_ | _192_;
  assign _193_ = o_thermometer[7] & _008_;
  assign _194_ = o_onehot[7] & _043_;
  assign _195_ = _193_ | _194_;
  assign _196_ = i_argA[7] ^ i_argB[7];
  assign _197_ = _003_ ^ i_argB[7];
  assign _198_ = _049_ & _197_;
  assign _199_ = o_u2togray[7] & _034_;
  assign _200_ = i_argA[6] & _063_;
  assign _201_ = _199_ | _200_;
  assign _202_ = o_zm_to_u2[7] & _015_;
  assign _203_ = o_adder[7] & _026_;
  assign _204_ = _038_ & _196_;
  assign _205_ = o_sum_zeros[7] & _021_;
  assign _206_ = _198_ | _204_;
  assign _207_ = _201_ | _202_;
  assign _208_ = _203_ | _205_;
  assign _209_ = _206_ | _208_;
  assign _210_ = _207_ | _209_;
  assign o_SF = _195_ | _210_;
  assign _211_ = o_result[2] & o_result[3];
  assign _212_ = o_result[4] & o_result[5];
  assign _213_ = _211_ & _212_;
  assign _214_ = o_result[0] & o_result[1];
  assign _215_ = _059_ | _086_;
  assign _216_ = o_result[6] & o_SF;
  assign _217_ = _214_ & _216_;
  assign o_OF = _213_ & _217_;
  assign _218_ = _059_ & _086_;
  assign _219_ = _109_ | _218_;
  assign _220_ = _059_ ^ _086_;
  assign _221_ = _109_ ^ _220_;
  assign _222_ = _130_ | _221_;
  assign _223_ = o_result[3] ^ _221_;
  assign _224_ = _151_ | _223_;
  assign _225_ = o_result[4] ^ _223_;
  assign _226_ = _172_ | _225_;
  assign _227_ = _172_ ^ _225_;
  assign _228_ = o_result[5] ^ _225_;
  assign _229_ = o_result[6] | o_SF;
  assign _230_ = ~_229_;
  assign _231_ = o_result[6] ^ o_SF;
  assign _232_ = _227_ | _231_;
  assign _233_ = _228_ | _230_;
  assign _234_ = _215_ & _219_;
  assign _235_ = _222_ & _234_;
  assign _236_ = _224_ & _235_;
  assign _237_ = _226_ & _236_;
  assign _238_ = _232_ & _237_;
  assign o_BF = _233_ & _238_;
  assign _239_ = o_VFt & _008_;
  assign _240_ = o_VFa & _026_;
  assign _241_ = o_VFn & _043_;
  assign _242_ = _240_ | _241_;
  assign o_VF = _239_ | _242_;
  \$paramod\adder\M=s32'00000000000000000000000000001000  adder1 (
    .i_a(i_argA),
    .i_b(i_argB),
    .o_cout(o_VFa),
    .o_sum(o_adder)
  );
  \$paramod$0f84a70ebc21543b73842bcb7d89a48776b55cdb\crc_eval  crc4 (
    .i_crc(3'h0),
    .i_data(i_argA),
    .i_poly(i_argB[3:0]),
    .o_crc(o_crc4)
  );
  \$paramod\n_to_onehot\M=s32'00000000000000000000000000001000  n_to_onehot1 (
    .i_a(i_argA),
    .o_one_hot(o_onehot),
    .o_vf(o_VFn)
  );
  \$paramod\sumzeros\M=s32'00000000000000000000000000001000  sumzeros1 (
    .i_a(i_argA),
    .i_b(i_argB),
    .o_zeros(o_sum_zeros)
  );
  \$paramod\thermometer_encoder\M=s32'00000000000000000000000000001000  thermometer_encoder1 (
    .i_a(i_argA),
    .o_thermo(o_thermometer),
    .o_vf(o_VFt)
  );
  \$paramod\u2togray\M=s32'00000000000000000000000000001000  u2togray1 (
    .i_a(i_argA),
    .o_gray(o_u2togray)
  );
  \$paramod\zm_to_u2\M=s32'00000000000000000000000000001000  zm_to_u21 (
    .i_a(i_argA),
    .o_out(o_zm_to_u2)
  );
  assign o_result[7] = o_SF;
  assign s_jedynki[31:8] = 24'h000000;
endmodule

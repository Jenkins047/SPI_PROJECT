module exe_unit(input  logic [BITS-1:0] i_argA, input  logic [BITS-1:0] i_argB,input logic[OPER-1:0] i_oper, output logic [BITS-1:0] o_result,output logic o_PF, output logic o_ZF,    output logic o_SF,output logic o_OF);
    parameter BITS = 8;
    parameter BITS1 = 2;
    parameter OPER=4;
    parameter LEN=2* 2**BITS-1;
   
    integer g;
    integer count;
    integer count1;
    integer count2;
    integer count3;
    integer h;
integer flaga;
    logic [BITS-1:0] s_zliczanie0;
    logic [BITS-1:0]s_OnehotTobinary;
    logic [LEN-1:0]s_binaryTothermometer;
    logic [3:0]s_crc;
    logic [BITS-1:0]s_U2naGrayaa;
    logic [BITS-1:0] U1naU2a;
    logic [2:0] s_crcsprawdzenie;
   
        zliczanie0 #(.BITS(BITS))
        zliczanie0
            (.i_argA(i_argA), .i_argB(i_argB),  .o_result(s_zliczanie0));
        U2naGraya #(.BITS(BITS))
        U2naGraya
            (.i_argA(i_argA), .o_result(s_U2naGrayaa));
        U1naU2 #(.BITS(BITS))
        U1naU2
            (.i_argA(i_argA),.o_result(U1naU2a));
    
        sprawdzenieZgodnosciCrc #(.WCODE(3), .WPOLY(4))
        sprawdzenieZgodnosciCrc
            (.i_data(i_argA), .i_argB(i_argB), .o_crc(s_crcsprawdzenie));
        OnehotTobinary #(.BITS(BITS))        
        OnehotTobinary
            (.i_argA(i_argA), .i_argB(i_argB),  .o_result(s_OnehotTobinary));
        CRC4 #(.WCODE(4), .WPOLY(5))
        CRCv4
            (.i_data(i_argA),.i_poly(i_argB),.o_crc(s_crc));
            binaryTothermometer #(.BITS(BITS) )
        binaryTothermometer
            (.i_argA(i_argA),.i_argB(i_argB), .o_thermo(s_binaryTothermometer));

    always @(*)
        begin

            count=0;
            case(i_oper)
             
           4'b0000 :  o_result= i_argA + i_argB ;
             4'b0001:  o_result = i_argA | i_argB; 
             4'b0011: o_result= ~(i_argA & i_argB);
             4'b0010: o_result=(i_argA>>>1);
             4'b0110: o_result=(i_argA<<<1);
             4'b0111: o_result=s_zliczanie0;
             4'b0101:o_result=s_OnehotTobinary;
             4'b0100:o_result=s_binaryTothermometer; 
             4'b1100:o_result=s_crc;
             4'b1101:o_result=s_U2naGrayaa;
             4'b1111:o_result=U1naU2a;
             4'b1110:o_result=s_crcsprawdzenie;
             

            default :   o_result='d0;
        endcase

    o_SF=o_result[BITS-1];

 count=0;
for(g=0;g<2;g=g+1)
    if(i_argA[g]==1)
    begin
        count=count+1;
    end
    
    
    
    if(o_result=='b1)
    begin
      o_OF=1;  
    end
       else
       begin
     o_OF=0;
       end 


count2=0;

    if(o_result=='b0)
    begin
        o_ZF=1;
    end
    else
    begin
        o_ZF=0;
    end


  count3=0;
for(h=0;h<BITS;h=h+1)
begin
    if(o_result[h]==1)
    begin
         count3=count3+1;
    end
   
end
flaga=count3%2;
if(flaga!=0)
begin
    o_PF=1;
end
else
begin
    o_PF=0;
end




    end

endmodule

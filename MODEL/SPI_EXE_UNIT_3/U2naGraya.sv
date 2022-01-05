module U2naGraya(input  logic [BITS-1:0]i_argA,input  logic [BITS-1:0]i_argB,output logic [BITS-1:0]o_result);
    parameter BITS = 8;
   
    logic [BITS-1:0] s_data;
    integer i;
    always @(*)
        begin
          o_result='d0;
            if(i_argA[BITS-1]==1) //jesli najstarszy bit wejsciowy(u2)==1 ..
            begin
              o_result='d0;
            end
            else
            begin
            o_result=i_argA^(i_argA>>1);
            end
        end

        

    

endmodule

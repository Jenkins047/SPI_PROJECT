module binaryTothermometer(input  logic [BITS-1:0]i_argA,input  logic [BITS-1:0]i_argB,output logic [LEN-1:0] o_thermo);
    parameter BITS = 8;
    localparam LEN =2* 2**BITS-1;
   
    integer i;
    //logic [LEN-1:0] w_pomoc;

    always @(*)
    begin
        o_thermo = 'd0;
        for ( i=0; i < 8; i=i+1)
            if (i_argA >= i)
                o_thermo[i] = 1'b1;
    end
endmodule

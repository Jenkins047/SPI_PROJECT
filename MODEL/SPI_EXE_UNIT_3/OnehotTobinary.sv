module OnehotTobinary(input logic [BITS-1:0]i_argA,input logic [BITS-1:0]i_argB,output logic [BITS-1:0]o_result);
parameter BITS = 8;

integer i;
integer licznik=0;
integer miejsce=0;
always @(*)
    begin 
        miejsce=0;
        licznik=0;
    o_result='b0;
    for(i=0;i<BITS;i=i+1)
        begin
        if(i_argA[i]==1)
            begin
            licznik=licznik+1;
            miejsce=i;
            end
        
        end
    if(licznik==1)
        begin
        o_result=miejsce;
        end
    end
endmodule




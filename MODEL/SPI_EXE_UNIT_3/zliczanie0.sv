module zliczanie0(input  logic  [BITS-1:0] i_argA,input  logic  [BITS-1:0] i_argB, output logic  [BITS-1:0] o_result);
parameter BITS = 8;

    integer i;
    logic [15:0]w_pomoc;
    integer suma;
    always @(*)
    begin 
        suma=0;
        o_result='d0;
        w_pomoc={i_argA,i_argB};
        for(i=0;i<16;i=i+1)
        begin
            if(w_pomoc[i]==0)
            begin
                o_result=o_result+1;
            end
            else
            begin
                o_result=o_result;
            end
            
    
            
        end
     
    end
endmodule
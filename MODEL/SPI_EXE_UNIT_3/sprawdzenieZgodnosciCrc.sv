module sprawdzenieZgodnosciCrc(input logic [WCODE-1:0] i_data,output logic [WPOLY-2:0] o_crc, input logic [6:0]i_argB);
    parameter WCODE = 3;//dane    // parametry modulu
    parameter WPOLY = 4;//dzielnik crc+1
    
    
    logic [WPOLY-1:0]  s_poly;
    logic [WPOLY-2:0]  s_crc;
    
    integer i;
    // lokalny parametr - nie dostepny poza 
    localparam LEN = WCODE+WPOLY-1; // modulem crc

    logic [LEN-1:0] crc_tmp;  // sygnaly wewnetrzne
    logic [LEN-1:0] poly_tmp; //   pomocnicze 
    always @(*)
    begin
        {o_crc, crc_tmp, poly_tmp}  = 'd0;
        //i_argB={s_poly, s_crc};
        s_poly=i_argB[6:3];
        s_crc=i_argB[2:0];


        crc_tmp     = {i_data, s_crc};
        poly_tmp    = {s_poly, {(WCODE-1){1'b0}}};

        for ( i=WCODE-1; i >= 0; i=i-1)            //poczatek od najstarszego bitu, do najmlodszego
        begin 
            if (i_data[i] == 1'b1)
            begin
                crc_tmp = crc_tmp ^ poly_tmp;//jezeli 1 to xor z dzielnikiem
        
                
            end
            poly_tmp = poly_tmp >> 1;
                    
        end 
        o_crc = crc_tmp[WPOLY-2:0];
    end
endmodule

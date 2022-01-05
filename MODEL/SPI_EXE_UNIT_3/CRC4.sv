module CRC4(input logic [WCODE-1:0]i_data,  input logic [WPOLY-1:0]i_poly, output logic [WPOLY-2:0]o_crc);
    parameter WCODE = 4;//dane    // parametry modulu
    parameter WPOLY = 5;//dzielnik
    
   
     logic [WPOLY-2:0]  s_crc;//do sprawdzenia crc
    
    integer i;
    // lokalny parametr - nie dostepny poza 
    localparam LEN = WCODE+WPOLY-1; // modulem crc

    logic [LEN-1:0] crc_tmp;  // sygnaly wewnetrzne
    logic [LEN-1:0] poly_tmp; //   pomocnicze 
    always @(*)
    begin

        s_crc='d0;
        {o_crc, crc_tmp, poly_tmp}  = 'd0;

        crc_tmp     = {i_data, s_crc};//sklejona
        poly_tmp    = {i_poly, {(WCODE-1){1'b0}}};//powielanie

        for (i=WCODE-1; i >= 0; i=i-1)//poczatek od najstarszego bitu, do najmlodszego
        begin 
            if (i_data[i] == 1'b1)
                    crc_tmp = crc_tmp ^ poly_tmp;//jezeli 1 to xor z dzielnikiem
        poly_tmp = poly_tmp >> 1;
        end 
        o_crc = crc_tmp[WPOLY-2:0];
    end
endmodule

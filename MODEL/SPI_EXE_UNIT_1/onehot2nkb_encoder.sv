module onehot2nkb_encoder(i_onehot, o_nkb, o_err);
    parameter LEN = 2;
    localparam BITS = $clog2(LEN);
    input logic  [LEN-1:0] i_onehot;
    output logic [BITS-1:0] o_nkb;
// wyjscie bledu jesli wiecej niz 
// jeden bit jest ustawiony lub zaden
    output logic o_err;
// pomocniczy sygnal ustawiany
// gdy byla jedynka
    logic s_was1;
    always @(*)
    begin
        {o_nkb, o_err, s_was1}  = '0;
        for (int i=0; i < LEN; i++)
        begin : LOOP
            if (i_onehot[i] == 1'b1)
            // jesli wczesnij byla jedynka
            // znaczy ze bledne dane wejsciowe
                if (s_was1) o_err  = '1;
                else
                begin
                    s_was1 = '1;
                    o_nkb  = i[BITS-1:0];
                end
        end : LOOP
        // same zera w kodzie one-hot sa bledem
        if (!s_was1) o_err = '1;        
    end

endmodule

// module nkb2onehot_encoder(i_nkb, o_onehot);
//     parameter BITS = 2;
//     localparam LEN = 2**BITS-1;
//     input logic  [BITS-1:0] i_nkb;
//     output logic [LEN-1:0]  o_onehot;

//     always_comb
//     begin
//         o_onehot = '0;
//         for (int i=0; i < LEN; i++)
//             if (i == i_nkb)
//                 o_onehot[i] = 1'b1;
//     end

// endmodule
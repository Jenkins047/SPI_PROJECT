module exe_unit (i_oper, i_argA, i_argB, o_result, o_OF, o_SF, o_BF, o_VF);

    // Parametry M i N, ustawiłem na 8 i 4 bit odpowiednio
    
    parameter N = 4; // parametr decydujący o operacji która będzie wykonywana
    parameter M = 8; // ilość bitow wejścia i wyjścia
    
    // wejścia i wyjścia
    
    input logic [N-1:0]  i_oper; // sygnał operujący
    input logic [M-1:0]  i_argA, i_argB; // wejścia
    output logic [M-1:0] o_result; // wynik operacji
    output logic o_OF; // wynik operacji równy '1
    output logic o_SF; // wynik operacji jest liczbą ujemną
    output logic o_BF; // w wyniku jests tylko jedna jedynka
    output logic o_VF; // wynik operacji nie może pomieścić się w żadnej reprezentacji

    logic [M-1:0] o_u2togray; //konwersja u2 na kod greya
    logic [M-1:0] o_zm_to_u2;  //zmiana znak moduł na kod uzupełnień do 2
    logic [2:0]   o_crc4;             //crc4
    logic [M-1:0] o_sum_zeros; //zliczanie ilości zer w argumentach wejściowych
    logic [M-1:0] o_thermometer; //koder termometrowy
    logic [M-1:0] o_onehot;  //n to onehot
    logic [M-1:0] o_adder;
    integer s_jedynki; //zlicza ilość jedynek w o_result
    logic o_VFt; //dwie flagi przepełnienia z modułów przypisywane
    logic o_VFn; //potem do głównej flagi o_VF
    logic o_VFa;

    u2togray #(.M(8))
        u2togray1 (.i_a(i_argA), .o_gray(o_u2togray));
    zm_to_u2 #(.M(8))
        zm_to_u21 (.i_a(i_argA), .o_out(o_zm_to_u2));
    crc_eval #(.WCODE(8), .WPOLY(4))
        crc4 (.i_data(i_argA), .i_poly(i_argB[3:0]), .i_crc(3'b0), .o_crc(o_crc4));
    sumzeros #(.M(8))
        sumzeros1 (.i_a(i_argA), .i_b(i_argB), .o_zeros(o_sum_zeros));
    thermometer_encoder #(.M(8))
        thermometer_encoder1 (.i_a(i_argA), .o_thermo(o_thermometer), .o_vf(o_VFt));
    n_to_onehot #(.M(8))
        n_to_onehot1 (.i_a(i_argA), .o_one_hot(o_onehot), .o_vf(o_VFn));
    adder #(.M(8))
        adder1 (.i_a(i_argA), .i_b(i_argB), .o_sum(o_adder), .o_cout(o_VFa));
    always @(*)
    begin 

        {o_OF, o_SF, o_BF, o_VF, o_result, s_jedynki} = '0;

        case(i_oper)
        
            0:   begin
                    o_result = o_adder;
                    o_VF = o_VFa;
                end
            1:   o_result = i_argA ^ i_argB;
            2:   o_result = ~ (i_argA ^ i_argB);
            3:   o_result = i_argA >>> 1;
            4:   o_result = i_argA <<< 1;
            5:   o_result = o_u2togray;
            6:   o_result = o_zm_to_u2;
            7:   o_result[2:0] = o_crc4;
            8:   o_result = o_sum_zeros;
            9:  begin
                    o_result = o_thermometer;
                    o_VF = o_VFt;
                 end  
            10: begin
                    o_result = o_onehot;
                    o_VF = o_VFn;
                end

            default: o_result = 1'bx;
        endcase     

        o_SF = o_result[M-1];

        if(o_result == '1)
            o_OF = 1;
        else
            o_OF = 0;

        for (int i = 0; i < M; i++)
            begin
                if(o_result[i] == 1)
                s_jedynki++;
            end

        if (s_jedynki == 1)
            o_BF = 1;
        else
            o_BF = 0;

    end  
endmodule
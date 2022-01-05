select_slave = 0;
send_request = 1;

send_data = 20'b11111111000000000000;
expected_data = 0;
@(next_data);

send_data = 408912;
expected_data = 20'b11111111011100000000;
@(next_data);

send_data = 736256;
expected_data = 853248;
@(next_data);

send_data = 485104;
expected_data = 458752;
@(next_data);

send_data = 770305;
expected_data = 11273472;
@(next_data);

send_data = 889361;
expected_data = 16253184;
@(next_data);

send_data = 605457;
expected_data = 4326400;
@(next_data);

send_data = 299153;
expected_data = 4196352;
@(next_data);

send_data = 595954;
expected_data = 15598848;
@(next_data);

send_data = 1044338;
expected_data = 9044992;
@(next_data);

send_data = 482754;
expected_data = 15663360;
@(next_data);

send_data = 70338;
expected_data = 14618112;
@(next_data);

send_data = 666051;
expected_data = 1024;
@(next_data);

send_data = 258067;
expected_data = 8258560;
@(next_data);

send_data = 278563;
expected_data = 1050624;
@(next_data);

send_data = 307251;
expected_data = 5767168;
@(next_data);

send_data = 348164;
expected_data = 5571584;
@(next_data);

send_data = 61460;
expected_data = 458752;
@(next_data);

send_data = 962596;
expected_data = 3802112;
@(next_data);

send_data = 311348;
expected_data = 590848;
@(next_data);

send_data = 6615;
expected_data = 1024;
@(next_data);

send_data = 69223;
expected_data = 264192;
@(next_data);

send_data = 67031;
expected_data = 264192;
@(next_data);

send_data = 131415;
expected_data = 328704;
@(next_data);

send_data = 33832;
expected_data = 854016;
@(next_data);

send_data = 205704;
expected_data = 657408;
@(next_data);

send_data = 92904;
expected_data = 525312;
@(next_data);

send_data = 425784;
expected_data = 328704;
@(next_data);

send_data = 546809;
expected_data = 16449792;
@(next_data);

send_data = 869673;
expected_data = 11273472;
@(next_data);

send_data = 1014585;
expected_data = 8978688;
@(next_data);

send_data = 737417;
expected_data = 13370624;
@(next_data);

send_data = 194154;
expected_data = 3080192;
@(next_data);

send_data = 709754;
expected_data = 13828352;
@(next_data);

send_data = 647386;
expected_data = 14812416;
@(next_data);

send_data = 855402;
expected_data = 11534592;
@(next_data);

send_data = 316555;
expected_data = 394240;
@(next_data);

send_data = 628395;
expected_data = 458752;
@(next_data);

send_data = 344347;
expected_data = 394240;
@(next_data);

send_data = 966411;
expected_data = 458752;
@(next_data);

send_data = 535701;
expected_data = 133120;
@(next_data);

send_data = 533142;
expected_data = 1024;
@(next_data);

send_data = 75701;
expected_data = 394240;
@(next_data);

send_data = 75446;
expected_data = 1024;
@(next_data);

send_data = 834133;
expected_data = 458752;
@(next_data);

send_data = 833366;
expected_data = 1024;
@(next_data);

send_data = 221029;
expected_data = 394240;
@(next_data);

send_data = 218726;
expected_data = 28420;
@(next_data);


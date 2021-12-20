select_slave = 0;
send_request = 1;

send_data = -5;
expected_data = 0;
@(next_data);

send_data = 8;
expected_data = -5;
@(next_data);

send_data = 3;
expected_data = 8;
@(next_data);

send_data = 0;
expected_data = 3;
@(next_data);

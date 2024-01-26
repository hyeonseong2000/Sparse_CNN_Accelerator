module ReLU(data_in, data_out);
    input[19:0] data_in;
    output[7:0] data_out;
    
    assign data_out = (data_in[19] == 0)? (data_in[18] || data_in[17]|| data_in[16]) ? 8'b1111_1111 : data_in[15:8] : 0;

endmodule
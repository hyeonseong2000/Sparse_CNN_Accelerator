module buffer_mcc_router_accum (
  clk,
  reset,
  reset_data,
  reset_weight,
  data_w0,
  data_w1,
  data_i0,
  data_i1,
  write_enable_w0,
  write_enable_w1,
  write_enable_i0,
  write_enable_i1,
  act_nz_count,
  weight_nz_count,
  run_mcc,
  done,

  accum_out,

  act_size,
  filter_size
);

  input clk ,reset, reset_data, reset_weight;
  

  input[15:0] data_w0;
  input[15:0] data_w1;
  input[15:0] data_i0;
  input[15:0] data_i1;
  input write_enable_w0;
  input write_enable_w1;
  input write_enable_i0;
  input write_enable_i1;

  input[7:0] act_nz_count;
  input[7:0] weight_nz_count;
  input run_mcc;

  output done;  
  
  output[20*144 - 1 : 0 ] accum_out;

  input [4:0] act_size;
  input [2:0] filter_size;


  wire[23:0] o_data0, o_data1, o_data2, o_data3;

  wire [4:0] limit;



  assign limit = act_size - filter_size + 1 ;


  buffer_mcc u_buffermcc(
                  .clk(clk), .reset(reset), .reset_data(reset_data),.reset_weight(reset_weight),
                  .data_w0(data_w0),                  
                  .data_w1(data_w1),
                  .data_i0(data_i0),
                  .data_i1(data_i1),
                  .write_enable_w0(write_enable_w0),
                  .write_enable_w1(write_enable_w1),
                  .write_enable_i0(write_enable_i0),
                  .write_enable_i1(write_enable_i1),
                  .checked_data0(o_data0), .checked_data1(o_data1), .checked_data2(o_data2), .checked_data3(o_data3),
                  .act_nz_count(act_nz_count),
                  .weight_nz_count(weight_nz_count),
                  .run_mcc(run_mcc),
                  .done(done),
                  .limit(limit)
                  );

 
  router_accum u_router_accum(.clk(clk), .reset(reset), 
  .i_data0(o_data0), .i_data1(o_data1), .i_data2(o_data2), .i_data3(o_data3),  
  .accum_out(accum_out) );

  
endmodule
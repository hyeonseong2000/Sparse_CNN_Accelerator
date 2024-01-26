module buffer_mcc(
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
  checked_data0, checked_data1, checked_data2, checked_data3,
  act_nz_count,
  weight_nz_count,
  run_mcc,
  done,
  limit

);

  input clk, reset, reset_data, reset_weight;
  input [15:0] data_w0;
  input [15:0] data_w1;
  input [15:0] data_i0;
  input [15:0] data_i1;
  input write_enable_w0;
  input write_enable_w1;
  input write_enable_i0;
  input write_enable_i1;
  output [23:0] checked_data0, checked_data1, checked_data2, checked_data3;
  input [7:0] act_nz_count;
  input [7:0] weight_nz_count;
  input run_mcc;
  output done;
  input [4:0] limit;

  wire [15:0] w_data0, w_data1;
  wire [15:0] i_data0, i_data1;

  wire weight_read_enable;
  wire act_read_enable;
  wire[7:0] weight_address;
  wire[7:0] act_address;

  wire [7:0] real_act_nz_count;
  wire [7:0] real_weight_nz_count;

  wire [25:0] o_data0, o_data1, o_data2, o_data3 ;

  assign real_act_nz_count = (act_nz_count % 2 == 1 ) ? ((act_nz_count + 1 ) / 2) : (act_nz_count / 2) ;
  assign real_weight_nz_count = (weight_nz_count % 2 == 1 ) ? ((weight_nz_count + 1 ) / 2) : (weight_nz_count / 2) ;


  
  buffercontrol u_buffctr(
    .clk(clk), .reset(reset),
    .act_nz_count(real_act_nz_count) , .act_read_enable(act_read_enable), .d_act_address(act_address),
    .weight_nz_count(real_weight_nz_count), .weight_read_enable(weight_read_enable), .weight_address(weight_address),
    .run_mcc(run_mcc),
    .done(done)
  );


  buffer wbuff0(
    clk,
    reset_weight,
    weight_address,
    data_w0,
    write_enable_w0,
    weight_read_enable,
    w_data0
    );

  buffer wbuff1(
    clk,
    reset_weight,
    weight_address,
    data_w1,
    write_enable_w1,
    weight_read_enable,
    w_data1
    );

  buffer abuff0(
    clk,
    reset_data,
    act_address,
    data_i0,
    write_enable_i0,
    act_read_enable,
    i_data0
    );

  buffer abuff1(
    clk,
    reset_data,
    act_address,
    data_i1,
    write_enable_i1,
    act_read_enable,
    i_data1
    );

  mcc2x2 u_mcc2x2(
    clk, 
    reset, 
    i_data0, i_data1, 
    w_data0, w_data1,
    o_data0, o_data1, o_data2, o_data3

    );


      
  indexcheck u_indexcheck0(.clk(clk), .reset(reset),
                          .limit(limit),
                          .i_data(o_data0),
                          .o_data(checked_data0),
                          .accum_enable(act_read_enable)
                          );

  indexcheck u_indexcheck1(.clk(clk), .reset(reset),
                          .limit(limit), 
                          .i_data(o_data1),
                          .o_data(checked_data1),
                          .accum_enable(act_read_enable)
                          );

  indexcheck u_indexcheck2(.clk(clk), .reset(reset),
                          .limit(limit), 
                          .i_data(o_data2),
                          .o_data(checked_data2),
                          .accum_enable(act_read_enable)
                          );
                        
  indexcheck u_indexcheck3(.clk(clk), .reset(reset),
                          .limit(limit), 
                          .i_data(o_data3),
                          .o_data(checked_data3),
                          .accum_enable(act_read_enable)
                          );


endmodule
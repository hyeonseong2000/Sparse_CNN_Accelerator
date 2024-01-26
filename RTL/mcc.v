module mcc (
  clk,
  reset,
  i_data,
  w_data,
  o_data

);
  input clk, reset;
  input [15:0] i_data, w_data;
  output[25:0] o_data;
  
  wire signed [8:0] i_real_data;
  wire signed [7:0] w_real_data;
  wire [15:0] o_value;
  wire [4:0] o_x;
  wire [4:0] o_y;
  
  
  assign i_real_data = {1'b0, i_data[7:0]};
  assign w_real_data = w_data[7:0];
  assign o_value = i_real_data * w_real_data;
  
  assign o_x = i_data[15:12] - w_data[15:12];
  
  assign o_y = i_data[11:8] - w_data[11:8]; 

  assign o_data = {o_x, o_y, o_value};




endmodule
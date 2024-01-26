module mcc2x2 (
  clk, reset,


  i_data0, i_data1,
  
  
  w_data0, w_data1,
  
  
  o_data0, o_data1, o_data2, o_data3

  
  

);


  input clk, reset;
  input[15:0] i_data0, i_data1;
              

  input[15:0] w_data0, w_data1;



  output[25:0] o_data0, o_data1, o_data2, o_data3;


  // 12.02 이부분에 있던 run_mcc 신호가 들어올때만 값 출력해주는 assign 부분 없앰! 

  

  mcc u_mcc0 (.clk(clk), .reset(reset), .i_data(i_data0), .w_data(w_data0), .o_data(o_data0));
  mcc u_mcc1 (.clk(clk), .reset(reset), .i_data(i_data0), .w_data(w_data1), .o_data(o_data1));
  mcc u_mcc2 (.clk(clk), .reset(reset), .i_data(i_data1), .w_data(w_data0), .o_data(o_data2));
  mcc u_mcc3 (.clk(clk), .reset(reset), .i_data(i_data1), .w_data(w_data1), .o_data(o_data3));

 

  
endmodule
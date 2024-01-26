module indexcheck (
  clk, reset,
  limit,
  i_data,
  o_data,
  accum_enable
);

  input clk, reset;

  input [4:0] limit;

  input [25:0] i_data;

  output reg [23:0] o_data; 

  input accum_enable;

  reg d_accum_enable;
  reg d2_accum_enable;

  always @(posedge clk) begin
    if (reset) begin
      d_accum_enable <= 0;
      d2_accum_enable <= 0;
    end
    else begin
      d_accum_enable <= accum_enable;
      d2_accum_enable <= d_accum_enable;
    end
  end



  always@(posedge clk) begin
    
    if (reset) begin
      o_data <= 0;
    end

    else begin
      o_data[23:16] <= {i_data[24:21], i_data[19:16]};

      if(i_data[25:21] > limit || i_data[20:16] > limit || i_data[25] == 1 || i_data[20] == 1 ) begin
        o_data[15:0] <= 0;
      end

      else begin
        if(d_accum_enable == 0) begin
          o_data[15:0] <= 0;
        end

        else if( d_accum_enable == 1) begin
          o_data[15:0] <= i_data[15:0];
        end

      end
    end



  end



endmodule
module buffer (
  clk, reset,
  address,
  data_in,
  write_enable,
  read_enable,
  data_out
);
  input clk, reset;

  input [5:0] address;
  input [15:0] data_in;
  input write_enable;
  input read_enable;
  output reg [15:0] data_out;

  reg [15:0] memory [0:63];

  integer i;
  reg [5:0] count;
  reg switch;

  always @(posedge clk) begin
    if (reset) begin
      for (i = 0; i < 64; i = i + 1) begin
        memory[i] <= 0;
      end
        count <= 0;
        switch <= 0;
    end
    else begin
      if (write_enable && (switch == 0)) begin
        memory[count] <= data_in;
        count <= count + 1;
        switch <= 1;
      end
      else if(write_enable && (switch == 1)) begin
        switch <= switch;
        count <= count;
      end
      else begin
        switch <= 0;
      end

      if (read_enable) begin
        data_out <= memory[address];
      end
    end
  end
endmodule
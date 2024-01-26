
module accumbuf (
  clk,
  reset,
  i_val,
  o_val
);
  input clk;      
  input reset;


  input [19:0] i_val;
  output reg [19:0] o_val;


  
  always@(posedge clk)begin
    
    if (reset) begin
      o_val <= 0;
    end
    else begin
      o_val <= o_val + i_val;
    end

  
    end

 

endmodule
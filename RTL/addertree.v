module addertree (
  i_val0, i_val1, i_val2, i_val3, 
  
  sel,
  o_val
);
  
  input signed [15:0] i_val0, i_val1, i_val2, i_val3;

  input [3:0] sel;

  output signed [19:0] o_val;

  wire [15:0] m_val0, m_val1, m_val2, m_val3;
  wire [19:0] mm_val0, mm_val1, mm_val2, mm_val3;


  assign m_val0 = sel[0] ? i_val0 : 0;
  assign m_val1 = sel[1] ? i_val1 : 0;
  assign m_val2 = sel[2] ? i_val2 : 0;
  assign m_val3 = sel[3] ? i_val3 : 0;
  
  assign mm_val0 = (m_val0[15] == 1)?{4'b1111, m_val0} : {4'b0000, m_val0};
  assign mm_val1 = (m_val1[15] == 1)?{4'b1111, m_val1} : {4'b0000, m_val1};
  assign mm_val2 = (m_val2[15] == 1)?{4'b1111, m_val2} : {4'b0000, m_val2};
  assign mm_val3 = (m_val3[15] == 1)?{4'b1111, m_val3} : {4'b0000, m_val3};
  
    

  assign o_val = mm_val0 + mm_val1 + mm_val2 + mm_val3;


endmodule
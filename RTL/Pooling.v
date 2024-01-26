module Pooling(in0, in1, in2, in3, out);
    input [7 :0] in0, in1, in2, in3;
    output [7 :0] out;
    
    wire [7:0] out1, out2;
    
    comp_max com1(.in0(in0), .in1(in1), .out(out1));
    comp_max com2(.in0(in2), .in1(in3), .out(out2));
    comp_max com3(.in0(out1), .in1(out2), .out(out));
    
endmodule
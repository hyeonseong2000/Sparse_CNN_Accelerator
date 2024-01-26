module memory_access_for_index(layer, channel, dimension, address);
    input layer;
    input [3:0] channel;
    input [2:0] dimension;
    output [6:0] address;
    
    assign address = layer * 6 + channel * 6 + dimension;
    
endmodule
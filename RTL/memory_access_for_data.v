module memory_access_for_data(clk, reset, en, address);
    input clk, reset;
    input en;
    output reg [9:0] address;
    
    
    always@(posedge clk)begin
        if(reset)address <= 0;
        else if(en) address <= address + 1;
        else address <= address;
    end
    
endmodule
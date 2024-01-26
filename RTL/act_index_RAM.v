module act_index_RAM (
	clk, 
	addr, 
	ce, 
	we, 
	q, 
	d
);
    
    parameter DWIDTH = 56;
    parameter AWIDTH = 7;
    parameter MEM_SIZE = 128;
    
    input clk;
    
    input[AWIDTH-1:0] addr;
    input ce;
    input we;
    output reg[DWIDTH-1:0] q;
    input[DWIDTH-1:0] d;
   
    
    (* ram_style = "block" *)reg [DWIDTH-1:0] ram[0:MEM_SIZE-1];
    
    always @(posedge clk)  
    begin
        if(ce)begin
            if (we) ram[addr] <= d;
            else q <= ram[addr];
         end
    end

endmodule

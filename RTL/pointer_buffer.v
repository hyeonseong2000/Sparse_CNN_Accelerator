module pointer_buffer(
	clk, 
	addr0, 
	ce0, 
	we0, 
	q0, 
	d0, 
	addr1, 
	ce1, 
	we1,
	q1, 
	d1
);

    parameter DWIDTH = 8;
    parameter AWIDTH = 5;
    parameter MEM_SIZE = 17;

input clk;

input[AWIDTH-1:0] addr0;
input ce0;
input we0;
output reg[DWIDTH * MEM_SIZE-1:0] q0;
input[DWIDTH-1:0] d0;

input[AWIDTH-1:0] addr1;
input ce1;
input we1;
output reg[DWIDTH-1:0] q1;
input[DWIDTH-1:0] d1;

(* ram_style = "block" *)reg [DWIDTH-1:0] ram[0:MEM_SIZE-1];

always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram[addr0] <= d0;
		else
        	q0 <= {ram[0],ram[1],ram[2],ram[3],ram[4],ram[5],ram[6],ram[7],ram[8],ram[9],ram[10],ram[11],ram[12],ram[13],ram[14],ram[15],ram[16]};
    end
end

always @(posedge clk)  
begin 
    if (ce1) begin
        if (we1) 
            ram[addr1] <= d1;
		else
        	q1 <= ram[addr1];
    end
end

endmodule
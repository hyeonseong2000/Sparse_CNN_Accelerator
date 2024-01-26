module TOP#(
    parameter integer MEM0_DATA_WIDTH = 8,
		parameter integer MEM0_ADDR_WIDTH = 5,
		parameter integer MEM0_MEM_DEPTH  = 17,
		// (lab16)
		parameter integer MEM1_DATA_WIDTH = 12,
		parameter integer MEM1_ADDR_WIDTH = 10,
		parameter integer MEM1_MEM_DEPTH  = 1024,

    parameter integer MEM2_DATA_WIDTH = 32,
		parameter integer MEM2_ADDR_WIDTH = 4,
		parameter integer MEM2_MEM_DEPTH  = 16
    )
(clk, reset,start, finish, idle, cstate,
mem0_addr1, mem0_ce1, mem0_we1, mem0_q1, mem0_d1,
mem1_addr1, mem1_ce1, mem1_we1, mem1_q1, mem1_d1,
mem2_addr1, mem2_ce1, mem2_we1, mem2_q1, mem2_d1 );
    input clk, reset, start;
    
    output idle;
    output finish;
    output[8:0] cstate;

    // (lab12) Memory I/F
		input		[MEM0_ADDR_WIDTH-1:0] 	mem0_addr1;
		input		 						mem0_ce1;
		input		 						mem0_we1;
		output 		[MEM0_DATA_WIDTH-1:0]  	mem0_q1;
		input		[MEM0_DATA_WIDTH-1:0] 	mem0_d1;

		// (lab16) Memory I/F
		input		[MEM1_ADDR_WIDTH-1:0] 	mem1_addr1;
		input		 						mem1_ce1;
		input		 						mem1_we1;
		output 		[MEM1_DATA_WIDTH-1:0]  	mem1_q1;
		input		[MEM1_DATA_WIDTH-1:0] 	mem1_d1;

    // (lab16) Memory I/F
		input		[MEM2_ADDR_WIDTH-1:0] 	mem2_addr1;
		input		 						mem2_ce1;
		input		 						mem2_we1;
		output 		[MEM2_DATA_WIDTH-1:0]  	mem2_q1;
		input		[MEM2_DATA_WIDTH-1:0] 	mem2_d1;
    
    
    wire[22:0] control_signal;
    wire [4:0] act_size;
    wire [2:0] filter_size;
    wire reset_ram_address;
    wire reset_rom_address;
    wire reset_mcc;
    wire reset_data;
    wire layer;
    wire [3:0] channel;
    wire [2:0] dimension;
    wire load_data, first_in, write_first;    
    //control_signal : act_size , filter_size, reset_ram_address, reset_rom_address, reset_mcc, reset_data ,layer, channel, dimension, first_in, write_first, load_data
    assign act_size = control_signal[22:18];
    assign filter_size = control_signal[17:15];
    assign reset_ram_address = control_signal[14];
    assign reset_rom_address = control_signal[13];
    assign reset_mcc = control_signal[12];
    assign reset_data = control_signal[11];
    assign layer = control_signal[10];
    assign channel = control_signal[9:6];
    assign dimension = control_signal[5:3];
    assign first_in = control_signal[2];
    assign write_first = control_signal[1];
    assign load_data = control_signal[0];

    
    
    
    wire done;
    wire done_signal;
    wire done_out;
    wire run_mcc;
    wire [20*144 - 1 : 0 ] accum_out;
    wire[31:0]out_port;
    wire [8*17 - 1:0]index_pointer_first;

    
    wire[16:0] data_w0;
    wire[16:0] data_w1;
    wire[16:0] data_i0;
    wire[16:0] data_i1;
    
    wire [6:0] address_index_rom;
    wire [9:0] addr_data_rom;
        
    //weight rom
    wire [47:0] index_pointer_weight;
    wire [11:0] data_weight;
    wire [15:0] indexed_weight;
    
    //act ram
    wire [8*17-1:0] index_pointer_act;
    wire [55:0] index_pointer_act_in;
    wire [11:0] data_act;
    wire [11:0] data_act_in;
    wire [11:0] data_act_first;
    wire [15:0] indexed_act;
    wire [3 : 0] row;
    wire [7 : 0] data;
    wire [8 * 7 - 1 : 0] index_pointer;
    wire store;
    wire read_act_data;
    wire[9:0] addr_data_ram;
    
    wire done_act_in;
    wire done_weight_in;
    wire en_addr_ram;
    wire[6:0]addr_index;
    wire[9:0]read_addr_data;
    wire en_ram;
    wire reset_data_address;
    
    //nz_count
    wire[7:0] weight_nz_count;
    wire[7:0] act_nz_count;
    
    wire write_enable_w0;
    wire write_enable_w1;
    wire write_enable_i0;
    wire write_enable_i1;
    wire write_enable_weight;
    wire write_enable_act;
    
    //feature size
    wire [3:0] row_size;
    
    wire en_encoder;
    wire en_pooling;
    wire en_out;
    wire [31:0] result;
    
    
    assign en_encoder = (layer == 1)?write_first:done;
    assign en_pooling = (layer == 1)?first_in : 1'b1;
    assign en_out = (layer == 1)?reset_rom_address & reset_mcc & reset_data : 0;
    
    assign row_size = (act_size - filter_size + 1)/2 ; 
    
    assign index_pointer_act = (first_in == 1)? index_pointer_first:{index_pointer_act_in, 80'd0};
    assign data_act = (first_in == 1)? data_act_first:data_act_in;
    
    assign run_mcc = done_act_in & done_weight_in;
    assign en_addr_ram = (first_in == 1)?store : read_act_data;

    
    assign weight_nz_count = index_pointer_weight[47 - 8 * filter_size -:8];
    assign act_nz_count = index_pointer_act[8*17 - 1 - 8 * act_size -:8];
    
    
    assign done_signal = done_out | done;
    assign en_ram = (layer == 1)? read_act_data : store;
    assign reset_data_address = (layer == 1)? reset_mcc : reset_data;
    
    
    control_unit control1(.clk(clk), .reset(reset), .start(start), .done(done_signal), .run_mcc(run_mcc), .control_signal(control_signal), .finish(finish), .idle(idle), .state(cstate));
    //******************************* start ******************************************
    
    pointer_buffer pi1(.clk(clk), .addr0(0), .ce0(1), .we0(0), .q0(index_pointer_first), .d0(0), .addr1(mem0_addr1), .ce1(mem0_ce1), .we1(mem0_we1), .q1(mem0_q1), .d1(mem0_d1));
    
    
    input_buffer i1(.clk(clk), .addr0(read_addr_data), .ce0(first_in), .we0(1'b0), .q0(data_act_first), .d0(0), .addr1(mem1_addr1), .ce1(mem1_ce1), .we1(mem1_we1), .q1(mem1_q1), .d1(mem1_d1));
    
    memory_access_for_data mr2(.clk(clk), .reset(reset_ram_address), .en(read_act_data), .address(read_addr_data));        
    //******************************* act ******************************************
    act_index_RAM ar0(.clk(clk), .addr(addr_index), .ce(1'b1), .we(store), .q(index_pointer_act_in), .d(index_pointer));
    memory_access_for_index mr1(.layer(1'b0), .channel(4'b0000), .dimension(dimension), .address(addr_index));
    
    act_data_RAM ar1(.clk(clk), .addr(addr_data_ram), .ce(load_data | store), .we(store), .q(data_act_in), .d({row, data}));
    memory_access_for_data mr3(.clk(clk), .reset(reset_data_address), .en(en_ram), .address(addr_data_ram));
    
    
    CSR_decoder act1(.index_pointer(index_pointer_act), .data(data_act[7:0]), .row(data_act[11:8]), .indexed_data(indexed_act), .clk(clk), .rst(reset), .read(read_act_data), .write(write_enable_act),.enable((load_data&(~ done_act_in))), .nz_count(act_nz_count));
    data_switch d1(.reset(reset_data),.data(indexed_act), .en(write_enable_act),.max(act_nz_count), .data_out0(data_i0), .data_out1(data_i1), .done(done_act_in));
    
    
    //*******************************weight******************************************
    weight_index_ROM wr0 (.clk(clk), .en(load_data), .addr(address_index_rom), .rout(index_pointer_weight));
    memory_access_for_index m1(.layer(layer), .channel(channel), .dimension(dimension), .address(address_index_rom));
    
    weight_data_ROM wr1 (.clk(clk), .en(load_data), .addr(addr_data_rom), .dout(data_weight));
    memory_access_for_data m2(.clk(clk), .reset(~reset), .en(en_data_rom), .address(addr_data_rom));
    
    CSR_decoder weight1(.index_pointer({index_pointer_weight,88'd0}), .data(data_weight[7:0]), .row(data_weight[11:8]), .indexed_data(indexed_weight), .clk(clk), .rst(reset), .read(en_data_rom), .write(write_enable_weight),.enable((load_data&(~ done_weight_in))), .nz_count(weight_nz_count));
    data_switch d0(.reset(reset_rom_address),.data(indexed_weight), .en(write_enable_weight),.max(weight_nz_count), .data_out0(data_w0), .data_out1(data_w1), .done(done_weight_in));
    
    //******************************* result ******************************************
    result_RAM r1(.clk(clk), .addr0(channel), .ce0(1'b1), .we0(en_out), .q0(result), .d0(out_port), .addr1(mem2_addr1), .ce1(mem2_ce1), .we1(mem2_we1), .q1(mem2_q1), .d1(mem2_d1));
    
    //*******************************Computation*****************************************
    buffer_mcc_router_accum b1(
        .clk(clk),
        .reset(reset_mcc),
        .reset_data(reset_data),
        .reset_weight(reset_rom_address),
        .data_w0(data_w0[15:0]),                  
        .data_w1(data_w1[15:0]),
        .data_i0(data_i0[15:0]),
        .data_i1(data_i1[15:0]),
        .write_enable_w0(data_w0[16]),
        .write_enable_w1(data_w1[16]),
        .write_enable_i0(data_i0[16]),
        .write_enable_i1(data_i1[16]),
        .act_nz_count(act_nz_count),
        .weight_nz_count(weight_nz_count),
        .run_mcc(run_mcc),
        .done(done),
        
        .accum_out(accum_out),
        
        .act_size(act_size),
        .filter_size(filter_size)
    );
    
    PPU p1(.data_in(accum_out), .clk(clk), .en_encoder(en_encoder), .en_pooling(en_pooling), .row_size(row_size), .index_pointer(index_pointer), .row(row), .data(data), .out_port(out_port),.store(store), .done(done_out));
    

    
endmodule
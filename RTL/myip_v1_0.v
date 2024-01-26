
`timescale 1 ns / 1 ps


	module myip_v1_0 #
	(
		// Users to add parameters here
		//(lab10) Users to add parameters here
		
		//(lab12)
		parameter integer MEM0_DATA_WIDTH = 8,
		parameter integer MEM0_ADDR_WIDTH = 5,
		parameter integer MEM0_MEM_DEPTH  = 17,
		parameter integer MEM1_DATA_WIDTH = 12,
		parameter integer MEM1_ADDR_WIDTH = 10,
		parameter integer MEM1_MEM_DEPTH  = 1024,
    parameter integer MEM2_DATA_WIDTH = 32,
		parameter integer MEM2_ADDR_WIDTH = 4,
		parameter integer MEM2_MEM_DEPTH  = 16,
		// User parameters ends
		// Do not modify the parameters beyond this line
		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 6
	)
	(
		// (lab10) Users to add ports here
		output 					o_run,
    input   				i_idle,
		input					i_done,
    input[8:0]    cstate,

		// (lab13) Memory I/F
		output		[MEM0_ADDR_WIDTH-1:0] 	mem0_addr1,
		output		 						mem0_ce1,
		output		 						mem0_we1,
		input 		[MEM0_DATA_WIDTH-1:0]  	mem0_q1,
		output		[MEM0_DATA_WIDTH-1:0] 	mem0_d1,

		// (lab16) Memory I/F
		output		[MEM1_ADDR_WIDTH-1:0] 	mem1_addr1,
		output		 						mem1_ce1,
		output		 						mem1_we1,
		input 		[MEM1_DATA_WIDTH-1:0]  	mem1_q1,
		output		[MEM1_DATA_WIDTH-1:0] 	mem1_d1,

    output		[MEM2_ADDR_WIDTH-1:0] 	mem2_addr1,
		output		 						mem2_ce1,
		output		 						mem2_we1,
		input 		[MEM2_DATA_WIDTH-1:0]  	mem2_q1,
		output		[MEM2_DATA_WIDTH-1:0] 	mem2_d1,

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);

// Instantiation of Axi Bus Interface S00_AXI
	myip_v1_0_S00_AXI # ( 
		// (lab12)
		.MEM0_DATA_WIDTH	(MEM0_DATA_WIDTH	),
		.MEM0_ADDR_WIDTH	(MEM0_ADDR_WIDTH	),
		.MEM0_MEM_DEPTH 	(MEM0_MEM_DEPTH 	),
		// (lab16)
		.MEM1_DATA_WIDTH	(MEM1_DATA_WIDTH	),
		.MEM1_ADDR_WIDTH	(MEM1_ADDR_WIDTH	),
		.MEM1_MEM_DEPTH 	(MEM1_MEM_DEPTH 	),

    .MEM2_DATA_WIDTH	(MEM2_DATA_WIDTH	),
		.MEM2_ADDR_WIDTH	(MEM2_ADDR_WIDTH	),
		.MEM2_MEM_DEPTH 	(MEM2_MEM_DEPTH 	),

		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) myip_v1_0_S00_AXI_inst (
		// (lab10) Users to add ports here
		.o_run		(o_run),
		.i_done		(i_done),
    .i_idle   (i_idle),
    .cstate   (cstate),

		// (lab12) USE MEM I/F
		.mem0_addr1 	(mem0_addr1   ), 	
		.mem0_ce1	  	(mem0_ce1	  ),	
		.mem0_we1	  	(mem0_we1	  ),	
		.mem0_q1	  	(mem0_q1	  ),	
		.mem0_d1	  	(mem0_d1	  ),

		// (lab16) USE MEM I/F
		.mem1_addr1 	(mem1_addr1   ), 	
		.mem1_ce1	  	(mem1_ce1	  ),	
		.mem1_we1	  	(mem1_we1	  ),	
		.mem1_q1	  	(mem1_q1	  ),	
		.mem1_d1	  	(mem1_d1	  ),

    .mem2_addr1 	(mem2_addr1   ), 	
		.mem2_ce1	  	(mem2_ce1	  ),	
		.mem2_we1	  	(mem2_we1	  ),	
		.mem2_q1	  	(mem2_q1	  ),	
		.mem2_d1	  	(mem2_d1	  ),

		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule

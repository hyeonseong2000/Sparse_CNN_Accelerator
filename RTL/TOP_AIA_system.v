
module TOP_AIA_system #
(
	// (lab10) Users to add parameters here
	

	parameter integer MEM0_DATA_WIDTH = 8,
	parameter integer MEM0_ADDR_WIDTH = 5,
	parameter integer MEM0_MEM_DEPTH  = 17,
	// (lab16)
	parameter integer MEM1_DATA_WIDTH = 12,
	parameter integer MEM1_ADDR_WIDTH = 10,
	parameter integer MEM1_MEM_DEPTH  = 1024,
  
  parameter integer MEM2_DATA_WIDTH = 32,
	parameter integer MEM2_ADDR_WIDTH = 4,
	parameter integer MEM2_MEM_DEPTH  = 16,

// Delay cycle

	// User parameters ends
	// Do not modify the parameters beyond this line


	// Parameters of Axi Slave Bus Interface S00_AXI
	parameter integer C_S00_AXI_DATA_WIDTH	= 32,
	parameter integer C_S00_AXI_ADDR_WIDTH	= 6 // (lab16) used #16 reg
)
(
	// Users to add ports here

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

// (lab10)
	wire  				w_run;
	wire    			w_done;
  wire          w_idle;

  wire[8:0]     cstate;

// (lab16) Memory I/F
	// Ctrl Side
	wire		[MEM0_ADDR_WIDTH-1:0] 	mem0_addr1	;
	wire		 						mem0_ce1	;
	wire		 						mem0_we1	;
	wire		[MEM0_DATA_WIDTH-1:0]  	mem0_q1		;
	wire		[MEM0_DATA_WIDTH-1:0] 	mem0_d1		;

	wire		[MEM1_ADDR_WIDTH-1:0] 	mem1_addr1	;
	wire		 						mem1_ce1	;
	wire		 						mem1_we1	;
	wire		[MEM1_DATA_WIDTH-1:0]  	mem1_q1		;
	wire		[MEM1_DATA_WIDTH-1:0] 	mem1_d1		;

  wire		[MEM2_ADDR_WIDTH-1:0] 	mem2_addr1	;
	wire		 						mem2_ce1	;
	wire		 						mem2_we1	;
	wire		[MEM2_DATA_WIDTH-1:0]  	mem2_q1		;
	wire		[MEM2_DATA_WIDTH-1:0] 	mem2_d1		;


// Instantiation of Axi Bus Interface S00_AXI
	myip_v1_0 # ( 
		
		.MEM0_DATA_WIDTH (MEM0_DATA_WIDTH),
		.MEM0_ADDR_WIDTH (MEM0_ADDR_WIDTH),
		.MEM0_MEM_DEPTH  (MEM0_MEM_DEPTH ),
		.MEM1_DATA_WIDTH (MEM1_DATA_WIDTH),
		.MEM1_ADDR_WIDTH (MEM1_ADDR_WIDTH),
		.MEM1_MEM_DEPTH  (MEM1_MEM_DEPTH ),
    .MEM2_DATA_WIDTH (MEM2_DATA_WIDTH),
		.MEM2_ADDR_WIDTH (MEM2_ADDR_WIDTH),
		.MEM2_MEM_DEPTH  (MEM2_MEM_DEPTH ),
		.C_S00_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S00_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) myip_v1_0_inst (
		// (lab10) Users to add ports here
		.o_run		(w_run),
		.i_done		(w_done),
    .i_idle   (w_idle),
    .cstate   (cstate),

		// (lab16) Users to add ports here
		.mem0_addr1			(mem0_addr1	),
		.mem0_ce1			(mem0_ce1	),
		.mem0_we1			(mem0_we1	),
		.mem0_q1			(mem0_q1	),
		.mem0_d1			(mem0_d1	),

		// (lab16) Users to add ports here
		.mem1_addr1			(mem1_addr1	),
		.mem1_ce1			(mem1_ce1	),
		.mem1_we1			(mem1_we1	),
		.mem1_q1			(mem1_q1	),
		.mem1_d1			(mem1_d1	),

    .mem2_addr1			(mem2_addr1	),
		.mem2_ce1			(mem2_ce1	),
		.mem2_we1			(mem2_we1	),
		.mem2_q1			(mem2_q1	),
		.mem2_d1			(mem2_d1	),

		.s00_axi_aclk	(s00_axi_aclk	),
		.s00_axi_aresetn(s00_axi_aresetn),
		.s00_axi_awaddr	(s00_axi_awaddr	),
		.s00_axi_awprot	(s00_axi_awprot	),
		.s00_axi_awvalid(s00_axi_awvalid),
		.s00_axi_awready(s00_axi_awready),
		.s00_axi_wdata	(s00_axi_wdata	),
		.s00_axi_wstrb	(s00_axi_wstrb	),
		.s00_axi_wvalid	(s00_axi_wvalid	),
		.s00_axi_wready	(s00_axi_wready	),
		.s00_axi_bresp	(s00_axi_bresp	),
		.s00_axi_bvalid	(s00_axi_bvalid	),
		.s00_axi_bready	(s00_axi_bready	),
		.s00_axi_araddr	(s00_axi_araddr	),
		.s00_axi_arprot	(s00_axi_arprot	),
		.s00_axi_arvalid(s00_axi_arvalid),
		.s00_axi_arready(s00_axi_arready),
		.s00_axi_rdata	(s00_axi_rdata	),
		.s00_axi_rresp	(s00_axi_rresp	),
		.s00_axi_rvalid	(s00_axi_rvalid	),
		.s00_axi_rready	(s00_axi_rready	)
	);

	// (lab16) Add user logic here

  TOP#(
    .MEM0_DATA_WIDTH (MEM0_DATA_WIDTH),
		.MEM0_ADDR_WIDTH (MEM0_ADDR_WIDTH),
		.MEM0_MEM_DEPTH  (MEM0_MEM_DEPTH ),
		.MEM1_DATA_WIDTH (MEM1_DATA_WIDTH),
		.MEM1_ADDR_WIDTH (MEM1_ADDR_WIDTH),
		.MEM1_MEM_DEPTH  (MEM1_MEM_DEPTH ),
    .MEM2_DATA_WIDTH (MEM2_DATA_WIDTH),
		.MEM2_ADDR_WIDTH (MEM2_ADDR_WIDTH),
		.MEM2_MEM_DEPTH  (MEM2_MEM_DEPTH )
  ) TOP_AIA(
    .clk(s00_axi_aclk), .reset(s00_axi_aresetn),  
    .start(w_run), 
    .finish(w_done), .idle(w_idle), .cstate(cstate),
    .mem0_addr1(mem0_addr1), .mem0_ce1(mem0_ce1), .mem0_we1(mem0_we1), .mem0_q1(mem0_q1), .mem0_d1(mem0_d1),
    .mem1_addr1(mem1_addr1), .mem1_ce1(mem1_ce1), .mem1_we1(mem1_we1), .mem1_q1(mem1_q1), .mem1_d1(mem1_d1),
    .mem2_addr1(mem2_addr1), .mem2_ce1(mem2_ce1), .mem2_we1(mem2_we1), .mem2_q1(mem2_q1), .mem2_d1(mem2_d1)
    );


endmodule



//--------------------------------------------------------------------------------------
//  Interface Name : axi4_intf  ,included all axi4 channel signals .
//--------------------------------------------------------------------------------------



interface    axi4_intf(input logic ACLK,ARESETn);
  
//------------------------------------------------
// AXI Write address channel signals : 13
//------------------------------------------------
  
  logic [(`G_AXI_AWID_WIDTH-1):0]          AWID;
  
  logic [(`G_AXI_AWADDR_WIDTH-1):0]        AWADDR;
  
  logic [(`G_AXI_AWLEN_WIDTH-1):0]         AWLEN;
  
  logic [(`G_AXI_AWSIZE_WIDTH-1):0]        AWSIZE;
  
  logic [(`G_AXI_AWBURST_WIDTH-1):0]       AWBURST;
  
  logic [(`G_AXI_AWLOCK_WIDTH-1):0]        AWLOCK;
  
  logic [(`G_AXI_AWCACHEE_WIDTH-1):0]      AWCACHEE;
  
  logic [(`G_AXI_AWPROT_WIDTH-1):0]        AWPROT;
  
  logic [(`G_AXI_AWQOS_WIDTH-1):0]         AWQOS;
  
  logic [(`G_AXI_AWREGION_WIDTH-1):0]      AWREGION;
  
  logic [(`G_AXI_AWUSER_WIDTH-1) :0]       AWUSER;
  
  logic                                    AWVALID;
  
  logic                                    AWREADY =1'b1;
  
//--------------------------------------------------------------------
// AXI Write Data Channel signals : 7 SIGNALS WITH WID , ELSE 6 SIGNALS
//--------------------------------------------------------------------
  
  `ifdef AXI3_PROJECT
  logic [(`G_AXI_WID_WIDTH-1):0]           WID;  // In axi4 the wid signal is removed.
  `endif
  
  logic [(`G_AXI_WDATA_WIDTH-1):0]         WDATA;
  
  logic [(`G_AXI_WSTRB_WIDTH-1):0]         WSTRB;
  
  logic                                    WLAST;
  
  logic [(`G_AXI_WUSER_WIDTH-1):0]        WUSER;
  
  logic                                    WVALID;
  
  logic                                    WREADY = 1;
  
//--------------------------------------------------------------
// AXI Write Response channel signals :  5 Signals 
//--------------------------------------------------------------
  
  logic [(`G_AXI_BID_WIDTH-1):0]                BID;
  
  logic [(`G_AXI_BRESP_WIDTH-1):0]              BRESP;
  
  logic [(`G_AXI_BUSER_WIDTH-1):0]              BUSER;
  
  logic                                         BVALID;
  
  logic                                         BREADY;
  
//-------------------------------------------------------------
// AXI Read address channel signals : 13 signals               
//-------------------------------------------------------------
  
  logic [(`G_AXI_ARID_WIDTH-1):0]               ARID;
  
  logic [(`G_AXI_ARADDR_WIDTH-1):0]             ARADDR;
  
  logic [(`G_AXI_ARLEN_WIDTH-1):0]              ARLEN;
  
  logic [(`G_AXI_ARSIZE_WIDTH-1):0]             ARSIZE;
  
  logic [(`G_AXI_ARBURST_WIDTH-1):0]            ARBURST;
  
  logic [(`G_AXI_ARLOCK_WIDTH-1):0]             ARLOCK;
  
  logic [(`G_AXI_ARCACHEE_WIDTH-1):0]           ARCACHEE;
  
  logic [(`G_AXI_ARPROT_WIDTH-1):0]             ARPROT;
  
  logic [(`G_AXI_ARQOS_WIDTH-1):0]              ARQOS;
  
  logic [(`G_AXI_ARREGION_WIDTH-1):0]           ARREGION;
  
  logic [(`G_AXI_ARUSER_WIDTH-1) :0]            ARUSER;
  
  logic                                         ARVALID;
  
  logic                                         ARREADY=1;
    
//---------------------------------------------------------------
//  AXI Read Data Channel signals : 7
//---------------------------------------------------------------
  
  logic [(`G_AXI_RID_WIDTH-1):0]                RID;
  
  logic [(`G_AXI_RDATA_WIDTH-1):0]              RDATA;
  
  logic [(`G_AXI_RRESP_WIDTH-1):0]              RRESP;
  
  logic                                         RLAST;
  
  logic [(`G_AXI_RUSER_WIDTH-1) :0]             RUSER;
  
  logic                                         RVALID;
  
  logic                                         RREADY;
  
  
//--------------------------------------------------------------
// 
//--------------------------------------------------------------
  
  
//------------------------------------------------
  
//------------------------------------------------
  
  
//------------------------------------------------
  
//------------------------------------------------
  
  
  initial begin
    fork
    #100 BVALID =1;
    RVALID = 1;
      #200 RLAST = 1;
    join
  end
  
endinterface:axi4_intf
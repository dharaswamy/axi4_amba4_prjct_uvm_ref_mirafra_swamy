

class axi4_m_sequ_item_base#(type data_type= `G_AXI_DATA_TYPE ,
                             
                             parameter AWID_WIDTH      = `G_AXI_AWID_WIDTH,
                             
                             parameter AWADDR_WIDTH    = `G_AXI_AWADDR_WIDTH,
                             
                             parameter AWLEN_WIDTH     = `G_AXI_AWLEN_WIDTH,
                             
                             parameter AWSIZE_WIDTH    = `G_AXI_AWSIZE_WIDTH,
                             
                             parameter AWBURST_WIDTH   =  `G_AXI_AWBURST_WIDTH,
                             
                             parameter AWLOCK_WIDTH    =  `G_AXI_AWLOCK_WIDTH,
                             
                             parameter AWCACHEE_WIDTH  = `G_AXI_AWCACHEE_WIDTH, 
                            
                             parameter AWPROT_WIDTH    = `G_AXI_AWPROT_WIDTH,
                             
                             parameter AWQOS_WIDTH     = `G_AXI_AWQOS_WIDTH,
                             
                             parameter AWREGION_WIDTH  = `G_AXI_AWREGION_WIDTH,
                             
                             parameter AWUSER_WIDTH    = `G_AXI_AWUSER_WIDTH,
                             
                              
                             parameter WID_WIDTH       = `G_AXI_WID_WIDTH,
                             
                             parameter WDATA_WIDTH     = `G_AXI_WDATA_WIDTH,
                             
                             parameter WSTRB_WIDTH     = `G_AXI_WSTRB_WIDTH,
                             
                             parameter WUSER_WIDTH     = `G_AXI_WUSER_WIDTH,
                             
                             
                             parameter BID_WIDTH       = `G_AXI_BID_WIDTH,
                             
                             parameter BRESP_WIDTH     = `G_AXI_BRESP_WIDTH,
                             
                             parameter BUSER_WIDTH     = `G_AXI_BUSER_WIDTH,
                             
                             
                             
                             parameter ARID_WIDTH      = `G_AXI_ARID_WIDTH,
                             
                             parameter ARADDR_WIDTH    = `G_AXI_ARADDR_WIDTH,
                             
                             parameter ARLEN_WIDTH     = `G_AXI_ARLEN_WIDTH,
                             
                             parameter ARSIZE_WIDTH    = `G_AXI_ARSIZE_WIDTH,
                             
                             parameter ARBURST_WIDTH   =  `G_AXI_ARBURST_WIDTH,
                             
                             parameter ARLOCK_WIDTH    =  `G_AXI_ARLOCK_WIDTH,
                             
                             parameter ARCACHEE_WIDTH  = `G_AXI_ARCACHEE_WIDTH, 
                             
                             parameter ARPROT_WIDTH    = `G_AXI_ARPROT_WIDTH,
                              
                             parameter ARQOS_WIDTH     = `G_AXI_ARQOS_WIDTH,
                              
                             parameter ARREGION_WIDTH  = `G_AXI_ARREGION_WIDTH,
                             
                             parameter ARUSER_WIDTH    = `G_AXI_ARUSER_WIDTH,
                                                 
                             
                             parameter RID_WIDTH       = `G_AXI_RID_WIDTH,
                             
                             parameter RDATA_WIDTH     = `G_AXI_RDATA_WIDTH,
                             
                             parameter RUSER_WIDTH     = `G_AXI_RUSER_WIDTH
                             
                             
                            ) extends uvm_sequence_item;
  
  
//------------------------------------------------------------------
// Wrte address channel signals : 13 
//------------------------------------------------------------------
  
  rand  awid_enum                                   AWID;
  
  rand  data_type [ (AWADDR_WIDTH-1) : 0 ]          AWADDR;
  
  rand  data_type [ (AWLEN_WIDTH-1)  : 0 ]          AWLEN;
  
  rand  awsize_enum                                 AWSIZE;
  
  rand  awburst_type_enum                           AWBURST;
  
  rand  awlock_enum                                 AWLOCK;
  
  rand  data_type [ (AWCACHEE_WIDTH-1) : 0 ]        AWCACHEE;
 
  rand  data_type [ (AWPROT_WIDTH-1) : 0 ]          AWPROT;
 
  rand  data_type [ (AWQOS_WIDTH-1) : 0 ]           AWQOS;
  
  rand data_type  [ (AWREGION_WIDTH-1) : 0 ]        AWREGION;
  
  rand data_type  [ (AWUSER_WIDTH-1)   : 0 ]        AWUSER;
  
  rand data_type                                    AWVALID;
  
  rand data_type                                    AWREADY;
  
//------------------------------------------------------------------
// Wrte Dat channel signals : 7 SIGNALS WITH WID , ELSE 6 SIGNALS
//------------------------------------------------------------------
  
 `ifdef AXI3_PROJECT
    rand wid_enum  WID;
  `endif
 
  rand data_type [ WDATA_WIDTH : 0 ]                WDATA[];
  
  rand data_type [ (WSTRB_WIDTH-1) : 0 ]            WSTRB[];
  
  rand data_type                                    WLAST;
  
  rand data_type [ (WUSER_WIDTH-1)  : 0 ]           WUSER;
  
  rand data_type                                    WVALID;
  
  rand data_type                                    WREADY;
  
  
//------------------------------------------------------------------
// Write Response Channel signals :  5 Signals 
//----------------------------------------------------------------
  
       bid_enum                                      BID;   
   
       bresp_enum                                    BRESP;
  
       data_type [ (BUSER_WIDTH-1):0 ]               BUSER;
  
       data_type                                     BVALID;
  
       data_type                                     BREADY;
  
  
  
//------------------------------------------------------------------
// Read address channel signals : 13 signals
//------------------------------------------------------------------

  rand  arid_enum                                   ARID;
  
  rand  data_type [ (ARADDR_WIDTH-1) : 0 ]          ARADDR;
  
  rand  data_type [ (ARLEN_WIDTH-1)  : 0 ]          ARLEN;
  
  rand  arsize_enum                                 ARSIZE;
  
  rand  arburst_type_enum                           ARBURST;
  
  rand  arlock_enum                                 ARLOCK;
  
  rand  data_type [ (ARCACHEE_WIDTH-1) : 0 ]        ARCACHEE;
  
  rand  data_type [ (ARPROT_WIDTH-1) : 0 ]          ARPROT;
  
  rand  data_type [ (ARQOS_WIDTH-1) : 0 ]           ARQOS;
  
  rand data_type  [ (ARREGION_WIDTH-1) : 0 ]        ARREGION;
  
  rand data_type  [ (ARUSER_WIDTH-1)   : 0 ]        ARUSER;
  
  rand data_type                                    ARVALID;
  
  rand data_type                                    ARREADY;
  
  
//------------------------------------------------------------------
// Read Data channel signals : 7
//------------------------------------------------------------------
 
       rid_enum                                      RID;
       
 rand  data_type [ (RDATA_WIDTH-1) : 0 ]             RDATA[];
  
       rresp_enum                                    RRESP;
    
       data_type                                     RLAST;
  
       data_type [ (RUSER_WIDTH-1) : 0 ]            RUSER;
  
       data_type                                     RVALID;
  
       data_type                                     RREADY;
  
  
  
  
  //Variable: transfer_type
  //Used to the determine the type of the transfer
  rand transfer_type_enum transfer_type;
 
  
   //Variable : no_of_wait_states
  //Used to count number of wait states
  rand int no_of_wait_states;

  //Variable: wait_count_write_address_channel
  //Used to determine wait count for write address channel
  int wait_count_write_address_channel;

  //Variable: wait_count_write_data_channel
  //Used to determine wait count for write data channel
  int wait_count_write_data_channel;
  
  //Variable: wait_count_write_response_channel
  //Used to determine wait count for write response channel
  int wait_count_write_response_channel;

  //Variable: wait_count_read_address_channel
  //Used to determine wait count for write response channel
  int wait_count_read_address_channel;

  //Variable: wait_count_read_data_channel
  //Used to determine wait count for write response channel
  int wait_count_read_data_channel;
  
  //Variable: outstanding_write_tx
  //Used to determine the outstanding write tx count
  int outstanding_write_tx;
  
  //Variable: outstanding_write_tx
  //Used to determine the outstanding write tx count
  int outstanding_read_tx;
  
  // factory registration step for the parametrized class:
   
  typedef axi4_m_sequ_item_base#(data_type,AWID_WIDTH,AWADDR_WIDTH,AWLEN_WIDTH,AWSIZE_WIDTH,AWBURST_WIDTH,AWLOCK_WIDTH,AWCACHEE_WIDTH,AWPROT_WIDTH,AWQOS_WIDTH,AWREGION_WIDTH,AWUSER_WIDTH,WID_WIDTH,WDATA_WIDTH,WSTRB_WIDTH,WUSER_WIDTH,BID_WIDTH,BRESP_WIDTH,BUSER_WIDTH,ARID_WIDTH,ARADDR_WIDTH,ARLEN_WIDTH,ARSIZE_WIDTH,ARBURST_WIDTH,ARLOCK_WIDTH,ARCACHEE_WIDTH,ARPROT_WIDTH,ARQOS_WIDTH,ARREGION_WIDTH,ARUSER_WIDTH,RID_WIDTH,RDATA_WIDTH,RUSER_WIDTH) this_type;  
  
  
  
  
  //factory registration : object class : 
  `uvm_object_param_utils_begin(this_type)
    `uvm_field_enum(transfer_type_enum,transfer_type,UVM_ALL_ON)
    `uvm_field_enum(awid_enum,AWID,UVM_ALL_ON)
    `uvm_field_int(AWADDR,UVM_ALL_ON)
    `uvm_field_int(AWLEN,UVM_ALL_ON)
    `uvm_field_enum(awsize_enum,AWSIZE,UVM_ALL_ON)
    `uvm_field_enum(awburst_type_enum,AWBURST,UVM_ALL_ON)
    `uvm_field_enum(awlock_enum,AWLOCK,UVM_ALL_ON)
    `uvm_field_int(AWCACHEE,UVM_ALL_ON)
    `uvm_field_int(AWPROT,UVM_ALL_ON)
    `uvm_field_int(AWQOS,UVM_ALL_ON)
    `uvm_field_int(AWREGION,UVM_ALL_ON)
    `uvm_field_int(AWUSER,UVM_ALL_ON)
    `uvm_field_int(AWVALID,UVM_ALL_ON)
    `uvm_field_int(AWREADY,UVM_ALL_ON)
  
    `ifdef AXI3_PROJECT
    `uvm_field_enum(wid_enum,WID,UVM_ALL_ON);
    `endif
  
  `uvm_field_array_int(WDATA,UVM_ALL_ON)
  `uvm_field_array_int(WSTRB,UVM_ALL_ON)
  `uvm_field_int(WLAST,UVM_ALL_ON)
  `uvm_field_int(WUSER,UVM_ALL_ON)
  `uvm_field_int(WVALID,UVM_ALL_ON)
  `uvm_field_int(WREADY,UVM_ALL_ON)
    
    
  `uvm_field_enum(bid_enum,BID,UVM_ALL_ON)
  `uvm_field_enum(bresp_enum,BRESP,UVM_ALL_ON)
  `uvm_field_int(BUSER,UVM_ALL_ON)
  `uvm_field_int(BVALID,UVM_ALL_ON)
  `uvm_field_int(BREADY,UVM_ALL_ON)
    
   `uvm_field_enum(arid_enum,ARID,UVM_ALL_ON)
   `uvm_field_int(ARADDR,UVM_ALL_ON)
   `uvm_field_int(ARLEN,UVM_ALL_ON)
   `uvm_field_enum(arsize_enum,ARSIZE,UVM_ALL_ON)
  `uvm_field_enum(arburst_type_enum,ARBURST,UVM_ALL_ON)
   `uvm_field_enum(arlock_enum,ARLOCK,UVM_ALL_ON)
   `uvm_field_int(ARCACHEE,UVM_ALL_ON)
   `uvm_field_int(ARPROT,UVM_ALL_ON)
   `uvm_field_int(ARQOS,UVM_ALL_ON)
   `uvm_field_int(ARREGION,UVM_ALL_ON)
   `uvm_field_int(ARUSER,UVM_ALL_ON)
   `uvm_field_int(ARVALID,UVM_ALL_ON)
   `uvm_field_int(ARREADY,UVM_ALL_ON)
   
  `uvm_field_enum(rid_enum,RID,UVM_ALL_ON)
  `uvm_field_array_int(RDATA,UVM_ALL_ON)
  `uvm_field_enum(rresp_enum,RRESP,UVM_ALL_ON)
  `uvm_field_int(RLAST,UVM_ALL_ON)
  `uvm_field_int(RUSER,UVM_ALL_ON)
  `uvm_field_int(RVALID,UVM_ALL_ON)
  `uvm_field_int(RREADY,UVM_ALL_ON)
  `uvm_object_utils_end
 
  
  
  function new(string name = get_type_name());
    super.new(name);
  endfunction:new
  
  //----------------------------------------------------------------------------------
  // Write address channel constraints : AWADDR : 
  //----------------------------------------------------------------------------------
  
  // Constraint For    :     AWADDR ; 
  //Constraint Name    :     aligned_awaddr_hard_consrt_
  //Usage/purpose      : Used to generate the aligned address with respect to the size of data transfer
  //constraint aligned_awaddr_hard_consrt_{ AWADDR == ( AWADDR % (2**AWSIZE) ) == 0; } // i verified this constraint not generating aligned address
  // So i wrote another constraint that generated aligned address (verified )
    constraint aligned_awaddr_hard_consrt_{ AWADDR % (2**AWSIZE) == 0; } 

  
  //Constraint For   : AWBURST ; 
  //Constraint Name  : awburst_c1_hw
  //Restricting write burst to select only FIXED, INCR and WRAP types
  constraint awburst_hard_consrt_{ AWBURST != WRITE_RESERVED ; } 
  
  //Constraint for    : AWLEN 
  //Constraint Name   : awlength_c2
  // Adding constraint for restricting write trasnfers ( We know axi4 the increment burst only supports burst_length upto 256 and fixed burst  length 1 to 16 and Wrap burst is 2,4,8,16 .
  constraint awlength_hard_consrt_{ if(AWBURST == WRITE_FIXED_BURST  || WRITE_WRAP_BURST)
                                     {
                                      AWLEN inside{[0:15]};
                                      }
                                    else if( AWBURST == WRITE_INCR_BURST ) 
                                    { 
                                     AWLEN inside {[0:255]};
                                     }
                                   }
  
                               
    // Constraint for : AWLEN  ; 
    // Constraint Name : awlength_c3_hw
    // Adding constraint for restricting to get multiples of 2 in wrap burst Because axi supports wrap burst type of 2,4,8,16.
    constraint awlength_f_wrap_burst_hard_consrt_{ if(AWBURST == WRITE_WRAP_BURST) 
                                                      AWLEN+1 inside{2,4,8,16};
                                                 }
                               
    //Constraint for : AWLOCK ; Constraint Name : awlock_c4_soft
   //Adding constraint to select the lock transfer type
 //   constraint awlock_c4_soft { AWLOCK == WRITE_NORMAL_ACCESS ; }    
                               
                               
   // Constraint for : AWSIZE ; Constraint Name : awsize_c6
  //Adding a soft constraint to detrmine the awsize
  // constraint awsize_c6_soft{ soft AWSIZE inside { [0:2] } ;}    
  // constraint awsize_c6_soft{ soft AWSIZE inside{[0:((DATA_WIDTH/8)-1)]} ;} // own written : swamy : problem 
                                      
    
  // i am writting temporarily : 
                                      constraint awvalid_consrt{ AWVALID == 1 ; }  
                                      constraint transaction_type { transfer_type == BLOCKING_WRITE ;} 
                               
 
   
 //----------------------------------------------------------------------------------
 //  Read address constraints
 //-----------------------------------------------------------------------------------
  
  // Constraint For    :     ARADDR ; 
  //Constraint Name    :     aligned_araddr_hard_consrt_
  //Usage/purpose      : Used to generate the aligned address with respect to the size of data transfer
  // constraint aligned_araddr_hard_consrt_{ ARADDR == ( ARADDR % (2**ARSIZE) ) == 0; }// i verified it is not generating alined address
  // So i wrote new constraints that generated aligned addresses ( i verified it is working )
    constraint aligned_araddr_hard_consrt_{  ARADDR % (2**ARSIZE) == 0; }                            

     
   //Constraint For   : ARBURST ; 
  //Constraint Name  : arburst_hard_consrt_
  //Restricting write burst to select only FIXED, INCR and WRAP types
  constraint arburst_hard_consrt_{ ARBURST != READ_RESERVED ; } 
    
  //Constraint for    : ARLEN 
  //Constraint Name    : 
  // Adding constraint for restricting write trasnfers ( We know axi4 the increment burst only supports burst_length upto 256 and fixed burst  length 1 to 16 and Wrap burst is 2,4,8,16 .
  constraint arlength_hard_consrt_{ if(ARBURST == READ_FIXED_BURST  || READ_WRAP_BURST)
                                     {
                                      ARLEN inside{[0:15]};
                                      }
                                    else if( ARBURST == READ_INCR_BURST ) 
                                    { 
                                     ARLEN inside {[0:255]};
                                     }
                                   }
  
                               
    // Constraint for : ARLEN   
    // Constraint Name : arlength_c3_hw
    // Adding constraint for restricting to get multiples of 2 in wrap burst Because axi supports wrap burst type of 2,4,8,16.
    constraint arlength_f_wrap_burst_hard_consrt_{ if(ARBURST == READ_WRAP_BURST) 
                                                      ARLEN+1 inside{2,4,8,16};
                                                   }
    
    
endclass:axi4_m_sequ_item_base


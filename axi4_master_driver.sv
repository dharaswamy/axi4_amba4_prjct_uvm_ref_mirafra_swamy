

//--------------------------------------------------------------------------------------------
// Class: master_master_driver
//  Driver is written by extending uvm_driver,uvm_driver is inherited from uvm_component, 
//  Methods and TLM port (seq_item_port) are defined for communication between sequencer and driver,
//  uvm_driver is a parameterized class and it is parameterized with the type of the request 
//  sequence_item and the type of the response sequence_item 
//--------------------------------------------------------------------------------------------


//------------------------------------------------------------------------------------------------------------------

class axi4_master_driver extends uvm_driver#(axi4_m_sequ_item_base);
  
// Factory Registration : This class is uvm component class so 
// registrary with the uvm_component_utils 
  `uvm_component_utils(axi4_master_driver) 
  
// virtual interface handle declaration 
  virtual axi4_intf  axi4_vintf_h;
  
 //Port: axi_write_seq_item_port
  //This port is used to request write items from the sequencer, they are also used it to send responses back.
  uvm_seq_item_pull_port#(REQ,RSP) axi_write_seq_item_port;
  
  
  //Port: axi_read_seq_item_port
  //This port is used to request read items from the sequencer, they are also used it to send responses back.
  uvm_seq_item_pull_port#(REQ,RSP) axi_read_seq_item_port;
  
  //Variable: req_wr, req_rd
  //Declaration of REQ handles
  REQ req_wr, req_rd;
  
  
// Extern functions declaration : 
  
extern function new(string name = "axi4_master_driver",uvm_component parent);

extern function void build_phase(uvm_phase phase);
 
extern task run_phase(uvm_phase phase);
  
// axi4_write_task();
 extern virtual protected task axi4_write_task();
    
// axi4_read_taskf();
 extern virtual protected task axi4_read_task();
   
// axi4_write_address_channel_task
 extern virtual task  axi4_write_address_channel_task(axi4_m_sequ_item_base req_wr);
 
// axi4_write_data_channel_task 
 extern virtual task axi4_write_data_channel_task(axi4_m_sequ_item_base req_wr);
    
// axi4_write_response_channel_task
 extern virtual task axi4_write_response_channel_task(axi4_m_sequ_item_base  req_wr);
  
// axi4_read_address_channel_task : 
 extern virtual task axi4_read_address_channel_task(axi4_m_sequ_item_base req_rd);
    
// axi4_read_data_channel_task
 extern virtual task axi4_read_data_channel_task(axi4_m_sequ_item_base req_rd);
    
    
endclass:axi4_master_driver

//====================================================================================================================================
  
  
//-----------------------------------------------------------------------------------------------------
// Extern Functions and Tasks  Declarations  : axi4_master_driver :    
//-----------------------------------------------------------------------------------------------------
  
  //-------------------------------------------------------------------
  // Function Name : new() : It is default class constructor : 
  // Parameters    :
  // Class Name    : axi4_master_driver
  // Parent class Name : Parent under which this class is created .
  // Usage/purpose : It calls the its super class new() method.
  //--------------------------------------------------------------------
  function axi4_master_driver::new(string name = "axi4_master_driver",uvm_component parent);
    super.new(name,parent);
    axi_write_seq_item_port = new("axi_write_seq_item_port",this);
    axi_read_seq_item_port  = new("axi_read_seq_item_port",this);
  endfunction:new
  
  //--------------------------------------------------------------------
  // Function Name     : build_phase() ;
  // Parameters        :
  // Class Name        : axi4_master_drive
  // Parent class Name : Parent under which this class is created .
  // Usage/purpose     : It build the components or objects and get the virtual interface form testbench top.
  //--------------------------------------------------------------------
  function void axi4_master_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(! uvm_config_db#(virtual axi4_intf)::get(this,"","axi4_vintf_h",axi4_vintf_h)) 
      `uvm_fatal("Vitual Interface "," Set the axi4_vintf_h into the Configaration data base ");
  endfunction:build_phase
  
  
  //--------------------------------------------------------------------
  // Function/Task Name      : run_phase()
  // Parameters              : -
  // Class  Name             : axi4_master_driver
  // Parent class Name       : Parent under which this class is created .
  // Usage or Purpose        : It drives the stimulas to DUT via virtual interface.
  //--------------------------------------------------------------------
  
  task axi4_master_driver::run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    fork 
     
      begin:for_write_transaction
       // Calling axi4_write_task();
        axi4_write_task();
      end:for_write_transaction
      
      begin:for_read_transaction
      // axi4_read_task();
        axi4_read_task();
      end:for_read_transaction
      
    join
    
  endtask:run_phase
   
   
  //--------------------------------------------------------------------
  // Function/Task Name      : axi_write_task();
  // Parameters              :
  // Class  Name             :
  // Parent class Name       :
  // Usage or Purpose        :
  //--------------------------------------------------------------------
   task axi4_master_driver::axi4_write_task();
     
     
     axi_write_seq_item_port.get_next_item(req_wr);
    `uvm_info(get_full_name(),$sformatf("Write Transaction Recieved %0s ",req_wr.sprint()),UVM_NONE)
     
     // if the transfer type is " BLOCKIG_WRITE "
     if( req_wr.transfer_type == BLOCKING_WRITE ) 
       begin
         $display( " BLOCKING_WRITE IS STARTED " );
         axi4_write_address_channel_task(req_wr);
         $display( " write address channel completed " );
         axi4_write_data_channel_task(req_wr);
         $display("write data channel completed " );
     	 axi_write_seq_item_port.item_done(req_wr);
         $display(" item done " );
       end
     
     // If the transfer type is " NON_BLOCKING_WRITE " .
     else if(req_wr.transfer_type == NON_BLOCKING_WRITE) 
       begin
        
         //Variable : axi4_write_address_channel_process
         //Used to control the fork_join process
         //Use Case is fork_join process should wait for write address to complete.  
         process axi4_write_address_channel_process;
         
         //Variable : axi4_write_data_channel_process
         //Used to control the fork_join process
         process axi4_write_data_channel_process;
         
         //Variable : axi4_write_response_channel_process
         //Used to control the fork_join process
         process axi4_write_response_channel_process;
         
         // Here the write_address_channel, write_data_channel , write_response_channel all are started parallel using fork join_any.
         
         fork 
           
           
           begin:axi4_wr_addr_channel_thread
             
           end:axi4_wr_addr_channel_thread
           
           
           begin:axi4_wr_data_channel_task
             
           end:axi4_wr_data_channel_task
           
           
           begin:axi4_wr_resp_channel_thread
             
           end:axi4_wr_resp_channel_thread
         
           
         join
         
       end
     
   endtask:axi4_write_task
  
  //--------------------------------------------------------------------
  // Function/Task Name      : axi_read_task()
  // Parameters              :
  // Class  Name             :
  // Parent class Name       :
  // Usage or Purpose        :
  //--------------------------------------------------------------------
   task axi4_master_driver::axi4_read_task();
     
     axi_read_seq_item_port.get_next_item(req_rd);
     `uvm_info(get_full_name(),$sformatf("Read Transaction Recieved %0s ",req_rd.sprint()),UVM_NONE);
     axi4_read_address_channel_task(req_rd);
     axi4_read_data_channel_task(req_rd);
     axi_read_seq_item_port.item_done(req_rd);
     
   endtask:axi4_read_task
  
    
  //--------------------------------------------------------------------
  // Task Name               : axi4_write_address_channel_task
  // Parameters              :
  // Class  Name             : axi4_master_driver
  // Parent class Name       :
  // Usage or Purpose        :
  //--------------------------------------------------------------------
    
  task axi4_master_driver::axi4_write_address_channel_task(axi4_m_sequ_item_base req_wr);
      
      // Driving the axi4 write address channel signals : 
      @(axi4_vintf_h.ACLK);
      
       axi4_vintf_h.AWID           <=   req_wr.AWID;
       axi4_vintf_h.AWADDR         <=   req_wr.AWADDR;
       axi4_vintf_h.AWLEN          <=   req_wr.AWLEN;
       axi4_vintf_h.AWSIZE         <=   req_wr.AWSIZE;
       axi4_vintf_h.AWBURST        <=   req_wr.AWBURST;
       axi4_vintf_h.AWLOCK         <=   req_wr.AWLOCK;
       axi4_vintf_h.AWCACHEE       <=   req_wr.AWCACHEE;
       axi4_vintf_h.AWPROT         <=   req_wr.AWPROT;
       axi4_vintf_h.AWQOS          <=   req_wr.AWQOS;
       axi4_vintf_h.AWREGION       <=   req_wr.AWREGION;
       axi4_vintf_h.AWUSER         <=   req_wr.AWUSER;
       axi4_vintf_h.AWVALID        <=   req_wr.AWVALID;
      
//     if( axi4_vintf_h.AWREADY ) begin:zero_wait_state
//         req_wr.wait_count_write_address_channel = 0;
//         @(posedge axi4_vintf_h.ACLK) axi4_vintf_h.AWVALID <=  0;
//       end:zero_wait_state
    
   //   else begin:non_zero_wait_state
        do begin
        @(posedge axi4_vintf_h.ACLK );
        req_wr.wait_count_write_address_channel++;
        end
        while(axi4_vintf_h.AWREADY !== 1 ) ;
      //  @(posedge axi4_vintf_h.ACLK) axi4_vintf_h.AWVALID <=  0;
        axi4_vintf_h.AWVALID <=  0;
    //  end:non_zero_wait_state
    
    
   endtask:axi4_write_address_channel_task
    
  //--------------------------------------------------------------------
  // Task Name               : axi4_write_data_channel_task()
  // Parameters              :
  // Class  Name             : axi4_master_driver
  // Parent class Name       :
  // Usage or Purpose        : It drives the  write data on the interface 
  //--------------------------------------------------------------------  
    task axi4_master_driver::axi4_write_data_channel_task(axi4_m_sequ_item_base req_wr);
    
    @(posedge axi4_vintf_h.ACLK);
    
   for(int i=0 ; i<(req_wr.AWLEN+1) ; i++) begin:for_1
      axi4_vintf_h.WDATA       <=  req_wr.WDATA[i];
      axi4_vintf_h.WSTRB       <=  req_wr.WSTRB[i];
      axi4_vintf_h.WLAST       <=  0;
      axi4_vintf_h.WUSER       <=  req_wr.WUSER;
      axi4_vintf_h.WVALID      <=  req_wr.WVALID;
      if(req_wr.AWLEN == i) begin:last_transfer
         axi4_vintf_h.WLAST       <=  1;
      end:last_transfer
      do begin
       @(posedge axi4_vintf_h.ACLK);
       req_wr.wait_count_write_data_channel++;
      end
      while(axi4_vintf_h.WREADY !== 1);
    end:for_1
      
    axi4_vintf_h.WLAST      <= 0;
    axi4_vintf_h.WVALID     <= 0;
     
    
    
  endtask:axi4_write_data_channel_task
    
  //--------------------------------------------------------------------
  // Task Name               : axi4_write_response_channel
  // Parameters              :
  // Class  Name             :axi4_master_driver
  // Parent class Name       :
  // Usage or Purpose        : It drives the write response bready and buser signals
  //--------------------------------------------------------------------
  task axi4_master_driver::axi4_write_response_channel_task(axi4_m_sequ_item_base  req_wr );
    do 
      begin
        @(posedge axi4_vintf_h.ACLK);
      end
    while(axi4_vintf_h.BVALID !== 1);
    
    repeat(req_wr.no_of_wait_states) begin
      @(posedge axi4_vintf_h.ACLK);
      axi4_vintf_h.BREADY <= 0 ;
      end
    //why he is storing the values don't know : 
    req_wr.BVALID  = axi4_vintf_h.BVALID;
    req_wr.BID     = axi4_vintf_h.BID;
    req_wr.BRESP   = axi4_vintf_h.BRESP;
    req_wr.BUSER   = axi4_vintf_h.BUSER;
//      data_write_packet.bvalid = bvalid;
//     data_write_packet.bid    = bid;
//     data_write_packet.bresp  = bresp;
//     data_write_packet.buser  = buser;
    axi4_vintf_h.BREADY <= 1;
    
    @( axi4_vintf_h.ACLK );
    axi4_vintf_h.BREADY <= 0;
    
  endtask:axi4_write_response_channel_task
  
  //--------------------------------------------------------------------
  // Task Name               : axi4_read_address_channel_task 
  // Parameters              :
  // Class  Name             :
  // Parent class Name       :
  // Usage or Purpose        : It drives the readd address/control signals onto the interface.
  //--------------------------------------------------------------------
   task axi4_master_driver::axi4_read_address_channel_task(axi4_m_sequ_item_base req_rd);
     //
      @(axi4_vintf_h.ACLK);
       axi4_vintf_h.ARID           <=   req_rd.ARID;
       axi4_vintf_h.ARADDR         <=   req_rd.ARADDR;
       axi4_vintf_h.ARLEN          <=   req_rd.ARLEN;
       axi4_vintf_h.ARSIZE         <=   req_rd.ARSIZE;
       axi4_vintf_h.ARBURST        <=   req_rd.ARBURST;
       axi4_vintf_h.ARLOCK         <=   req_rd.ARLOCK;
       axi4_vintf_h.ARCACHEE       <=   req_rd.ARCACHEE;
       axi4_vintf_h.ARPROT         <=   req_rd.ARPROT;
       axi4_vintf_h.ARQOS          <=   req_rd.ARQOS;
       axi4_vintf_h.ARREGION       <=   req_rd.ARREGION;
       axi4_vintf_h.ARUSER         <=   req_rd.ARUSER;
       axi4_vintf_h.ARVALID        <=   req_rd.ARVALID;
     
      do begin
        @(posedge axi4_vintf_h.ACLK);
        req_rd.wait_count_read_address_channel++;
      end
      while(axi4_vintf_h.ARREADY !== 1);
     
       axi4_vintf_h.ARVALID <= 0;
     
   endtask:axi4_read_address_channel_task
  
  //--------------------------------------------------------------------
  // Task Name               : axi4_read_data_channel_task
  // Parameters              :
  // Class  Name             :
  // Parent class Name       :
  // Usage or Purpose        : It drives the read data channel signals .
  //--------------------------------------------------------------------
   task axi4_master_driver::axi4_read_data_channel_task(axi4_m_sequ_item_base req_rd);
     
     static reg [7:0]i =0; // Local variable
     do begin
       @(posedge axi4_vintf_h.ACLK) ;
       axi4_vintf_h.RREADY <= 0; // intially dirving RREADY = 0;
     end
     while( axi4_vintf_h.RVALID === 0 );
       
       repeat(req_rd.no_of_wait_states) begin:repeat_1
         @(posedge axi4_vintf_h.ACLK);
       end:repeat_1
     axi4_vintf_h.RREADY <= 1;
     
     forever begin:for_1
       do begin
         @(posedge axi4_vintf_h.ACLK);
       end while(axi4_vintf_h.RVALID === 1'b0);
       
       req_rd.RID        = axi4_vintf_h.RID;
       req_rd.RDATA[i]   = axi4_vintf_h.RDATA;
       req_rd.RUSER      = axi4_vintf_h.RUSER;
       req_rd.RRESP      = axi4_vintf_h.RRESP;
       
//         data_read_packet.rid      = rid;
//       data_read_packet.rdata[i] = rdata;
//       data_read_packet.ruser    = ruser;
//       data_read_packet.rresp    = rresp;
//       `uvm_info(name,$sformatf("DEBUG_NA:RDATA[%0d]=%0h",i,data_read_packet.rdata[i]),UVM_HIGH)
        i++;  
      if(axi4_vintf_h.RLAST === 1'b1)begin:if_1
        i=0;
        break;
     end:if_1
    end:for_1
   
   
     @(posedge axi4_vintf_h.ACLK);
    axi4_vintf_h.RREADY <= 1'b0;
      
   endtask:axi4_read_data_channel_task
   
  //--------------------------------------------------------------------
  // Function/Task Name      : 
  // Parameters              :
  // Class  Name             :
  // Parent class Name       :
  // Usage or Purpose        :
  //--------------------------------------------------------------------
   
  
  //--------------------------------------------------------------------
  // Function/Task Name      : 
  // Parameters              :
  // Class  Name             :
  // Parent class Name       :
  // Usage or Purpose        :
  //--------------------------------------------------------------------
   
  
  
//===================================================================================================================
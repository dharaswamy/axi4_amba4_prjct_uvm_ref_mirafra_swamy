


class dummy_test extends uvm_test;
  
  `uvm_component_utils(dummy_test)
  
//   axi4_m_sequ_item_base#(.data_type(bit),
//                            .AWID_WIDTH(4),.AWADDR_WIDTH(32),.AWLEN_WIDTH(8),.AWSIZE_WIDTH(3),.AWBURST_WIDTH(2),.AWLOCK_WIDTH(1),.AWCACHEE_WIDTH(4),.AWQOS_WIDTH(4),.AWREGION_WIDTH(4),.AWUSER_WIDTH(1),.WID_WIDTH(4),.WDATA_WIDTH(32),.WSTRB_WIDTH(8),.WUSER_WIDTH(1),
//                            .BID_WIDTH(4),.BRESP_WIDTH(2),.BUSER_WIDTH(1),
//                            .ARID_WIDTH(4),.ARADDR_WIDTH(32),.ARLEN_WIDTH(8),.ARSIZE_WIDTH(3),.ARBURST_WIDTH(2),.ARLOCK_WIDTH(1),.ARCACHEE_WIDTH(4),.ARPROT_WIDTH(4),.ARQOS_WIDTH(4),.ARREGION_WIDTH(4),.ARUSER_WIDTH(1),
//                            .RID_WIDTH(4),.RDATA_WIDTH(32),.RUSER_WIDTH(1))  trans;
  axi4_m_sequ_item_base#() axi_trans;
  
  function new(string name = get_type_name(), uvm_component parent);
    super.new(name,parent);  
  endfunction:new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    axi_trans = axi4_m_sequ_item_base#()::type_id::create("axi_trans");
  endfunction:build_phase
  
  task run_phase(uvm_phase phase);
    
    super.run_phase(phase);
    
    
    
    
    
    
    
    //trans = axi4_m_sequ_item_base#(bit,4,32,8,3,2,1,4,3,4,4,1,4,32,8,1,4,2,1,4,32,8,3,2,1,4,4,4,4,1,4,32,1)::type_id::create("trans");
    axi_trans.print();
    
    endtask:run_phase
    
endclass:dummy_test
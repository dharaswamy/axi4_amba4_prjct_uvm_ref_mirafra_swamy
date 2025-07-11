
//--------------------------------------------------------------------------------------------
// Class Name : axi4_master_agent 
// Class Type : uvm component class 
// This agent is a configurable with respect to configuration which can create active and passive components
// It contains testbench components like sequencer,driver_proxy and monitor_proxy for AXI4
//--------------------------------------------------------------------------------------------


//------------------------------------------------------------------------------------------------------------

class axi4_master_agent extends uvm_agent;
 
// Factory Registration : This class is uvm component class so 
// registrary with the uvm_component_utils 
  `uvm_component_utils(axi4_master_agent) 
  
  
   // Varible: axi4_master_write_seqr_h 
  // Handle for master write sequencer
  axi4_master_write_sequencer axi4_master_write_seqr_h;
  
  // Varible: axi4_master_read_seqr_h 
  // Handle for master read sequencer
  axi4_master_read_sequencer axi4_master_read_seqr_h;
  
  // Variable Name : axi4_master_driver_h
  axi4_master_driver   axi4_master_driver_h;
  
  
 extern function new(string name="axi4_master_agent",uvm_component parent=null);
  
 extern function void build_phase(uvm_phase phase);
 
 extern function void connect_phase(uvm_phase phase);
     
endclass:axi4_master_agent

  function axi4_master_agent::new(string name="axi4_master_agent",uvm_component parent=null);
    super.new(name,parent);  
  endfunction:new
    
  
    function void axi4_master_agent::build_phase(uvm_phase phase);
      
      super.build_phase(phase);
      
    axi4_master_write_seqr_h=axi4_master_write_sequencer::type_id::create("axi4_master_write_seqr_h",this);
      
    axi4_master_read_seqr_h=axi4_master_read_sequencer::type_id::create("axi4_master_read_seqr_h",this);
      
    axi4_master_driver_h = axi4_master_driver::type_id::create("axi4_master_driver_h",this);
      
    endfunction:build_phase
   
   
   function void axi4_master_agent::connect_phase(uvm_phase phase);
     
     super.connect_phase(phase);
     
     axi4_master_driver_h.axi_write_seq_item_port.connect(axi4_master_write_seqr_h.seq_item_export);
     axi4_master_driver_h.axi_read_seq_item_port.connect(axi4_master_read_seqr_h.seq_item_export);
     
   endfunction:connect_phase
  
//============================================================================================================
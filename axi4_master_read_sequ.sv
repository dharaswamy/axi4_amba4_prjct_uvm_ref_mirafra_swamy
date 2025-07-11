
//----------------------------------------------------------------------
// Class Name : axi4_master_read_sequ
// Class type : uvm object class 
// Use        : 
// Parameterized : 
//---------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------------------------------

class axi4_master_read_sequ  extends uvm_sequence#(axi4_m_sequ_item_base);
  
  // Factory Registration of object class : 
  `uvm_object_utils(axi4_master_read_sequ)
  
  
extern function new(string name="axi4_master_read_sequ");
  
extern task body();
    

endclass:axi4_master_read_sequ
  
//================================================================================================================================
  
  
  function axi4_master_read_sequ::new(string name="axi4_master_read_sequ");
    super.new(name);
  endfunction:new
  
  
  task axi4_master_read_sequ::body();
    
    req = axi4_m_sequ_item_base#()::type_id::create("req");
    
    start_item(req);
    assert(req.randomize() with{ARVALID == 1 ; RDATA.size() == ARLEN+1; no_of_wait_states==5;})
      else `uvm_fatal("FATAL-RANDOMIZATION-FAILED","READ_TRANSACTION");
    finish_item(req);
    
  endtask:body
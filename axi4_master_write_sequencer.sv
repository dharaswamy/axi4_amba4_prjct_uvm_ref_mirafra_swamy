//----------------------------------------------------------------------
// Class Name : axi4_master_write_sequencer 
// Class type : uvm component class 
// Use        : It send the write sequences/transactions  to axi driver 
// Parameterized : with main transaction class : axi4_m_sequ_item_base
//---------------------------------------------------------------------


//-----------------------------------------------------------------------------------------------------------------

class axi4_master_write_sequencer extends uvm_sequencer#(axi4_m_sequ_item_base);
  
// Factory Registration : This class is uvm component class so 
// registrary with the uvm_component_utils 
  `uvm_component_utils(axi4_master_write_sequencer) 
  
  
// Variable Name : axi4_master_agent_cfg_h
// Declaring handle for master agent config class 
  axi4_master_agent_config   axi4_master_agent_cfg_h ;
  
// Function Name: new() - constructor
// Usage        : It calls the super class new() function with argurments 
  function new(string name = "axi4_master_write_sequencer",uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
endclass:axi4_master_write_sequencer



//=================================================================================================================




//----------------------------------------------------------------
//
//----------------------------------------------------------------


//-----------------------------------------------------------------------------------------------------------------




//=================================================================================================================
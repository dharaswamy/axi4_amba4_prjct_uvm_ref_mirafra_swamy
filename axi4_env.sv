

//--------------------------------------------------------------------------------------------
// Class Name : axi4_env
// Class Type : uvm component class 
// Description:
// Environment contains slave_agent_top,master_agent_top and axi4_virtual_sequencer
//--------------------------------------------------------------------------------------------


//------------------------------------------------------------------------------------------------------------

class axi4_env extends uvm_env;
  
// Factory Registration : This class is uvm component class so 
// registrary with the uvm_component_utils 
  `uvm_component_utils(axi4_env) 
  
  
 //Variable : axi4_master_agent_h
  //Declaring axi4 master agent handle 
  axi4_master_agent  axi4_master_agent_h; 
 
// Function Name: new() - constructor
// Usage        : It calls the super class new() function with argurments 
  function new(string name = "axi4_env",uvm_component parent);
    super.new(name,parent);
  endfunction:new

  extern function void build_phase(uvm_phase phase);
//  extern function void end_of_elaboration_phase(uvm_phase phase);
 // extern function void start_of_simulation_phase(uvm_phase phase);
    
endclass:axi4_env

   
    function void axi4_env::build_phase(uvm_phase phase);
      super.build_phase(phase);
      axi4_master_agent_h = axi4_master_agent::type_id::create("axi4_master_agent_h",this);
    endfunction:build_phase
    
   
    
//============================================================================================================
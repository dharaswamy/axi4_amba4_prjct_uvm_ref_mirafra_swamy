

//----------------------------------------------------------------------
// Class Name : axi4_test_base
// Class type : uvm component class 
// Use        : It send the read sequences/transactions  to axi driver 
// Parameterized : with main transaction class : axi4_m_sequ_item_base
//---------------------------------------------------------------------


//-----------------------------------------------------------------------------------------------------------------

class axi4_test_base extends uvm_test;
  
// Factory Registration : This class is uvm component class so 
// registrary with the uvm_component_utils 
  `uvm_component_utils(axi4_test_base) 
  
  
  // Factory 
  uvm_factory factory = uvm_factory::get();
  
  // Variable Name : axi4_env_h
  axi4_env  axi4_env_h;
  
  
  // sequences : 
  axi4_master_write_sequ  axi4_master_write_sequ_h;
  
  axi4_master_read_sequ   axi4_master_read_sequ_h;
  
// Function Name: new() - constructor
// Usage        : It calls the super class new() function with argurments 
  function new(string name = "axi4_test_base",uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  extern  function void build_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);
  extern function void start_of_simulation_phase(uvm_phase phase);
    extern task run_phase(uvm_phase phase);
    
endclass:axi4_test_base

    
   function void axi4_test_base::build_phase(uvm_phase phase);
     super.build_phase(phase);
     axi4_env_h = axi4_env::type_id::create("axi4_env_h",this);
     
     axi4_master_write_sequ_h = axi4_master_write_sequ::type_id::create("axi4_master_write_sequ_h");
     
     axi4_master_read_sequ_h = axi4_master_read_sequ::type_id::create("axi4_master_read_sequ_h");
     
   endfunction:build_phase
    
    function void axi4_test_base::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      
    endfunction:end_of_elaboration_phase
    
    function void axi4_test_base::start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);
      factory.print();
      uvm_top.print_topology();
    endfunction:start_of_simulation_phase
      
      task axi4_test_base::run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        fork
          axi4_master_write_sequ_h.start(axi4_env_h.axi4_master_agent_h.axi4_master_write_seqr_h);
          axi4_master_read_sequ_h.start(axi4_env_h.axi4_master_agent_h.axi4_master_read_seqr_h);
        join
        phase.phase_done.set_drain_time(this,5000);
        phase.drop_objection(this);
      endtask:run_phase
    
//=================================================================================================================
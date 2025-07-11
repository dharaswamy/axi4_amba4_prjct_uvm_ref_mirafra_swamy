//-------------------------------------------------------------
//
//-------------------------------------------------------------

//------------------------------------------------------------------------------------------------------------------------

class axi4_master_agent_config extends uvm_object;
  

// Factory Registration of object class : 
  `uvm_object_utils(axi4_master_agent_config)
  
//Function Name : constructor :new()
//Usage         : It calls the super class new() method with arguments
  
  function new(string name =get_type_name());
    super.new(name);
  endfunction:new
  
// Variable Name : is_active 
// Used for creating an agent in either in active mode or passive mode : 
 uvm_active_passive_enum is_active = UVM_ACTIVE ;
  
// Variable Name : has_coverage : 
// Used for enabling the master agent coverage : 
  bit has_coverage ;
  
// Variable Name : wait_count_write_address_channel 
//Used to determine the number of wait states inserted for write address channel. 
  int unsigned wait_count_write_address_channel;
  
// Variable Name : wait_count_write_data_channel
//Used to determine the number of wait states inserted for writd data channel.
 int unsigned wait_count_write_data_channel;
  
// Variable Name : wait_count_read_address_channel
//Used to determine the number of wait states inserted for  read address channel.
  int unsigned wait_count_read_address_channel;

 //Variable : outstanding_write_tx
  //Used to send the outstanding transactions
  rand int outstanding_write_tx;
  
  //Variable : outstanding_read_tx
  //Used to send the outstanding transactions
  rand int outstanding_read_tx;
  
endclass:axi4_master_agent_config

//========================================================================================================================


//-------------------------------------------------------------
//
//-------------------------------------------------------------



//-------------------------------------------------------------
//
//-------------------------------------------------------------



//-------------------------------------------------------------
//
//-------------------------------------------------------------

//-------------------------------------------------------------
//
//-------------------------------------------------------------

//-------------------------------------------------------------
//
//-------------------------------------------------------------
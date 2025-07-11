

//-----------------------------------------------------------------------------------------------
// Module Name : axi4_master_agent_bfm.sv
// Module:AXI4 Master Agent BFM
// This module is used as the configuration class for master agent bfm and its components
//-----------------------------------------------------------------------------------------------

module axi4_master_agent_bfm#(parameter int MASTER_ID = 0) (axi4_intf);
  
    //-------------------------------------------------------
   // Package : Importing Uvm Pakckage and Test Package
   //-------------------------------------------------------
  //import uvm_pkg::*;
 // `include "uvm_macros.svh"
  
  
  
  //-------------------------------------------------------
  // AXI4 Master Driver bfm instantiation
  //-------------------------------------------------------
  
  
   //-------------------------------------------------------
  // AXI4 Master monitor  bfm instantiation
  //--------------------------------------------------------
  
  
   //-------------------------------------------------------
  // Setting the virtual handle of BMFs into config_db
  //-------------------------------------------------------
  initial begin
    uvm_config_db#(virtual axi4_master_driver_bfm)::set(null,"*", "axi4_master_driver_bfm", axi4_master_drv_bfm_h); 
    uvm_config_db#(virtual axi4_master_monitor_bfm)::set(null,"*", "axi4_master_monitor_bfm", axi4_master_mon_bfm_h);
  end
  
  
  //Printing axi4 master agent bfm
  initial begin
    `uvm_info("axi4 master agent bfm",$sformatf("AXI4 MASTER AGENT BFM"),UVM_LOW);
  end
   
  
endmodule:axi4_master_agent_bfm










//--------------------------------------------------------------------------
//
//
//--------------------------------------------------------------------------

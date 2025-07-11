
//--------------------------------------------------------------------------
//Interface Name : axi4_master_driver_bfm
// Used as the HDL driver for axi4
//  It connects with the HVL driver_proxy for driving the stimulus
//--------------------------------------------------------------------------

interface axi4_master_driver_bfm( // write axi4 signals list );
  
  
    //-------------------------------------------------------
  // Importing UVM Package 
  //-------------------------------------------------------
 // import uvm_pkg::*;
 // `include "uvm_macros.svh" 

  
   //-------------------------------------------------------
  // Importing Global Package
  //-------------------------------------------------------
  import axi4_master_pkg::axi4_master_driver_proxy;

  
  //Variable: name
  //Used to store the name of the interface
  string name = "AXI4_MASTER_DRIVER_BFM"; 

  //Variable: axi4_master_driver_proxy_h
  //Creating the handle for master driver proxy
  axi4_master_driver_proxy axi4_master_drv_proxy_h;

  initial begin
    `uvm_info(name,$sformatf(name),UVM_LOW)
  end
  
  //-------------------------------------------------------
  // Task: wait_for_aresetn
  // Waiting for the system reset to be active low
  //-------------------------------------------------------
  
  
  
  

endinterface:axi4_master_driver_bfm
                                 
                                 
                                 
































//--------------------------------------------------------------------------
//
//
//--------------------------------------------------------------------------
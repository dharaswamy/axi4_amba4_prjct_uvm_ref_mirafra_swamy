

// Eda link : https://www.edaplayground.com/x/XDB7 


// ( swamy ) please copy the code but don't change/modify the code here.


/*

Project Name : axi_4 
ref          : github ref 
git hub ref  : https://github.com/mbits-mirafra/axi4_avip/blob/production/src/hvl_top/master/axi4_master_tx.sv

Status       : Under Development 

**/


`timescale  1ns/1ns 

`include "uvm_macros.svh"

import uvm_pkg::*;

`include "axi_global_defines.sv"

`include "axi4_globals_pkg.sv"

import axi4_globals_pkg::*;

`include "axi4_intf.sv"

`include "axi4_m_sequ_item_base.sv"

`include "axi4_master_write_sequ.sv"

`include "axi4_master_read_sequ.sv"

`include "axi4_master_agent_config.sv"

`include "axi4_master_write_sequencer.sv"

`include "axi4_master_read_sequencer.sv"

`include "axi4_master_driver.sv"

`include "axi4_master_agent.sv"

`include "axi4_env.sv"

`include "dummy_test.sv"

`include "axi4_test_base.sv"


module   axi4_tb_top;
  
  bit ACLK = 1'B0;
  
  bit ARESETn = 1'b1;
  

  
// AXI4 interface instantiation : 
axi4_intf  axi4_vintf_h(.ACLK(ACLK),.ARESETn(ARESETn));
  
 initial begin
   $dumpfile("dump.vcd");
   $dumpvars();
   uvm_config_db#(virtual axi4_intf)::set(uvm_root::get(),"*","axi4_vintf_h",axi4_vintf_h);
   run_test("axi4_test_base");
  end
  
// Global clock generation with time periode of 10 ns : 
  always  #5 ACLK = ~ ACLK;
  
  
endmodule:axi4_tb_top
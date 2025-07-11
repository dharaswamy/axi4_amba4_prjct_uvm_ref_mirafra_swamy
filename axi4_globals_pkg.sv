
//----------------------------------------------------------------------------------------------------------------

// Package: axi4_globals_pkg 
// Used for storing enums, parameters and defining the structs 

//----------------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------------------------------

package axi4_globals_pkg;


  //Parameter: ADDRESS_WIDTH
  //Used to set the address width to the address bus
  parameter int ADDRESS_WIDTH = `G_AXI_AWADDR_WIDTH;


  //Parameter: DATA_WIDTH
  //Used to set the data width 
  parameter int DATA_WIDTH = `G_AXI_WDATA_WIDTH;


  //Parameter: STROBE_WIDTH
  //Used to define the width of the strobes
  parameter int STROBE_WIDTH = (`G_AXI_WDATA_WIDTH/8);
  
  //--------------------------------------------------------------------------------------
  // Enums used in axi4_avip are given below
  //--------------------------------------------------------------------------------------
  
  //Enum: awburst_type_enum
  //Used to declare the enum type of write burst type
  
  typedef enum bit [(`G_AXI_AWBURST_WIDTH-1):0] {
              WRITE_FIXED_BURST  = 2'B00,
              WRITE_INCR_BURST   = 2'B01,
              WRITE_WRAP_BURST   = 2'B10,
              WRITE_RESERVED     = 2'B11
              } awburst_type_enum;
              
  // Enum : arburst_type_enum
  // Used to declare the enum type of read burst type
  
  typedef enum bit [(`G_AXI_ARBURST_WIDTH-1):0] {
                READ_FIXED_BURST  = 2'B00,
                READ_INCR_BURST   = 2'B01,
                READ_WRAP_BURST   = 2'B10,
                READ_RESERVED     = 2'B11
                }arburst_type_enum;
                
   // Enum : awsize_enum ( transfer_size_enum )            
   // Used to declare enum type for write transfer sizes (No of Bytes are transfer in single beat/single transfer )
   
   typedef enum bit[(`G_AXI_AWSIZE_WIDTH-1):0] { 
                WRITE_1_BYTE    = 3'B000,
                WRITE_2_BYTES   = 3'B001,
                WRITE_4_BYTES   = 3'B010,
                WRITE_8_BYTES   = 3'B011,
                WRITE_16_BYTES  = 3'B100,
                WRITE_32_BYTES  = 3'B101,
                WRITE_64_BYTES  = 3'B110,
                WRITE_128_BYTES = 3'B111
                } awsize_enum;
                
   // Enum : arsize_enum ( transfer_size_enum )            
   // Used to declare enum type for Read transfer sizes (No of Bytes are transfer in single beat/single transfer )             
   typedef enum bit[(`G_AXI_ARSIZE_WIDTH-1):0] { 
                READ_1_BYTE    = 3'B000,
                READ_2_BYTES   = 3'B001,
                READ_4_BYTES   = 3'B010,
                READ_8_BYTES   = 3'B011,
                READ_16_BYTES  = 3'B100,
                READ_32_BYTES  = 3'B101,
                READ_64_BYTES  = 3'B110,
                READ_128_BYTES = 3'B111
               } arsize_enum;
  
   //Enum : awlock_enum 
  // Used to declare enum type for write lock access : 
  
  `ifdef AXI3_PROJECT
    typedef enum bit[(`G_AXI_AWLOCK_WIDTH-1):0] {
           WRITE_NORMAL_ACCESS       = 2'B00,
           WRITE_EXCLUSIVE_ACCESS    = 2'B01,  
           WRITE_LOCK_ACCESS         = 2'B10,
           WRITE_RESERVED            = 2'B11
             } awlock_enum;
    `endif 
    
 `ifdef AXI4_PROJECT 
     typedef enum bit [(`G_AXI_AWLOCK_WIDTH-1):0] { 
        WRITE_NORMAL_ACCESS     = 1'B0,
        WRITE_EXCLUSIVE_ACCESS  = 1'B1
        } awlock_enum;
  `endif  

  //Enum: arlock_enum
  //Used to declare enum type for read lock access      
        
  `ifdef  AXI3_PROJECT
    typedef enum bit[(`G_AXI_ARLOCK_WIDTH-1):0] {
           READ_NORMAL_ACCESS       = 2'B00,
           READ_EXCLUSIVE_ACCESS    = 2'B01,  
           READ_LOCK_ACCESS         = 2'B10,
           READ_RESERVED            = 2'B11
    } arlock_enum;
  `endif 
  
 `ifdef AXI4_PROJECT 
     typedef enum bit [(`G_AXI_ARLOCK_WIDTH-1):0] { 
        READ_NORMAL_ACCESS     = 1'B0,
        READ_EXCLUSIVE_ACCESS  = 1'B1
     } arlock_enum;
 `endif 
  


  //Enum: awid_enum
  //Used to declare the enum type of write address channel ids : 
   typedef enum bit [(`G_AXI_AWID_WIDTH-1):0] { 
    AWID_0   =  0,
    AWID_1   =  1,
    AWID_2   =  2,
    AWID_3   =  3,
    AWID_4   =  4,
    AWID_5   =  5,
    AWID_6   =  6,
    AWID_7   =  7,
    AWID_8   =  8,
    AWID_9   =  9,
    AWID_10  = 10,
    AWID_11  = 11,
    AWID_12  = 12,
    AWID_13  = 13,
    AWID_14  = 14,
    AWID_15  = 15
   } awid_enum;
   
   
   //Enum: wid_enum
  //Used to declare the enum type of write data channel id : (axi4 removed the wid signal):
   `ifdef AXI3_PROJECT 
     typedef enum bit [(`G_AXI_WID_WIDTH-1):0] {
           WID_0   =  0,
           WID_1   =  1,
           WID_2   =  2,
           WID_3   =  3,
           WID_4   =  4,
           WID_5   =  5,
           WID_6   =  6,
           WID_7   =  7,
           WID_8   =  8,
           WID_9   =  9,
           WID_10  = 10,
           WID_11  = 11,
           WID_12  = 12,
           WID_13  = 13,
           WID_14  = 14,
           WID_15  = 15
           } wid_enum;
   `endif 
   
    //Enum: bid_enum
  //Used to declare the enum type of write response Channel id : 
  typedef enum bit [15:0] {
    BID_0  = 16'd0,
    BID_1  = 16'd1,
    BID_2  = 16'd2,
    BID_3  = 16'd3,
    BID_4  = 16'd4,
    BID_5  = 16'd5,
    BID_6  = 16'd6,
    BID_7  = 16'd7,
    BID_8  = 16'd8,
    BID_9  = 16'd9,
    BID_10 = 16'd10,
    BID_11 = 16'd11,
    BID_12 = 16'd12,
    BID_13 = 16'd13,
    BID_14 = 16'd14,
    BID_15 = 16'd15
  } bid_enum;

     
   //Enum: arid_enum
  //Used to declare the enum type of Read address channel ids:  
    typedef enum bit [(`G_AXI_ARID_WIDTH-1):0] { 
    ARID_0   =  0,
    ARID_1   =  1,
    ARID_2   =  2,
    ARID_3   =  3,
    ARID_4   =  4,
    ARID_5   =  5,
    ARID_6   =  6,
    ARID_7   =  7,
    ARID_8   =  8,
    ARID_9   =  9,
    ARID_10  = 10,
    ARID_11  = 11,
    ARID_12  = 12,
    ARID_13  = 13,
    ARID_14  = 14,
    ARID_15  = 15
    } arid_enum;
 
 
  //Enum: rid_enum
  //Used to declare the enum type of Read address channel ids:  
    typedef enum bit [(`G_AXI_RID_WIDTH-1):0] { 
    RID_0   =  0,
    RID_1   =  1,
    RID_2   =  2,
    RID_3   =  3,
    RID_4   =  4,
    RID_5   =  5,
    RID_6   =  6,
    RID_7   =  7,
    RID_8   =  8,
    RID_9   =  9,
    RID_10  = 10,
    RID_11  = 11,
    RID_12  = 12,
    RID_13  = 13,
    RID_14  = 14,
    RID_15  = 15
    } rid_enum;
 
   //Enum: bresp_enum : 
  //Used to declare the enum type of write response
typedef enum bit [(`G_AXI_BRESP_WIDTH-1):0] {
          WRITE_OKAY     = 2'B00,
          WRITE_EXOKAY   = 2'B01,
          WRITE_SLVERR   = 2'B10,
          WRITE_DECERR   = 2'B11
     } bresp_enum;
                
  //Enum: rresp_e
  //Used to declare the enum type of read response
   typedef enum bit [(`G_AXI_RRESP_WIDTH-1):0] {
     READ_OKAY      = 2'B00,
     READ_EXOKAY    = 2'B01,
     READ_SLVERR    = 2'B10,
     READ_DECERR    = 2'B11
  }rresp_enum;
  
    //Enum : transfer_type_e
  //Used to the determine the type of the transfer
  typedef enum bit[1:0] {
    BLOCKING_WRITE      = 2'b00, 
    BLOCKING_READ       = 2'b01, 
    NON_BLOCKING_WRITE  = 2'b10, 
    NON_BLOCKING_READ   = 2'b11 
  }transfer_type_enum;
  
  //Enum : transfer_type_e  
  //Used to determine the mode for score board check 
  typedef enum bit[1:0] {
    ONLY_WRITE_DATA  = 2'b00,
    ONLY_READ_DATA   = 2'b01,
    WRITE_READ_DATA  = 2'b10
  } write_read_data_mode_e;
  
  
   //Enum : Response_mode_e  
  //Used to determine the mode of response to send
  typedef enum bit[1:0] {
    RESP_IN_ORDER                 = 2'b00,
    ONLY_READ_RESP_OUT_OF_ORDER   = 2'b01,
    WRITE_READ_RESP_OUT_OF_ORDER  = 2'b10,
    ONLY_WRITE_RESP_OUT_OF_ORDER  = 2'b11
  } response_mode_e;

  //Enum : QoS_mode_e
  typedef enum bit[1:0] {
    QOS_MODE_DISABLE            = 2'b00,
    ONLY_READ_QOS_MODE_ENABLE   = 2'b01,
    WRITE_READ_QOS_MODE_ENABLE  = 2'b10,
    ONLY_WRITE_QOS_MODE_ENABLE  = 2'b11
  } qos_mode_e;

  //Used to store the awid for Qos mode
  awid_enum awid_queue_for_qos[$];
  
  
   //Enum: tx_type
  //Used to declare the type of transaction done
  typedef enum bit {
    WRITE = 1,
    READ  = 0
  } tx_type_e;


  //Enum : read_data_type_mode_e
  //Used to the determine the type of the read data
  typedef enum bit[1:0] {
    RANDOM_DATA_MODE = 2'b00,
    SLAVE_MEM_MODE   = 2'b01,
    USER_DATA_MODE   = 2'b10,
    SLAVE_ERR_RESP_MODE = 2'b11
  } read_data_type_mode_e;

endpackage:axi4_globals_pkg
//=======================================================================================================================================
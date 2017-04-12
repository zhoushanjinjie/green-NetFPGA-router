
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:25 08/26/2010 
// Design Name: 
// Module Name:    stream_man 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps
`include "registers.v"
`include "udp_defines.v"

module tick_regs  
 (
      input                                  reg_req_in,
      input                                  reg_ack_in,
      input                                  reg_rd_wr_L_in,
      input  [`UDP_REG_ADDR_WIDTH-1:0]       reg_addr_in,
      input  [`CPCI_NF2_DATA_WIDTH-1:0]      reg_data_in,
      input  [1:0]				reg_src_in,

      output reg                             reg_req_out,
      output reg                             reg_ack_out,
      output reg                             	reg_rd_wr_L_out,
      output reg [`UDP_REG_ADDR_WIDTH-1:0]	reg_addr_out,
      output reg [`CPCI_NF2_DATA_WIDTH-1:0]	reg_data_out,
      output reg [1:0]						reg_src_out,
		
		output reg					enable_ticks ,
		output reg					reset_ticks,
		input [63:0] 				data_tick,

      	input				 		clk,
      	input             			reset
   );

 
   // ------------- Internal parameters --------------
   parameter NUM_REGS_USED = 4; /* don't forget to update this when adding regs */
   parameter ADDR_WIDTH = 6;
   parameter UDP_REG_SRC_WIDTH = 2;
   // ------------- Wires/reg ------------------

   reg [63:0]               	       		ticks;
  wire [ADDR_WIDTH-1:0]                		addr;
   wire [3:0]              	     	  	reg_addr;
   wire [`UDP_BLOCK_SIZE_64_BLOCK_TAG_WIDTH-1:0]  tag_addr;
  
   // -------------- Logic --------------------

   assign addr      = reg_addr_in[ ADDR_WIDTH-1:0];
   assign reg_addr  = reg_addr_in[`UDP_BLOCK_SIZE_64_REG_ADDR_WIDTH -1 : 0];
   assign tag_addr  = reg_addr_in[`UDP_REG_ADDR_WIDTH - 1 : `UDP_BLOCK_SIZE_64_REG_ADDR_WIDTH];

   assign addr_good = (reg_addr<NUM_REGS_USED);
   assign tag_hit   =  tag_addr == `TICKS_BLOCK_ADDR  ;


   
always @(posedge clk) begin
      // Never modify the address/
   reg_rd_wr_L_out <= reg_rd_wr_L_in ;
	reg_addr_out <= reg_addr_in;
	reg_src_out <= reg_src_in;
		ticks <= data_tick;
     if( reset ) begin
        ticks<= 64'b0 ;
	enable_ticks <=1'b0;
	reset_ticks  <= 1'b0 ;
      end
      else begin
         if(reg_req_in && tag_hit) begin
            if(addr_good ) begin
			case (addr)
				`TICKS_H:		reg_data_out[31:0]  <= ticks[63:32] ;
				`TICKS_L:		reg_data_out[31:0]  <= ticks[31:0 ] ;
				`TICKS_ENABLE:		enable_ticks <= reg_data_in[0] ;
				`TICKS_RESET:		reset_ticks  <= reg_data_in[0] ;
				 default :		reg_data_out <= 32'habcd_abcd ;
			endcase 
        	       
	        end // (addr_good)
            else begin
               reg_data_out <= 32'hbbbb_eeee;
            end

            
            reg_ack_out <= 1'b1;
         end //reg_req_in && tag_hit
         else begin
            reg_ack_out <= reg_ack_in;
            reg_data_out <= reg_data_in;
         end
         reg_req_out <= reg_req_in;
      end // else: !if( reset )
   end // always @ (posedge clk)

endmodule // rate_lim_regs



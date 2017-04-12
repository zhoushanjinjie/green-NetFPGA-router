
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
//----------------------------------------------------------------------------
//
// Modified by Xiaowei Ma on 11 May 2012
//
// XM = Xiaowei Ma (ECONET intern simply Jan-May 2012)
// Modify data 26 Mar 2012 
//
// Add 3 Frequency 41.7MHz , 50Mhz and 83.3MHz
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps
`include "registers.v"
`include "udp_defines.v"

module tick_regs  
 (
      input                                     reg_req_in,
      input                                     reg_ack_in,
      input                                     reg_rd_wr_L_in,
      input  [`UDP_REG_ADDR_WIDTH-1:0]          reg_addr_in,
      input  [`CPCI_NF2_DATA_WIDTH-1:0]         reg_data_in,
      input  [1:0]				reg_src_in,

      output reg                                reg_req_out,
      output reg                                reg_ack_out,
      output reg                             	reg_rd_wr_L_out,
      output reg [`UDP_REG_ADDR_WIDTH-1:0]	reg_addr_out,
      output reg [`CPCI_NF2_DATA_WIDTH-1:0]	reg_data_out,
      output reg [1:0]				reg_src_out,
		
      output 					enable_ticks ,
      output 					reset_ticks,


      input [31:0]				data_tick_125, 
      input [31:0]                              num_bytes_stay,
      
      // modify
      output reg					choice_62_5, // modify
      output reg					choice_125,
      output reg					choice_83, // modify
      output reg					choice_50,
  
      	input				 	clk,
      	input             			reset
   );

 
   // ------------- Internal parameters --------------

   parameter NUM_REGS_USED = 8; /* don't forget to update this when adding regs */
   parameter ADDR_WIDTH = 6;
   parameter UDP_REG_SRC_WIDTH = 2;


   // ------------- Wires/reg ------------------


   wire [ADDR_WIDTH-1:0]                	addr;
   wire [3:0]              	     	  	reg_addr;
   wire [`UDP_BLOCK_SIZE_64_BLOCK_TAG_WIDTH-1:0]  tag_addr;
   reg [`CPCI_NF2_DATA_WIDTH-1:0]		reg_file [0:NUM_REGS_USED -1] ;
   wire 					full,empty;

   wire [`CPCI_NF2_DATA_WIDTH-1:0]					choice; // modify
   // -------------- Logic --------------------

   assign addr      = reg_addr_in[ ADDR_WIDTH-1:0];
   assign reg_addr  = reg_addr_in[`UDP_BLOCK_SIZE_64_REG_ADDR_WIDTH -1 : 0];
   assign tag_addr  = reg_addr_in[`UDP_REG_ADDR_WIDTH - 1 : `UDP_BLOCK_SIZE_64_REG_ADDR_WIDTH];
   assign choice    = reg_file[`TICK1_25][`CPCI_NF2_DATA_WIDTH-1:0] ;
   assign addr_good = (reg_addr<NUM_REGS_USED);
   assign tag_hit   =  tag_addr == `TICKS_BLOCK_ADDR  ;

//--- Add ctrl signal to change frequency, by XM on 10 May 2012
   assign reset_ticks  = reg_file[`TICKS_RESET] ;
   reg [3:0] counter;
	
	always @(posedge clk) begin
		if (num_bytes_stay <=32'd12510) begin // 7.8Mhz
			choice_50 = 0;
			choice_83 = 0;
			choice_62_5 = 0;
			choice_125 = 0;
			
			if (counter == 15) begin
				choice_125 = 1;
			end
			else begin
				counter <= counter+1;
			end
		end
		else if ( 32'd12510<num_bytes_stay && num_bytes_stay <= 32'd22620)begin // 15.6Mhz
			choice_50 = 1;
		        choice_83 = 0;
			choice_62_5 = 0;
			choice_125 = 0;
			
			if (counter == 15) begin
				choice_125 = 1;
			end
			else begin
				counter <= counter+1;
			end
			
		end
		else if ( 32'd22620<num_bytes_stay && num_bytes_stay <= 32'd50010)begin // 31.2mhz
			choice_50 = 0;
			choice_83 = 1;
			choice_62_5 = 0;
			choice_125 = 0;
			
			if (counter == 15) begin
				choice_125 = 1;
			end
			else begin
				counter <= counter+1;
			end
		end
		else if ( 32'd50010<num_bytes_stay && num_bytes_stay <= 32'd97360)begin // 62.5Mhz
		
			choice_50 = 0;
			choice_83 = 1;
			choice_62_5 = 1;
			choice_125 = 0;
		         
		end
		else begin // 125Mhz
			choice_50 = 0;
			choice_83 = 0;
			choice_62_5 = 0;
			choice_125 = 0;
			
			counter <= 0;
		end
	end

//--- end change

  always @(posedge clk) begin
      // Never modify the address/

        reg_rd_wr_L_out <= reg_rd_wr_L_in ;
	reg_addr_out <= reg_addr_in;
	reg_src_out <= reg_src_in;

	reg_file[`TICK_125] <= data_tick_125;
	reg_file[`TICK1_25] <= choice;

     if( reset ) begin
	reg_file[`TICKS_ENABLE]  <= 0;
	reg_file[`TICKS_RESET ]  <= 0;
	reg_file[`TICK_125]      <= 0;
	reg_file[`TICK83_3]      <= 0;
	reg_file[`TICK62_5]      <= 32'habcb_eedd;
	reg_file[`TICK12_5]      <= 32'habcb_edde;


      end
      else begin
         if(reg_req_in && tag_hit) begin
            if(addr_good ) begin
		 reg_data_out <= reg_file[addr] ;
                 if(!reg_rd_wr_L_in)
			reg_file[addr] <= reg_data_in ;	      
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

//=========================================================================
// --- add chipscope

    // Bidirs
	wire [35:0] CONTROL0;

	// Instantiate the Unit Under Test (UUT)
	icon_core icon_core_uut (
		.CONTROL0(CONTROL0)
	);
	// Bidirs

	// Instantiate the Unit Under Test (UUT)
	reg [7:0] TRIG0;
	reg [7:0] TRIG1;
	reg [7:0] TRIG2;
	reg [7:0] TRIG3;
	reg [7:0] TRIG4;
	reg [7:0] TRIG5;
	reg [7:0] TRIG6;
	reg [7:0] TRIG7;

	// Instantiate the Unit Under Test (UUT)
	ila_core ila_core_uut (
		.CLK(clk), 
		.CONTROL(CONTROL0), 
		.TRIG0(TRIG0),
		.TRIG1(TRIG1),
		.TRIG2(TRIG2),
		.TRIG3(TRIG3),
		.TRIG4(TRIG4),
		.TRIG5(TRIG5),
		.TRIG6(TRIG6),		
		.TRIG7(TRIG7)

		
	);




	
	always@(posedge clk)begin
// for checking output and input

    TRIG0  <= choice[7:0]; 
	TRIG1  <= choice[15:8] ;// rd_0_
	
	TRIG2  <= choice[23:16]; 
	TRIG3  <= choice[31:24] ;// rd_1_
	
	TRIG4  <= reg_file[`TICK1_25][7:0];
	TRIG5  <= reg_file[`TICK1_25][15:8];// wr_0_
	
	TRIG6  <= reg_file[`TICK1_25][23:16];
	TRIG7  <= reg_file[`TICK1_25][31:24];// wr_1_
	
	end

// end chipscope
//=========================================================================

endmodule // rate_lim_regs



///////////////////////////////////////////////////////////////////////////////
// vim:set shiftwidth=3 softtabstop=3 expandtab:
// $Id: cnet_sram_sm.v 6061 2010-04-01 20:53:23Z grg $
//
// Module: cnet_sram_sm.v
// Project: NetFPGA-1G
// Description: CNET SRAM controller
//
// Accepts requests for reading or writing and then services them in some
// sort of round-robin order.
//
// Set up to drive a Cypress cy7c1370 NOBL part (512Kx36), but anything with
// two clock delay from addr to data should be OK.
//
// We do not exploit the NOBL feature but instead we provide a bus turn around
// cycle because we can afford to do it.
//----------------------------------------------------------------------------
//
// Modified by Xiaowei Ma on 11 May 2012
//
// XM = Xiaowei Ma (ECONET intern simply Jan-May 2012)
// Modify data Feb 16 2012 - Feb 16 
// Add AFIFO between SRAM and OUTPUTQUEUES
// Modify the code from line 254
//
///////////////////////////////////////////////////////////////////////////////

`timescale  1ns /  10ps
module cnet_sram_sm  #(parameter SRAM_ADDR_WIDTH = 19,
                       parameter SRAM_DATA_WIDTH = 72 )

   (

   // --- Requesters (read and/or write)

   input                               wr_0_req,
   input      [SRAM_ADDR_WIDTH-1:0]    wr_0_addr,
   input      [SRAM_DATA_WIDTH-1:0]    wr_0_data,
   output reg                          wr_0_ack,

   input                               wr_1_req,
   input      [SRAM_ADDR_WIDTH-1:0]    wr_1_addr,
   input      [SRAM_DATA_WIDTH-1:0]    wr_1_data,
   output reg                          wr_1_ack,

   input                               rd_0_req,
   input      [SRAM_ADDR_WIDTH-1:0]    rd_0_addr,
   output reg [SRAM_DATA_WIDTH-1:0]    rd_0_data,
   output reg                          rd_0_ack,
   output reg                          rd_0_vld,

   input                               rd_1_req,
   input      [SRAM_ADDR_WIDTH-1:0]    rd_1_addr,
   output reg [SRAM_DATA_WIDTH-1:0]    rd_1_data,
   output reg                          rd_1_ack,
   output reg                          rd_1_vld,

   // --- SRAM signals (pins and control)

   output reg [SRAM_ADDR_WIDTH-1:0]    sram_addr,
   output reg                          sram_we,
   output reg [SRAM_DATA_WIDTH/9-1:0]  sram_bw,
   output reg [SRAM_DATA_WIDTH-1:0]    sram_wr_data,
   input      [SRAM_DATA_WIDTH-1:0]    sram_rd_data,
   output reg                          sram_tri_en,

   // --- Misc

   input reset,
   input clk,
   input clk_125 // add signal Feb 16 10:34

   );

   //
   // --- The state machine
   //

   reg [1:0] access, access_nxt, req_type;
   reg       state, state_nxt, ack_nxt, ld_count,choose_nxt;
   reg [4:0] count, count_next;
   reg       request, ld_addr;
   

   reg [1:0] current_port, next_port;

   

   // specify different access types. (NULL becomes a read)

   parameter NULL = 0,
             WRITE = 1,
             READ = 2;

   parameter IDLE = 0,
             BUSY = 1;

   always @* begin

      // set defaults

      ack_nxt    = 0;
      ld_count   = 0;
      state_nxt  = state;
      access_nxt = NULL;
      choose_nxt = 0;
      ld_addr = 0;

      case (state)

        IDLE: begin

           if (request) begin  // go service the request
              ack_nxt = 1;
              ld_count = 1;
              ld_addr = 1;
              state_nxt = BUSY;
           end
           else                // Still nuthing happenin'
             begin
                choose_nxt = 1;
             end
        end

        BUSY: begin

           if (!request) begin
              choose_nxt = 1;
              state_nxt = IDLE;
           end
           else if (count == 0 && next_port!=current_port) begin
              choose_nxt = 1;
              ld_addr    = 1;  // latch the selected address (and wr data)
              access_nxt = req_type;
              state_nxt  = IDLE;
           end
           else begin
              ack_nxt = 1;
              ld_addr = 1;  // latch the selected address (and wr data)
              access_nxt = req_type;
           end

        end

      endcase
   end // always @ *

   always @(posedge clk)
     if (reset) state <= IDLE;
     else state <= state_nxt;

   // simple counter to decide when to pre-empt current requester

   always @(posedge clk)
     if (reset) count <= 'h0;
     else
       if (ld_count) count <= count_next;
       else if (count != 0) count <= count - 1;

   //
   // --- OK, now we choose which port to service
   //

   parameter WR_0 = 0,
             WR_1 = 1,
             RD_0 = 2,
             RD_1 = 3;

   /* skew the counts so writes have more bw
    * This is needed to not have drops at the rx queues */
   always @* begin

      next_port = current_port;
      count_next = 20;

      case (current_port)

        WR_0: begin
           if (wr_1_req) next_port = WR_1;
           else if (rd_0_req) next_port = RD_0;
           else if (rd_1_req) next_port = RD_1;
           count_next = 20;
        end

        WR_1: begin
           if (rd_0_req) next_port = RD_0;
           else if (rd_1_req) next_port = RD_1;
           else if (wr_0_req) next_port = WR_0;
           count_next = 20;
        end

        RD_0: begin
           if (rd_1_req) next_port = RD_1;
           else if (wr_0_req) next_port = WR_0;
           else if (wr_1_req) next_port = WR_1;
//           count_next = 50;
           count_next = 15;
        end

        RD_1: begin
           if (wr_0_req) next_port = WR_0;
           else if (wr_1_req) next_port = WR_1;
           else if (rd_0_req) next_port = RD_0;
//           count_next = 50;
           count_next = 15;
        end

      endcase

   end

   always @(posedge clk)
     if (reset)
       current_port <= WR_0;
     else
       current_port <= (choose_nxt) ? next_port : current_port;

   // select/decode various signals

   reg [SRAM_ADDR_WIDTH-1:0]  addr_nxt;
   reg [SRAM_DATA_WIDTH-1:0]  wr_data_early_nxt, wr_data_early,wr_data_ph1 ;
   reg                        tri_en_ph1;

   always @* begin

      wr_data_early_nxt = wr_0_data;

      case (current_port)
        WR_0 : begin
           request  = wr_0_req;
           addr_nxt = wr_0_addr;
           wr_data_early_nxt = wr_0_data;
           req_type = WRITE;
        end
        WR_1 : begin
           request  = wr_1_req;
           addr_nxt = wr_1_addr;
           wr_data_early_nxt = wr_1_data;
           req_type = WRITE;
        end
        RD_0 : begin
           request  = rd_0_req;
           addr_nxt = rd_0_addr;
           req_type = READ;
        end
        RD_1 : begin
           request  = rd_1_req;
           addr_nxt = rd_1_addr;
           req_type = READ;
        end
        default: begin
           request = 0;
           addr_nxt = sram_addr;
           req_type = 0;
        end
      endcase
   end

// =====================================================================================================
// Begin insert AFIFO , modified on Feb 16 2012, by XM
// =====================================================================================================

   //
   // --- from clk to clk_125, according to FIFO ( means data from fifo to SRAM)
   //
   wire [95: 0]                 data_send_sram_clk125;
   reg         			        data_rd_en_clk125;
   wire				            empty_data_recv,full_data_recv;
   
   sram_data_afifo sram_data_recv_afifo (
	
		.dout(data_send_sram_clk125),
		.rd_clk(clk_125), 
		.rd_en(data_rd_en_clk125), 

		.din({wr_data_early_nxt,addr_nxt,ld_addr,access_nxt,rd_0_ack,rd_1_ack}),  // 72bit+19bit+1bit+2bit+1bit+1bit=96bit  
		.wr_clk(clk), 
		.wr_en( !full_data_recv ), 

		.rst(reset), 
		.empty(empty_data_recv), 
		.full(full_data_recv)
    );

    // control the read enable signal in clk125
    always @* begin
	    if (!empty_data_recv) begin
	        data_rd_en_clk125 = 1'b1;
	    end
	    else begin
	        data_rd_en_clk125 = 1'b0;
	    end
	end
	
	// read data from FIFO at 125Mhz

	reg [SRAM_ADDR_WIDTH-1:0]   addr_nxt_from_fifo;
    reg [SRAM_DATA_WIDTH-1:0]   wr_data_early_nxt_from_fifo;
	reg			                ld_addr_from_fifo;
	reg [1:0]		            access_nxt_from_fifo;
	reg                         rd_0_ack_from_fifo, rd_1_ack_from_fifo;

	always @(posedge clk_125) begin
		if(reset)begin 
  
			// Initialize regs
  
			addr_nxt_from_fifo 			    <= 19'b0 ;
			wr_data_early_nxt_from_fifo 	<= 72'b0 ;
			ld_addr_from_fifo  			    <=  1'b0 ;
			access_nxt_from_fifo			<=  2'b0 ;
			
			rd_0_ack_from_fifo              <=  1'b0;
			rd_1_ack_from_fifo              <=  1'b0;
	
		end
		else if (data_rd_en_clk125) begin
  
			// Recv data from fifo
  
            addr_nxt_from_fifo			     <= data_send_sram_clk125[23:5] ;   // addr_nxt
			wr_data_early_nxt_from_fifo      <= data_send_sram_clk125[SRAM_DATA_WIDTH+23:24] ;  // wr_data_early_nxt
			ld_addr_from_fifo			     <= data_send_sram_clk125[4] ;      // ld_addr
			access_nxt_from_fifo			 <= data_send_sram_clk125[3:2] ;    // access_nxt
			
			rd_0_ack_from_fifo              <=  data_send_sram_clk125[1];       // rd_0_ack
			rd_1_ack_from_fifo              <=  data_send_sram_clk125[0];       // rd_1_ack
			
		end
		else begin
			addr_nxt_from_fifo			     <= 'b0 ;   // addr_nxt
			wr_data_early_nxt_from_fifo      <= 'b0 ;  // wr_data_early_nxt
			ld_addr_from_fifo			     <= 'b0 ;      // ld_addr
			access_nxt_from_fifo			 <= 'b0;    // access_nxt
			
			rd_0_ack_from_fifo              <=  'b0;       // rd_0_ack
			rd_1_ack_from_fifo              <=  'b0;       // rd_1_ack
		end

	end
	
	// read data from SRAM
    reg [SRAM_DATA_WIDTH-1:0] rd_data_from_sram;
   
    always @(posedge clk_125) rd_data_from_sram <= sram_rd_data;

    // Generate signals to the SRAM
   
    // latch the address and write data. Delay data by two extra clocks.

    reg [3:0] rd_0_ack_del, rd_1_ack_del;
    reg [2:0] is_read;   // need to track the delayed access type to decide when
                         // the read data is valid.

    reg       rd_0_vld_sendto_fifo, rd_1_vld_sendto_fifo;    // send to fifo according to fifo send to rd_0_vld and rd_1_vld

    reg [SRAM_DATA_WIDTH-1:0]    rd_data_sendto_fifo;      // send to fifo according to fifo send to rd_0_data or rd_1_data
    
    // add addr to jud wheather the addr changed
    reg [SRAM_ADDR_WIDTH-1:0]   addr_early;
    reg [3:0]                   addr_change_delay;
    reg                         rd_data_sendto_fifo_en;
    reg                         delay_rd_0_vldto_change, delay_rd_1_vldto_change;


    always @(posedge clk_125) begin
   
        sram_addr      <= (ld_addr_from_fifo) ? addr_nxt_from_fifo : sram_addr; // addr be used to read and write
      
        wr_data_early  <= (ld_addr_from_fifo) ? wr_data_early_nxt_from_fifo : wr_data_early;
        wr_data_ph1    <= wr_data_early;
        sram_wr_data   <=
                          // synthesis translate_off
                          //#2
                          // synthesis translate_on
                          wr_data_ph1;
        sram_we        <= (access_nxt_from_fifo == WRITE) ? 0 : 1;  // active low
        sram_bw        <= (access_nxt_from_fifo == WRITE) ? 'h0 : ~ 'h0;  // active low
        access         <= access_nxt_from_fifo;
        tri_en_ph1     <= (access == WRITE);
        sram_tri_en    <=
                          // synthesis translate_off
                          //#2
                          // synthesis translate_on
                          tri_en_ph1;
                        
        
        // delay the rd_ack signals in order to generate the valid signals
        rd_0_ack_del <= {rd_0_ack_del[2:0],rd_0_ack_from_fifo};
        rd_1_ack_del <= {rd_1_ack_del[2:0],rd_1_ack_from_fifo};

        // delay the access type so we can tell when it was a read
        is_read      <= {is_read[1:0],(access == READ)};
      
        rd_0_vld_sendto_fifo  <= rd_0_ack_del[3] & is_read[2];
        rd_1_vld_sendto_fifo  <= rd_1_ack_del[3] & is_read[2];

        rd_data_sendto_fifo <= ((rd_0_ack_del[3] & is_read[2]) || (rd_1_ack_del[3] & is_read[2]) ) ? rd_data_from_sram : rd_data_sendto_fifo; // contain rd0 rd1
            
   end

   //
   // --- from clk_125 to clk, according to FIFO ( means read from SRAM)
   //
    
   // write into the FIFO
   wire [73:0]			rd_data_from_fifo_clk;
   
   wire                 empty_data_send, full_data_send;
  
    sram_rd_data_afifo sram_rd_data_send_afifo (

		.dout(rd_data_from_fifo_clk),
		.rd_clk(clk), 
		.rd_en(!empty_data_send), 

		.din({rd_data_sendto_fifo,rd_0_vld_sendto_fifo,rd_1_vld_sendto_fifo}), // 72bit + 1bit + 1bit = 74bit
		.wr_clk(clk_125), 
		.wr_en( rd_0_vld_sendto_fifo | rd_1_vld_sendto_fifo ), 

		.rst(reset), 
		.empty(empty_data_send), 
		.full(full_data_send)
	);
	
	// read data from fifo at clk
	reg [SRAM_DATA_WIDTH-1:0]    rd_data_from_fifo_sendto_rd0_rd1;
	reg                          rd_0_vld_from_fifo, rd_1_vld_from_fifo;
	reg							 rd_0_ack_from_fifo_toack, rd_1_ack_from_fifo_toack; // modify feb 22 12 51
	
	always@(posedge clk) begin
	
        if(!empty_data_send)begin
    		rd_data_from_fifo_sendto_rd0_rd1    <= rd_data_from_fifo_clk[SRAM_DATA_WIDTH+1:2] ;
    		rd_0_vld_from_fifo                  <= rd_data_from_fifo_clk[1] ; 
       		rd_1_vld_from_fifo                  <= rd_data_from_fifo_clk[0] ;
       		
    	end
    	else begin
    		rd_data_from_fifo_sendto_rd0_rd1    <= 'b0 ;
    		rd_0_vld_from_fifo                  <= 1'b0 ; 
       		rd_1_vld_from_fifo                  <= 1'b0 ; 
	
    	end
	
	end
	
	// send data to rd_0 rd_1 and ack to wr_0 wr_1 rd_0 rd_1
	always @(posedge clk) begin
      
      // send ack
      
      wr_0_ack <= reset ? 0 : (current_port == WR_0) & ack_nxt;
      wr_1_ack <= reset ? 0 : (current_port == WR_1) & ack_nxt;
      rd_0_ack <= reset ? 0 : (current_port == RD_0) & ack_nxt; // use to obtain addr
      rd_1_ack <= reset ? 0 : (current_port == RD_1) & ack_nxt;

 	 // end modify

      // send vld and data
        // rd_0
        if (rd_0_vld_from_fifo) begin
            rd_0_vld <= rd_0_vld_from_fifo;
            rd_0_data <= rd_data_from_fifo_sendto_rd0_rd1;
        end
        else begin
            rd_0_vld <= 1'b0;
        end

        // rd_1
        if (rd_1_vld_from_fifo) begin
            rd_1_vld <= rd_1_vld_from_fifo;
            rd_1_data <= rd_data_from_fifo_sendto_rd0_rd1;
        end
        else begin
            rd_1_vld <= 1'b0;
        end
   end
   
   
//=========================================================================
// --- add chipscope
/*
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

    TRIG0  <= {rd_0_addr[4:0],rd_0_req,rd_0_ack,rd_0_vld} ; 
	TRIG1  <= rd_0_data[7:0] ;// rd_0_
	
	TRIG2  <= {rd_1_addr[4:0],rd_1_req,rd_1_ack,rd_1_vld} ; 
	TRIG3  <= rd_1_data[7:0] ;// rd_1_
	
	TRIG4  <= {wr_0_addr[5:0],wr_0_req,wr_0_ack};
	TRIG5  <= wr_0_data[7:0];// wr_0_
	
	TRIG6  <= {wr_1_addr[5:0],wr_1_req,wr_1_ack};
	TRIG7  <= wr_1_data[7:0];// wr_1_
*/	
// for checking write data
/*
    TRIG0  <= sram_addr[7:0] ; 
	TRIG1  <= sram_addr[15:8] ;// address
	TRIG2  <= sram_wr_data[7:0] ; 
	TRIG3  <= sram_wr_data[15:8] ;
	TRIG4  <= sram_wr_data[23:16] ;// wr data
	
	TRIG5  <= sram_wr_data[31:24];
	TRIG6  <= sram_wr_data[39:32]; // wr data
	TRIG7  <= {addr_change_delay[3],rd_0_vld_sendto_fifo,rd_1_vld_sendto_fifo,sram_we,wr_0_ack,wr_1_ack,full_data_recv,data_rd_en_clk125} ;
*/	
// for checking read data
/*
	TRIG0  <= sram_addr[7:0] ; 
	TRIG1  <= sram_addr[15:8] ;// address
	TRIG2  <= rd_data_sendto_fifo[7:0] ; 
	TRIG3  <= rd_data_sendto_fifo[15:8] ;
	TRIG4  <= rd_data_sendto_fifo[23:16] ;// rd data
	
	TRIG5  <= addr_early[7:0];
	TRIG6  <= addr_early[15:8]; // read data
	TRIG7  <= {addr_change_delay[3:0],!empty_data_send,rd_0_vld_sendto_fifo,full_data_recv,data_rd_en_clk125} ;
*/
//	end

// end chipscope
//=========================================================================

// =====================================================================================================
// End insert FIFO
// =====================================================================================================
 
  
   // synthesis translate_off

   // Synthesis code to set the we flag to 0 on startup to remove the annoying
   // "Cypress SRAM stores 'h xxxxxxxxx at addr 'h xxxxx" messages at the
   // beginning of the log file until the clock starts running.
   initial
   begin
      sram_we = 1;
   end

   // synthesis translate_on

endmodule // cnet_sram_sm


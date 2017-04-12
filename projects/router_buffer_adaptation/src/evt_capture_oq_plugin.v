///////////////////////////////////////////////////////////////////////////////
// vim:set shiftwidth=3 softtabstop=3 expandtab:
// $Id: evt_capture_oq_plugin.v 3271 2008-01-29 22:33:17Z jnaous $
//
// Module: evt_capture_oq_plugin.v
// Project: NF2.1 router buffer sizing
// Description: counts number of packets and words in each output queue
//
///////////////////////////////////////////////////////////////////////////////

module evt_capture_oq_plugin

  #(parameter NUM_OUTPUT_QUEUES   = 8,
    parameter PKT_WORDS_WIDTH     = 8,
    parameter SRAM_ADDR_WIDTH     = 19,
    parameter NUM_OQ_WIDTH        = log2(NUM_OUTPUT_QUEUES),
    parameter SIG_VALUE_SIZE      = 8,
    parameter ALL_SIG_VALUES_SIZE = 3*SIG_VALUE_SIZE,
    parameter SIGNAL_ID_SIZE      = log2(NUM_OUTPUT_QUEUES),
    parameter ALL_SIGNAL_IDS_SIZE = 3*SIGNAL_ID_SIZE)

    ( input                                pkt_stored,
      input                                pkt_dropped,
      input [PKT_WORDS_WIDTH-1:0]          stored_pkt_total_word_length,
      input [NUM_OQ_WIDTH-1:0]             dst_oq,

      input                                pkt_removed,
      input [PKT_WORDS_WIDTH-1:0]          removed_pkt_total_word_length,
      input [NUM_OQ_WIDTH-1:0]             removed_oq,

      output [`CPCI_NF2_DATA_WIDTH*2*NUM_OUTPUT_QUEUES-1:0] oq_abs_regs,      
      
      // Interface to evt_rcrdr      
      
      output reg [2:0]                     oq_signals,
      output reg [ALL_SIGNAL_IDS_SIZE-1:0] oq_signal_ids,
      output reg [ALL_SIG_VALUES_SIZE-1:0] oq_signal_values,
      
      // ********************
      //   by ZHI in 3/2011
      // ********************
      input  [18:0]                        written_value,
      input                                new_value_set_done,
      output reg [18:0]                    new_buffer_value, 
      output reg                           new_value_set,     
      output reg [2:0]                     target_oq,
      
      input                                clk,
      input                                reset);


   function integer log2;
      input integer number;
      begin
         log2=0;
         while(2**log2<number) begin
            log2=log2+1;
         end
      end
   endfunction // log2

   // ----------------- Internal parameters ----------------
   parameter MAX_NUM_PKTS_WIDTH = SRAM_ADDR_WIDTH-3; // SRAM_WIDTH - min pkt size
   parameter MAX_WORDS_WIDTH    = SRAM_ADDR_WIDTH;   // SRAM_WIDTH

   // -------------------- wires/regs ----------------------
   reg [MAX_NUM_PKTS_WIDTH-1:0] num_pkts  [NUM_OUTPUT_QUEUES-1:0];
   reg [MAX_WORDS_WIDTH-1:0]    num_words [NUM_OUTPUT_QUEUES-1:0];

   integer                      i;

   // *******************************************************************
   //  by ZHI in 3/2011-- B is the output of the buffer sizing algorithm
   // *******************************************************************

   reg [2:0]                    buffer_level;

   // *******************************************************************
   //  Tom edit: new reg array to hold real time buffer size information
   //  & num_words_change is toggled if the value of num_words is changed 
   // *******************************************************************

   reg [18:0]                   buffer_value_table [7:0];
   reg                          reg_value_achieved;
   reg [18:0]                   new_buffer_value_temp;
   reg [2:0]                    oq_temp[1:0];


   // ---------------------- Logic -------------------------

   // *********************************************
   //   Buffer Trading Algorithm Implementation  
   //   code repositioned as it has to be in     
   //   the same always block                    
   // *********************************************    

   always @(posedge clk) begin
     
      if(reset) begin
         new_buffer_value_temp <= 0;
         new_buffer_value <= 0;
         new_value_set <= 0;
         for(i=0; i<NUM_OUTPUT_QUEUES; i=i+1) begin
            buffer_value_table[i] <= 0;
         end

      end
      else begin     

         // Save previous oq buffer value so we can see if this value
         // has changed later
      
         if (num_words[oq_temp[0]] <= 19'b11001100110) begin    //1638    
            new_buffer_value_temp <= 19'b1111100000000000;     // 512-16=496kB=63488 words
            oq_temp[1] <= oq_temp[0];
         end 
         else begin
            if (num_words[oq_temp[0]] <= 19'b1100110011001) begin     // 6553
               new_buffer_value_temp <= 19'b1110000000000000;    // 512-64=448KB=57344
               oq_temp[1] <= oq_temp[0];
            end 
            else begin
               if (num_words[oq_temp[0]] <= 19'b10111000000000) begin    // 11776
                  new_buffer_value_temp <= 19'b1010100000000000;      // 512-176=336KB=43008 words
                  oq_temp[1] <= oq_temp[0];
               end 
               else begin
                  if (num_words[oq_temp[0]] <= 19'b111010000000000) begin      // 29696
                     new_buffer_value_temp <= 19'b111000000000000;     //512-288=224KB=28672 words
                     oq_temp[1] <= oq_temp[0];
                  end 
                  else begin
                     if (num_words[oq_temp[0]] <= 19'b1011101000000000) begin     // 47616
                        new_buffer_value_temp <= 19'b11100000000000;     // 512-400=112KB=14336 words
                        oq_temp[1] <= oq_temp[0];
                     end 
                     else begin
                        new_buffer_value_temp <= 19'b0;    // 512-512=0KB=0 word
                        oq_temp[1] <= oq_temp[0];
                     end 
                  end
               end
            end
         end

         // If buffer level has changed, send signal to change the threshold     

         if (buffer_value_table[oq_temp[1]] != new_buffer_value_temp) begin
            new_value_set <= 1'b1;
            buffer_value_table[oq_temp[1]] <= new_buffer_value_temp;
            target_oq <= oq_temp[1];
            new_buffer_value <= new_buffer_value_temp;
         end
         else begin
            new_value_set <= 1'b0;
         end
      end //end of 'else' of reset
   
   end   // always @(num_words_change)

   // check whether the value is set into full_threshold reg from output of reg instance
   always @(posedge clk) begin

      if (new_value_set_done) begin
         reg_value_achieved <= 1'b1;
         case(written_value)
            19'b1111100000000000: buffer_level <= 3'b000; //63488 words for 16KB case
            19'b1110000000000000: buffer_level <= 3'b001;//57344 words for 64KB case
            19'b1010100000000000: buffer_level <= 3'b010;//43008 words for 176KB case
            19'b111000000000000:  buffer_level <= 3'b011;//28672 words for 288KB case
            19'b11100000000000:   buffer_level <= 3'b100;//14336 words for 400KB case
            19'b0:                buffer_level <= 3'b101;//0 words for 512KB case
         endcase
      end
      else begin
         reg_value_achieved <= 1'b0;
      end // end of 'new_value_set_done' 
   end

   // --- Count the number of pkts and words in the output queues

   always @(posedge clk) begin
      if(reset) begin
         for(i=0; i<NUM_OUTPUT_QUEUES; i=i+1) begin
            num_pkts[i]     <= 0;
            num_words[i]    <= 0;
         end
      end
      else begin
         if(dst_oq==removed_oq && pkt_stored && pkt_removed) begin
            num_words[dst_oq] <= num_words[dst_oq] +
                                 stored_pkt_total_word_length -
                                 removed_pkt_total_word_length;
            oq_temp[0] <= dst_oq;
         end
         else begin
            if(pkt_stored) begin
               num_pkts[dst_oq]  <= num_pkts[dst_oq] + 1'b1;
               num_words[dst_oq] <= num_words[dst_oq] + stored_pkt_total_word_length;
               oq_temp[0] <= dst_oq;  
            end

            if(pkt_removed) begin
               num_pkts[removed_oq]  <= num_pkts[removed_oq] - 1'b1;
               num_words[removed_oq] <= num_words[removed_oq] - removed_pkt_total_word_length;
               oq_temp[0] <= removed_oq;
            end
         end // else: !if(dst_oq==removed_oq && pkt_stored && pkt_removed)
      end // else: !if(reset) 
   end // always @ (posedge clk)   
     
   // --- Put all the values in a long array
   generate
      genvar j;
      for(j=0; j<NUM_OUTPUT_QUEUES; j=j+1) begin: pack_output
         assign oq_abs_regs[j*64+63:j*64] = {{(32-MAX_NUM_PKTS_WIDTH){1'b0}},
					     num_pkts[j],
					     {(32-MAX_WORDS_WIDTH){1'b0}},
					     num_words[j]};
      end
   endgenerate

   //--- Latch the signals to be sent to the event capture module
   always @(posedge clk) begin
      // signal the events
      oq_signals          <= {reg_value_achieved, pkt_removed, pkt_stored};
   
      // ********************      
      //   Modified section
      // ********************

      // set the size of the packet
      oq_signal_values    <= {{5{1'b0}},
                              buffer_level,
			      removed_pkt_total_word_length[SIG_VALUE_SIZE-1:0],
			      stored_pkt_total_word_length[SIG_VALUE_SIZE-1:0]};

      // send the queue on which the event occurred
      oq_signal_ids       <= {target_oq, removed_oq, dst_oq};
   end

endmodule // evt_capture_oq_plugin


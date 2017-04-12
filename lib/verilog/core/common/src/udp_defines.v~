`ifndef _UDP_DEFINES_
 `define _UDP_DEFINES_ 1

 // Each SRAM is 2MB (512k x 36 bits)
 // Carve it up to equal parts for each output queue
 `define OQ_DEFAULT_ADDR_LOW(j, num_oqs)  ((j)*20'h8_0000/(num_oqs))
 `define OQ_DEFAULT_ADDR_HIGH(j, num_oqs) (((j+1)*20'h8_0000/(num_oqs)) - 1)

 `define UDP_BLOCK_SIZE_64_BLOCK_ADDR_WIDTH	12
 `define UDP_BLOCK_SIZE_64_REG_ADDR_WIDTH	6
 `define UDP_BLOCK_SIZE_64_BLOCK_TAG_WIDTH	17
 
 `define TICKS_BLOCK_TAG			17'h0000c
 `define UDP_BASE_ADDRESS			0x2000000

 `define TICKS_ENABLE 				`UDP_BLOCK_SIZE_64_REG_ADDR_WIDTH'h0
 `define TICKS_RESET 				`UDP_BLOCK_SIZE_64_REG_ADDR_WIDTH'h1

 `define TICK_125 				`UDP_BLOCK_SIZE_64_REG_ADDR_WIDTH'h2	
 `define TICK83_3 				`UDP_BLOCK_SIZE_64_REG_ADDR_WIDTH'h3
 `define TICK62_5 				`UDP_BLOCK_SIZE_64_REG_ADDR_WIDTH'h4
 `define TICK12_5 				`UDP_BLOCK_SIZE_64_REG_ADDR_WIDTH'h5
 `define TICK1_25 				`UDP_BLOCK_SIZE_64_REG_ADDR_WIDTH'h6



 `define REG_TICKS_ENABLE 		(`UDP_BASE_ADDRESS | {`TICKS_BLOCK_TAG, `TICKS_ENABLE}) 
 `define REG_TICKS_RESET 		(`UDP_BASE_ADDRESS | {`TICKS_BLOCK_TAG, `TICKS_RESET}) 
 `define REG_TICKS_H 			(`UDP_BASE_ADDRESS | {`TICKS_BLOCK_TAG, `TICKS_H}) 
 `define REG_TICKS_L 			(`UDP_BASE_ADDRESS | {`TICKS_BLOCK_TAG, `TICKS_L}) 

//  $fwrite(c_reg_defines_fd,"#define TICKS_ENABLE_REG		0x% 07x\n",`REG_TICKS_ENABLE<<2) ;
// $fwrite(c_reg_defines_fd,"#define TICKS_RESET_REG		0x% 07x\n",`REG_TICKS_RESET<<2) ;
//  $fwrite(c_reg_defines_fd,"#define TICKS_H_REG		0x% 07x\n",`REG_TICKS_H<<2) ;
//  $fwrite(c_reg_defines_fd,"#define TICKS_L_REG		0x% 07x\n",`REG_TICKS_L<<2) ;

 
`endif //  `ifndef _UDP_DEFINES_



/* ****************************************************************************
 * $Id: regdump.c 5456 2009-05-05 18:22:05Z g9coving $
 *
 * Module: test.c
 * Project: NetFPGA 2.1 reference
 * Description: frequency adaptive router
 *
 * Change history:
 *
 */
#include <memory.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <net/if.h>
#include <time.h>
#include "../lib/C/reg_defines_ticks.h"
#include "../../../lib/C/common/nf2util.h"
#include <time.h>
#include <sys/time.h>
#include "../../cpci/lib/C/reg_defines_cpci.h"
#define ETHERNET_PORT0_FLAG 0
#define ETHERNET_PORT1_FLAG 1
#define ETHERNET_PORT2_FLAG 2
#define ETHERNET_PORT3_FLAG 3
#define PATHLEN		80
#define DEFAULT_IFACE	"nf2c0"
/* Global vars */
static struct nf2device nf2;
static int verbose = 0;
static int force_cnet = 0;
#define CLOCK_TEST_TICKS_REG   0x0880000
#define RESET_PERIOD    500000
#define MEASURE_PERIOD  500000
int main()
{
	unsigned ticks,ticks1,val;
	unsigned rx_0_mac_pkt_num,rx_0_mac_byte_num;
	unsigned rx_1_mac_pkt_num,rx_1_mac_byte_num;
	unsigned rx_2_mac_pkt_num,rx_2_mac_byte_num;
	unsigned rx_3_mac_pkt_num,rx_3_mac_byte_num;
	int	i ;
	unsigned byte_counter;
	struct timeval start_time;
  	struct timeval end_time;
  	struct timeval delta;
	double rate ;
        char flag[4];
        char mode,mode_set;
        memset(flag,0,4*sizeof(char)) ;
	nf2.device_name = DEFAULT_IFACE;

	if (check_iface(&nf2))
	{
		exit(1);
	}
	if (openDescriptor(&nf2))
	{
		exit(1);
	}

  	
while(1)
	{






        byte_counter = 0 ;
	readReg(&nf2, MAC_GRP_0_RX_QUEUE_NUM_PKTS_STORED_REG, &rx_0_mac_pkt_num);
	readReg(&nf2, MAC_GRP_1_RX_QUEUE_NUM_PKTS_STORED_REG, &rx_1_mac_pkt_num);
	readReg(&nf2, MAC_GRP_2_RX_QUEUE_NUM_PKTS_STORED_REG, &rx_2_mac_pkt_num);
	readReg(&nf2, MAC_GRP_3_RX_QUEUE_NUM_PKTS_STORED_REG, &rx_3_mac_pkt_num);
	readReg(&nf2, MAC_GRP_0_RX_QUEUE_NUM_BYTES_PUSHED_REG, &rx_0_mac_byte_num);
	readReg(&nf2, MAC_GRP_1_RX_QUEUE_NUM_BYTES_PUSHED_REG, &rx_1_mac_byte_num);
	readReg(&nf2, MAC_GRP_2_RX_QUEUE_NUM_BYTES_PUSHED_REG, &rx_2_mac_byte_num);
	readReg(&nf2, MAC_GRP_3_RX_QUEUE_NUM_BYTES_PUSHED_REG, &rx_3_mac_byte_num);
	usleep(1000000);
	readReg(&nf2, MAC_GRP_0_RX_QUEUE_NUM_PKTS_STORED_REG, &val);
	printf("Num pkts from ethernet port 0 pre second:            %u\n", val-rx_0_mac_pkt_num);
        if(val-rx_0_mac_pkt_num > 0)flag[ETHERNET_PORT0_FLAG] = 1 ; 
	else flag[ETHERNET_PORT0_FLAG] = 0 ;
	rx_0_mac_pkt_num = val;

	readReg(&nf2, MAC_GRP_0_RX_QUEUE_NUM_BYTES_PUSHED_REG, &val);
	printf("Num words from ethernet port 0 pre second:           %u\n", val-rx_0_mac_byte_num);
	rx_0_mac_byte_num = val;
        byte_counter += val ;
	readReg(&nf2, MAC_GRP_1_RX_QUEUE_NUM_PKTS_STORED_REG, &val);
	printf("Num pkts from ethernet port 1 pre second:            %u\n", val-rx_1_mac_pkt_num);
        if(val-rx_1_mac_pkt_num > 0)flag[ETHERNET_PORT1_FLAG] = 1 ; 
	else flag[ETHERNET_PORT1_FLAG] = 0 ;
	rx_1_mac_pkt_num = val;

	readReg(&nf2, MAC_GRP_1_RX_QUEUE_NUM_BYTES_PUSHED_REG, &val);
	printf("Num words from ethernet port 1 pre second:           %u\n", val-rx_1_mac_byte_num);
	rx_1_mac_byte_num = val;
        byte_counter += val ;
	readReg(&nf2, MAC_GRP_2_RX_QUEUE_NUM_PKTS_STORED_REG, &val);
	printf("Num pkts from Ethernet port 2 pre second:            %u\n", val-rx_2_mac_pkt_num);
        if(val-rx_2_mac_pkt_num > 0)flag[ETHERNET_PORT2_FLAG] = 1 ; 
	else flag[ETHERNET_PORT2_FLAG] = 0 ;
	rx_2_mac_pkt_num = val;

	readReg(&nf2, MAC_GRP_2_RX_QUEUE_NUM_BYTES_PUSHED_REG, &val);
	printf("Num words from ethernet port 2 pre second:           %u\n", val-rx_2_mac_byte_num);
	rx_2_mac_byte_num = val;
        byte_counter += val ;
	readReg(&nf2, MAC_GRP_3_RX_QUEUE_NUM_PKTS_STORED_REG, &val);
	printf("Num pkts from ethernet port 3 pre second:            %u\n", val-rx_3_mac_pkt_num);
        if(val-rx_3_mac_pkt_num > 0)flag[ETHERNET_PORT3_FLAG] = 1 ; 
	else flag[ETHERNET_PORT3_FLAG] = 0 ;
	rx_3_mac_pkt_num = val;

	readReg(&nf2, MAC_GRP_3_RX_QUEUE_NUM_BYTES_PUSHED_REG, &val);
	printf("Num words from ethernet port 3 pre second:           %u\n", val-rx_3_mac_byte_num);
	rx_3_mac_byte_num = val; 

        byte_counter += val ; 


//// 	Changing frequency according to number of active port

	if(flag[ETHERNET_PORT0_FLAG] + flag[ETHERNET_PORT1_FLAG] + flag[ETHERNET_PORT2_FLAG] +flag[ETHERNET_PORT3_FLAG] <2)mode = 0 ;

//// 	Changing frequency according to overall throughtput

        else if(byte_counter < 10)mode = 0 ;

	else mode = 1 ;

	if(mode != mode_set) 
	{
		mode_set = mode;

//	Reg addr to change frequency
//      0       125 MHz
//      1       62.5MHz
		writeReg(&nf2, 0x2000218, 1-mode_set);

	        if(mode_set == 0)printf( "Changing frequency to 62.5MHz... ");
			else printf("Changing frequency to 125MHz... ");
		usleep(500000);
	 			
       		printf("   done!\n");
	}


	usleep(4000000);
	printf("\n\n===========================================\n\n") ;
}
   return 1 ;
}

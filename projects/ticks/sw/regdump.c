/* ****************************************************************************
 * $Id: regdump.c 5456 2009-05-05 18:22:05Z g9coving $
 *
 * Module: regdump.c
 * Project: NetFPGA 2.1 reference
 * Description: Test program to dump the switch registers
 *
 * Change history:
 *
 */

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

#define PATHLEN		80

#define DEFAULT_IFACE	"nf2c0"

/* Global vars */
static struct nf2device nf2;
static int verbose = 0;
static int force_cnet = 0;

/* Function declarations */
void print (void);
void printMAC (unsigned, unsigned);
void printIP (unsigned);

int main(int argc, char *argv[])
{
	unsigned val;

	nf2.device_name = DEFAULT_IFACE;

	if (check_iface(&nf2))
	{
		exit(1);
	}
	if (openDescriptor(&nf2))
	{
		exit(1);
	}

	print();

	closeDescriptor(&nf2);

	return 0;
}

void print(void) {
	unsigned val, val2;
	int i;

	//	readReg(&nf2, UNET_ID, &val);
	//	printf("Board ID: Version %i, Device %i\n", GET_VERSION(val), GET_DEVICE(val));
	readReg(&nf2, MAC_GRP_0_CONTROL_REG, &val);
	printf("MAC 0 Control: 0x%08x ", val);
	if(val&(1<<MAC_GRP_TX_QUEUE_DISABLE_BIT_NUM)) {
	  printf("TX disabled, ");
	}
	else {
	  printf("TX enabled,  ");
	}
	if(val&(1<<MAC_GRP_RX_QUEUE_DISABLE_BIT_NUM)) {
	  printf("RX disabled, ");
	}
	else {
	  printf("RX enabled,  ");
	}
	if(val&(1<<MAC_GRP_RESET_MAC_BIT_NUM)) {
	  printf("reset on\n");
	}
	else {
	  printf("reset off\n");
	}
	printf("mac config 0x%02x\n", val>>MAC_GRP_MAC_DISABLE_TX_BIT_NUM);

	readReg(&nf2, MAC_GRP_0_RX_QUEUE_NUM_PKTS_STORED_REG, &val);
	printf("Num pkts enqueued to rx queue 0:      %u\n", val);
	readReg(&nf2, MAC_GRP_0_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG, &val);
	printf("Num pkts dropped (rx queue 0 full): %u\n", val);
	readReg(&nf2, MAC_GRP_0_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG, &val);
	printf("Num pkts dropped (bad fcs q 0):     %u\n", val);
	readReg(&nf2, MAC_GRP_0_RX_QUEUE_NUM_WORDS_PUSHED_REG, &val);
	printf("Num words pushed out of rx queue 0: %u\n", val);
	readReg(&nf2, MAC_GRP_0_RX_QUEUE_NUM_BYTES_PUSHED_REG, &val);
	printf("Num bytes pushed out of rx queue 0: %u\n", val);
	readReg(&nf2, MAC_GRP_0_RX_QUEUE_NUM_PKTS_DEQUEUED_REG, &val);
	printf("Num pkts dequeued from rx queue 0: %u\n", val);
	readReg(&nf2, MAC_GRP_0_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG, &val);
	printf("Num pkts in rx queue 0: %u\n\n", val);

	readReg(&nf2, MAC_GRP_0_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG, &val);
	printf("Num pkts in tx queue 0:             %u\n", val);
	readReg(&nf2, MAC_GRP_0_TX_QUEUE_NUM_PKTS_SENT_REG, &val);
	printf("Num pkts dequeued from tx queue 0:           %u\n", val);
	readReg(&nf2, MAC_GRP_0_TX_QUEUE_NUM_WORDS_PUSHED_REG, &val);
	printf("Num words pushed out of tx queue 0: %u\n", val);
	readReg(&nf2, MAC_GRP_0_TX_QUEUE_NUM_BYTES_PUSHED_REG, &val);
	printf("Num bytes pushed out of tx queue 0: %u\n", val);
	readReg(&nf2, MAC_GRP_0_TX_QUEUE_NUM_PKTS_ENQUEUED_REG, &val);
	printf("Num pkts enqueued to tx queue 0: %u\n\n", val);

	readReg(&nf2, IN_ARB_NUM_PKTS_SENT_REG, &val);
	printf("IN_ARB_NUM_PKTS_SENT                  %u\n", val);
	readReg(&nf2, IN_ARB_LAST_PKT_WORD_0_LO_REG, &val);
	printf("IN_ARB_LAST_PKT_WORD_0_LO             0x%08x\n", val);
	readReg(&nf2, IN_ARB_LAST_PKT_WORD_0_HI_REG, &val);
	printf("IN_ARB_LAST_PKT_WORD_0_HI             0x%08x\n", val);
	readReg(&nf2, IN_ARB_LAST_PKT_CTRL_0_REG, &val);
	printf("IN_ARB_LAST_PKT_CTRL_0                0x%02x\n", val);
	readReg(&nf2, IN_ARB_LAST_PKT_WORD_1_LO_REG, &val);
	printf("IN_ARB_LAST_PKT_WORD_1_LO             0x%08x\n", val);
	readReg(&nf2, IN_ARB_LAST_PKT_WORD_1_HI_REG, &val);
	printf("IN_ARB_LAST_PKT_WORD_1_HI             0x%08x\n", val);
	readReg(&nf2, IN_ARB_LAST_PKT_CTRL_1_REG, &val);
	printf("IN_ARB_LAST_PKT_CTRL_1                0x%02x\n", val);
	readReg(&nf2, IN_ARB_STATE_REG, &val);
	printf("IN_ARB_STATE                          %u\n\n", val);

	readReg(&nf2, OQ_QUEUE_0_NUM_WORDS_LEFT_REG, &val);
	printf("OQ_QUEUE_0_NUM_WORDS_LEFT                   %u\n", val);
	readReg(&nf2, OQ_QUEUE_0_NUM_PKT_BYTES_STORED_REG, &val);
	printf("OQ_QUEUE_0_NUM_PKT_BYTES_STORED             %u\n", val);
	readReg(&nf2, OQ_QUEUE_0_NUM_OVERHEAD_BYTES_STORED_REG, &val);
	printf("OQ_QUEUE_0_NUM_OVERHEAD_BYTES_STORED        %u\n", val);
	readReg(&nf2, OQ_QUEUE_0_NUM_PKTS_STORED_REG, &val);
	printf("OQ_QUEUE_0_NUM_PKTS_STORED                  %u\n", val);
	readReg(&nf2, OQ_QUEUE_0_NUM_PKTS_DROPPED_REG, &val);
	printf("OQ_QUEUE_0_NUM_PKTS_DROPPED                 %u\n", val);
	readReg(&nf2, OQ_QUEUE_0_NUM_PKT_BYTES_REMOVED_REG, &val);
	printf("OQ_QUEUE_0_NUM_PKT_BYTES_REMOVED            %u\n", val);
	readReg(&nf2, OQ_QUEUE_0_NUM_OVERHEAD_BYTES_REMOVED_REG, &val);
	printf("OQ_QUEUE_0_NUM_OVERHEAD_BYTES_REMOVED       %u\n", val);
	readReg(&nf2, OQ_QUEUE_0_NUM_PKTS_REMOVED_REG, &val);
	printf("OQ_QUEUE_0_NUM_PKTS_REMOVED                 %u\n", val);
	readReg(&nf2, OQ_QUEUE_0_ADDR_LO_REG, &val);
	printf("OQ_QUEUE_0_ADDR_LO                       0x%08x\n", val);
	readReg(&nf2, OQ_QUEUE_0_ADDR_HI_REG, &val);
	printf("OQ_QUEUE_0_ADDR_HI                       0x%08x\n", val);
	readReg(&nf2, OQ_QUEUE_0_WR_ADDR_REG, &val);
	printf("OQ_QUEUE_0_WR_ADDR                       0x%08x\n", val);
	readReg(&nf2, OQ_QUEUE_0_RD_ADDR_REG, &val);
	printf("OQ_QUEUE_0_RD_ADDR                       0x%08x\n", val);
	readReg(&nf2, OQ_QUEUE_0_NUM_PKTS_IN_Q_REG, &val);
	printf("OQ_QUEUE_0_NUM_PKTS_IN_Q                    %u\n", val);
	readReg(&nf2, OQ_QUEUE_0_MAX_PKTS_IN_Q_REG, &val);
	printf("OQ_QUEUE_0_MAX_PKTS_IN_Q                    %u\n", val);
	readReg(&nf2, OQ_QUEUE_0_CTRL_REG, &val);
	printf("OQ_QUEUE_0_CTRL                          0x%08x\n\n", val);

	readReg(&nf2, OQ_QUEUE_1_NUM_WORDS_LEFT_REG, &val);
	printf("OQ_QUEUE_1_NUM_WORDS_LEFT                   %u\n", val);
	readReg(&nf2, OQ_QUEUE_1_NUM_PKT_BYTES_STORED_REG, &val);
	printf("OQ_QUEUE_1_NUM_PKT_BYTES_STORED             %u\n", val);
	readReg(&nf2, OQ_QUEUE_1_NUM_OVERHEAD_BYTES_STORED_REG, &val);
	printf("OQ_QUEUE_1_NUM_OVERHEAD_BYTES_STORED        %u\n", val);
	readReg(&nf2, OQ_QUEUE_1_NUM_PKTS_STORED_REG, &val);
	printf("OQ_QUEUE_1_NUM_PKTS_STORED                  %u\n", val);
	readReg(&nf2, OQ_QUEUE_1_NUM_PKTS_DROPPED_REG, &val);
	printf("OQ_QUEUE_1_NUM_PKTS_DROPPED                 %u\n", val);
	readReg(&nf2, OQ_QUEUE_1_NUM_PKT_BYTES_REMOVED_REG, &val);
	printf("OQ_QUEUE_1_NUM_PKT_BYTES_REMOVED            %u\n", val);
	readReg(&nf2, OQ_QUEUE_1_NUM_OVERHEAD_BYTES_REMOVED_REG, &val);
	printf("OQ_QUEUE_1_NUM_OVERHEAD_BYTES_REMOVED       %u\n", val);
	readReg(&nf2, OQ_QUEUE_1_NUM_PKTS_REMOVED_REG, &val);
	printf("OQ_QUEUE_1_NUM_PKTS_REMOVED                 %u\n", val);
	readReg(&nf2, OQ_QUEUE_1_ADDR_LO_REG, &val);
	printf("OQ_QUEUE_1_ADDR_LO                       0x%08x\n", val);
	readReg(&nf2, OQ_QUEUE_1_ADDR_HI_REG, &val);
	printf("OQ_QUEUE_1_ADDR_HI                       0x%08x\n", val);
	readReg(&nf2, OQ_QUEUE_1_WR_ADDR_REG, &val);
	printf("OQ_QUEUE_1_WR_ADDR                       0x%08x\n", val);
	readReg(&nf2, OQ_QUEUE_1_RD_ADDR_REG, &val);
	printf("OQ_QUEUE_1_RD_ADDR                       0x%08x\n", val);
	readReg(&nf2, OQ_QUEUE_1_NUM_PKTS_IN_Q_REG, &val);
	printf("OQ_QUEUE_1_NUM_PKTS_IN_Q                    %u\n", val);
	readReg(&nf2, OQ_QUEUE_1_MAX_PKTS_IN_Q_REG, &val);
	printf("OQ_QUEUE_1_MAX_PKTS_IN_Q                    %u\n", val);
	readReg(&nf2, OQ_QUEUE_1_CTRL_REG, &val);
	printf("OQ_QUEUE_1_CTRL                          0x%08x\n\n", val);

}

//
// printMAC: print a MAC address as a : separated value. eg:
//    00:11:22:33:44:55
//
void printMAC(unsigned hi, unsigned lo)
{
	printf("%02x:%02x:%02x:%02x:%02x:%02x",
			((hi>>8)&0xff), ((hi>>0)&0xff),
			((lo>>24)&0xff), ((lo>>16)&0xff), ((lo>>8)&0xff), ((lo>>0)&0xff)
		);
}


//
// printIP: print an IP address in dotted notation. eg: 192.168.0.1
//
void printIP(unsigned ip)
{
	printf("%u.%u.%u.%u",
			((ip>>24)&0xff), ((ip>>16)&0xff), ((ip>>8)&0xff), ((ip>>0)&0xff)
		);
}

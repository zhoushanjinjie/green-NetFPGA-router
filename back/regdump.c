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
#include <sys/time.h>
#include "../lib/C/reg_defines_reference_router.h"
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
	unsigned int rate;
	unsigned mac0_recv_byte,mac0_recv_pkt,mac0_sent_byte,mac0_sent_pkt;
	unsigned mac1_recv_byte,mac1_recv_pkt,mac1_sent_byte,mac1_sent_pkt;
	unsigned mac2_recv_byte,mac2_recv_pkt,mac2_sent_byte,mac2_sent_pkt;
	unsigned mac3_recv_byte,mac3_recv_pkt,mac3_sent_byte,mac3_sent_pkt;
 
 	struct timeval mac0_time_recv,mac1_time_recv,mac2_time_recv,mac3_time_recv,t;
  	struct timeval mac0_time_sent,mac1_time_sent,mac2_time_sent,mac3_time_sent;

  	struct timeval mac0_time_recv_prev,mac1_time_recv_prev,mac2_time_recv_prev,mac3_time_recv_prev;
  	struct timeval mac0_time_sent_prev,mac1_time_sent_prev,mac2_time_sent_prev,mac3_time_sent_prev;

	unsigned mac0_recv_byte_prev,mac0_recv_pkt_prev,mac0_sent_byte_prev,mac0_sent_pkt_prev;
	unsigned mac1_recv_byte_prev,mac1_recv_pkt_prev,mac1_sent_byte_prev,mac1_sent_pkt_prev;
	unsigned mac2_recv_byte_prev,mac2_recv_pkt_prev,mac2_sent_byte_prev,mac2_sent_pkt_prev;
	unsigned mac3_recv_byte_prev,mac3_recv_pkt_prev,mac3_sent_byte_prev,mac3_sent_pkt_prev;
	val=0;
	val2 = 0 ;
	int i;
while(1)
{
//	Mac0
//	Receive
	printf("\n\n\t\tNetFPGA router transmint/receive summary	 \n\n\n");

	readReg(&nf2, MAC_GRP_0_RX_QUEUE_NUM_BYTES_PUSHED_REG, &mac0_recv_byte);
	readReg(&nf2, MAC_GRP_0_RX_QUEUE_NUM_PKTS_DEQUEUED_REG, &mac0_recv_pkt);
	gettimeofday(&mac0_time_recv, NULL);
	printf("  MAC0\n     recv: \t%u B", mac0_recv_byte);
	printf("\t %u Pkts", mac0_recv_pkt);

   	timersub(&mac0_time_recv, &mac0_time_recv_prev, &t);

  	rate = (mac0_recv_byte - mac0_recv_byte_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u Mbps ", rate*8/1000000);

  	rate = (mac0_recv_pkt - mac0_recv_pkt_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u pps\n", rate);
	memcpy(&mac0_time_recv_prev,&mac0_time_recv ,sizeof(mac0_time_recv));





	mac0_recv_pkt_prev = mac0_recv_pkt;
	mac0_recv_byte_prev = mac0_recv_byte;


//	Sent

	readReg(&nf2, MAC_GRP_0_TX_QUEUE_NUM_BYTES_PUSHED_REG, &mac0_sent_byte);
	readReg(&nf2, MAC_GRP_0_TX_QUEUE_NUM_PKTS_ENQUEUED_REG, &mac0_sent_pkt);

	gettimeofday(&mac0_time_sent, NULL);
	printf("     sent: \t%u B", mac0_sent_byte);
	printf("\t %u Pkts", mac0_sent_pkt);
   	timersub(&mac0_time_sent, &mac0_time_sent_prev, &t);

  	rate = (mac0_sent_byte - mac0_sent_byte_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u Mbps ", rate*8/1000000);
	val =rate*8/1000000 ;
  	rate = (mac0_sent_pkt - mac0_sent_pkt_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u pps\n\n", rate);
	val2 = rate ;
	mac0_sent_pkt_prev = mac0_sent_pkt;
	mac0_sent_byte_prev = mac0_sent_byte;
	memcpy(&mac0_time_sent_prev,&mac0_time_sent ,sizeof(mac0_time_recv));



//	Mac1
	readReg(&nf2, MAC_GRP_1_RX_QUEUE_NUM_BYTES_PUSHED_REG, &mac1_recv_byte);
	printf("  MAC1\n     recv: \t%u B", mac1_recv_byte);
	readReg(&nf2, MAC_GRP_1_RX_QUEUE_NUM_PKTS_DEQUEUED_REG, &mac1_recv_pkt);
	printf("\t %u Pkts", mac1_recv_pkt);

	gettimeofday(&mac1_time_recv, NULL);
   	timersub(&mac1_time_recv, &mac1_time_recv_prev, &t);
  	rate = (mac1_recv_byte - mac1_recv_byte_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u Mbps ", rate*8/1000000);

  	rate = (mac1_recv_pkt - mac1_recv_pkt_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u pps\n", rate);

	mac1_recv_pkt_prev = mac1_recv_pkt;
	mac1_recv_byte_prev = mac1_recv_byte;
	memcpy(&mac1_time_recv_prev,&mac1_time_recv ,sizeof(mac1_time_recv));

//	Sent
	readReg(&nf2, MAC_GRP_1_TX_QUEUE_NUM_BYTES_PUSHED_REG, &mac1_sent_byte);

	readReg(&nf2, MAC_GRP_1_TX_QUEUE_NUM_PKTS_ENQUEUED_REG, &mac1_sent_pkt);


	gettimeofday(&mac1_time_sent, NULL);
	printf("     sent: \t%u B", mac1_sent_byte);
	printf("\t %u Pkts", mac1_sent_pkt);
   	timersub(&mac1_time_sent, &mac1_time_sent_prev, &t);

  	rate = (mac1_sent_byte - mac1_sent_byte_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u Mbps ", rate*8/1000000);
	val +=rate*8/1000000 ;
  	rate = (mac1_sent_pkt - mac1_sent_pkt_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u pps\n\n", rate);
	val2 += rate ;
	mac1_sent_pkt_prev = mac1_sent_pkt;
	mac1_sent_byte_prev = mac1_sent_byte;
	memcpy(&mac1_time_sent_prev,&mac1_time_sent ,sizeof(mac1_time_sent));

//	Mac2


	readReg(&nf2, MAC_GRP_2_RX_QUEUE_NUM_BYTES_PUSHED_REG, &mac2_recv_byte);
	printf("  MAC2\n     recv: \t%u B", mac2_recv_byte);
	readReg(&nf2, MAC_GRP_2_RX_QUEUE_NUM_PKTS_DEQUEUED_REG, &mac2_recv_pkt);
	printf("\t %u Pkts", mac2_recv_pkt);

	gettimeofday(&mac2_time_recv, NULL);

   	timersub(&mac2_time_recv, &mac2_time_recv_prev, &t);

  	rate = (mac2_recv_byte - mac2_recv_byte_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u Mbps ", rate*8/1000000);

  	rate = (mac2_recv_pkt - mac2_recv_pkt_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u pps\n", rate);	

	mac2_recv_pkt_prev = mac2_recv_pkt;
	mac2_recv_byte_prev = mac2_recv_byte;
	memcpy(&mac2_time_recv_prev,&mac2_time_recv ,sizeof(mac2_time_recv));

//	MAC2 Sent


	readReg(&nf2, MAC_GRP_2_TX_QUEUE_NUM_BYTES_PUSHED_REG, &mac2_sent_byte);
	printf("     sent: \t%u B", mac2_sent_byte);
	readReg(&nf2, MAC_GRP_2_TX_QUEUE_NUM_PKTS_ENQUEUED_REG, &mac2_sent_pkt);
	printf("\t %u Pkts", mac2_sent_pkt);


	gettimeofday(&mac2_time_sent, NULL);

   	timersub(&mac2_time_sent, &mac2_time_sent_prev, &t);

  	rate = (mac2_sent_byte - mac2_sent_byte_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u Mbps ", rate*8/1000000);
	val +=rate*8/1000000 ;
  	rate = (mac2_sent_pkt - mac2_sent_pkt_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u pps\n\n", rate);
	val2 += rate ;
	mac2_sent_pkt_prev = mac2_sent_pkt;
	mac2_sent_byte_prev = mac2_sent_byte;
	memcpy(&mac2_time_sent_prev,&mac2_time_sent ,sizeof(mac2_time_sent));


//	Mac3

	readReg(&nf2, MAC_GRP_3_RX_QUEUE_NUM_BYTES_PUSHED_REG, &mac3_recv_byte);
	printf("  MAC3\n     recv: \t%u B", mac3_recv_byte);
	readReg(&nf2, MAC_GRP_3_RX_QUEUE_NUM_PKTS_DEQUEUED_REG, &mac3_recv_pkt);
	printf("\t %u Pkts", mac3_recv_pkt);
	gettimeofday(&mac3_time_recv, NULL);

   	timersub(&mac3_time_recv, &mac3_time_recv_prev, &t);

  	rate = (mac3_recv_byte - mac3_recv_byte_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u Mbps ", rate*8/1000000);

  	rate = (mac3_recv_pkt - mac3_recv_pkt_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u pps\n", rate);

	mac3_recv_pkt_prev = mac3_recv_pkt;
	mac3_recv_byte_prev = mac3_recv_byte;
	memcpy(&mac3_time_recv_prev,&mac3_time_recv ,sizeof(mac3_time_recv));

//	Sent

	readReg(&nf2, MAC_GRP_3_TX_QUEUE_NUM_BYTES_PUSHED_REG, &mac3_sent_byte);
	printf("     sent: \t%u B", mac3_sent_byte);
	readReg(&nf2, MAC_GRP_3_TX_QUEUE_NUM_PKTS_ENQUEUED_REG, &mac3_sent_pkt);
	printf("\t %u Pkts", mac3_sent_pkt);

	gettimeofday(&mac3_time_sent, NULL);
   	timersub(&mac3_time_sent, &mac3_time_sent_prev, &t);
  	rate = (mac3_sent_byte - mac3_sent_byte_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u Mbps ", rate*8/1000000);
	val +=rate*8/1000000 ;
  	rate = (mac3_sent_pkt - mac3_sent_pkt_prev ) / (t.tv_sec + t.tv_usec / 1000000.0);
	printf("\t %u pps\n", rate);
	val2 += rate ;
	mac3_sent_pkt_prev = mac3_sent_pkt;
	mac3_sent_byte_prev = mac3_sent_byte;
	memcpy(&mac3_time_sent_prev,&mac3_time_sent ,sizeof(mac3_time_sent));
	printf("\n    Total throught\t %u Mbps ", val);
	printf("\t %u pps\n", val2);
  	usleep(1000000);
	system("clear") ;
}

}

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

#include "../lib/C/reg_defines_reference_router.h"
#include "../../../lib/C/common/nf2util.h"
#include "../../cpci/lib/C/reg_defines_cpci.h"
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

 	readReg(&nf2, CPCI_CTRL_REG,&val);
        printf("CPCI_CTRL_REG: %u\n\n", val);
 	readReg(&nf2, CPCI_CNET_CLK_SEL_REG,&val);
        printf("CPCI_CNET_CLK_SEL_REG: %u\n\n", val);
   	writeReg(&nf2, CPCI_CNET_CLK_SEL_REG, 1);
 	readReg(&nf2, CPCI_CTRL_REG,&val);
	writeReg(&nf2, CPCI_CTRL_REG, val| 0x100);
	usleep(RESET_PERIOD);
 	readReg(&nf2, CPCI_CNET_CLK_SEL_REG,&val);
        printf("CPCI_CNET_CLK_SEL_REG: %u\n\n", val);
	usleep(MEASURE_PERIOD);
	readReg(&nf2, CPCI_CNET_READ_TIME_REG, &val);
        printf("Read ticks is: %u\n\n", val);

	readReg(&nf2, CPCI_CNET_READ_TIME_REG, &val);
        printf("Read ticks is: %u\n\n", val);

	closeDescriptor(&nf2);

	return 0;
}

       
	
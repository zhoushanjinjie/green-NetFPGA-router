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
#include <time.h>
#include <sys/time.h>
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
	unsigned val,ticks,ticks1;
	int	i ;
  struct timeval start_time;
  struct timeval end_time;
  struct timeval delta;
	double rate ;

	nf2.device_name = DEFAULT_IFACE;

	if (check_iface(&nf2))
	{
		exit(1);
	}
	if (openDescriptor(&nf2))
	{
		exit(1);
	}

  	writeReg(&nf2, TICKS_ENABLE_TICKS_REG, 1);

  readReg(&nf2,  TICKS_TICK1_25_REG, &ticks);
        printf("\n Debug Line:	%x", ticks);

  readReg(&nf2,  TICKS_TICK12_5_REG , &ticks);
        printf(" %x", ticks);

  readReg(&nf2,  TICKS_TICK62_5_REG , &ticks);
        printf(" %x \n\n", ticks);


  writeReg(&nf2,  TICKS_TICK83_3_REG , 0xffffffff);




	return 0;
}

       
	

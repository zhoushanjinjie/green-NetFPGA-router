/* ****************************************************************************
 * vim:set shiftwidth=2 softtabstop=2 expandtab:
 * $Id: selftest.c 6010 2010-03-14 08:24:50Z grg $
 *
 * Module: selftest.c
 * Project: NetFPGA 2.1
 * Description: Interface with the self-test modules on the NetFPGA
 * to help diagnose problems.
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
#include <sys/time.h>

#include <net/if.h>

#include <time.h>

#include <signal.h>

#include "../lib/C/reg_defines_selftest.h"
#include "../../cpci/lib/C/reg_defines_cpci.h"
#include "../../../lib/C/common/nf2util.h"
#include <curses.h>
#include "selftest.h"
#include "selftest_dram.h"
#include "selftest_sram.h"
#include "selftest_serial.h"
#include "selftest_phy.h"
#include "selftest_mdio.h"
#include "selftest_reg.h"
#include "selftest_clk.h"
#include "selftest_dma.h"

#define PATHLEN		80

#define DEFAULT_IFACE	"nf2c0"
#define SELFTEST_VERSION  "1.00 alpha"

#define ONE_SHOT_ITER   5

typedef enum {LOW = 0, HIGH = 1} SW_TEST_EFFORT_LEVEL;

/* Global vars */
struct nf2device nf2;
int verbose = 0;
int continuous = 0;
int shortrun = 1;
int no_sata_flg = 0;

FILE * log_file;
WINDOW *w;

/* Function declarations */
void mainContinuous(void);
void mainOneShot(void);
//void init_work(void);
void reset_tests(void);

void processArgs (int, char **);
void usage (char*);
void run_continuous(void);
void reset_continuous(void);
void stop_continuous(void);
void sigint_handler(int signum);
void reset_board(void);
void title_bar(void);
void clear_line(void);
  double rate;
#define RESET_PERIOD    500000
#define MEASURE_PERIOD  500000


/*
 * Main function
 */
int main()
{
  // Set the default device
  nf2.device_name = DEFAULT_IFACE;
 unsigned int ticks;
  unsigned int ctrl;

  struct timeval start_time;
  struct timeval end_time;
  struct timeval delta;
 

readReg(&nf2, CPCI_CTRL_REG, &ctrl);
 printf("\nCPCI_CTRL_REG: %u",ctrl);
readReg(&nf2, CPCI_CNET_CLK_SEL_REG, &ctrl);
 printf("\nSystem Clk mode is: %u",ctrl);
   writeReg(&nf2, CPCI_CNET_CLK_SEL_REG, 1);
readReg(&nf2, CPCI_CNET_CLK_SEL_REG, &ctrl);
 printf("\nAfter setting, System Clk mode is: %u",ctrl);

}

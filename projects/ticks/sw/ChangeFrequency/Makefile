#
# $Id: Makefile 2397 2012-03-12 16:54:08Z grg $
#

CFLAGS = -g
CC = gcc
LDFLAGS = -lncurses

#all : registers cli regdump show_stats debug get_clk test

all : registers changeFrequency-5s ByPortNum

registers:
	$(NF_ROOT)/bin/nf_register_gen.pl --project reference_router

#show_stats: show_stats.o ../../../lib/C/common/nf2util.o ../../../lib/C/common/util.o ../lib/C/reg_defines_reference_router.h

#cli : cli.o ../../../lib/C/common/nf2util.o ../../../lib/C/common/util.o ../lib/C/reg_defines_reference_router.h

#regdump : regdump.o ../../../lib/C/common/nf2util.o ../lib/C/reg_defines_reference_router.h

//clk : clk.o ../../../lib/C/common/nf2util.o ../lib/C/reg_defines_reference_router.h

#debug : debug.o ../../../lib/C/common/nf2util.o ../lib/C/reg_defines_reference_router.h

#get_clk : get_clk.o ../../../lib/C/common/nf2util.o ../lib/C/reg_defines_reference_router.h

#test : test.o ../../../lib/C/common/nf2util.o ../lib/C/reg_defines_reference_router.h

changeFrequency-5s : changeFrequency-5s.o ../../../../lib/C/common/nf2util.o ../../lib/C/reg_defines_reference_router.h

ByPortNum : ByPortNum.o ../../../../lib/C/common/nf2util.o ../../lib/C/reg_defines_reference_router.h

clean :
	rm -f  changeFrequency-5s ByPortNum *.o

install:

.PHONY: all clean install

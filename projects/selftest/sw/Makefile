
CFLAGS = -g
CC = gcc
LDFLAGS = -lncurses
LIBS = -L/usr/lib -lpcap -lnsl -lm -lresolv -lnet
SRLIBS = -lpthread

all : registers selftest bad_pkt_dump clk_check

registers:
	$(NF_ROOT)/bin/nf_register_gen.pl --project selftest
	$(NF_ROOT)/bin/nf_register_gen.pl --project cpci

clk_check: clk_check.o \
	selftest_dram.o \
	selftest_sram.o \
	selftest_serial.o \
	selftest_phy.o \
	selftest_mdio.o \
	selftest_reg.o \
	selftest_clk.o \
	selftest_dma.o or_ip.o or_utils.o \
	$(NF_ROOT)/lib/C/common/nf2util.o \

bad_pkt_dump: bad_pkt_dump.o $(NF_ROOT)/lib/C/common/nf2util.o

clean :
	rm -f selftest bad_pkt_dump *.o FAIL selftest.log

install:


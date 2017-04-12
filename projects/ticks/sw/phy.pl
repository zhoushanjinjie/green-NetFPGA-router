#!/usr/bin/perl -w
# vim:set shiftwidth=3 softtabstop=3 expandtab:
# $id:$

#
# Program to read and dump the MII registers
#copy this file to /ticks/sw, run in terminal ./phy.pl

#use strict;
use NF::RegAccess;
use Getopt::Long;
use Time::HiRes qw (usleep);


my @phy = (0, 1, 2, 3);
my $MDIO_PHY_OFFSET = 128; #==0x80=128
# Step through the phys and print their status
while(1)
{
foreach my $phy (@phy) {
   
   printf "Phy %d:\n", $phy;
   my $val = writeMDIOReg($phy, 0x00440000, 0x80001940);   
 
     usleep(1000000);
     usleep(1000000);
     usleep(1000000);
     usleep(1000000);
     usleep(1000000);
     usleep(1000000);
     usleep(1000000);
     usleep(1000000);
  # }
}
foreach my $phy (@phy) {
  
   printf "Phy %d:\n", $phy;
   my $val = writeMDIOReg($phy, 0x00440000, 0x80001140);   
 #  for($i=0; i<30; i=i+1)
  # {
     usleep(1000000);
     usleep(1000000);
     usleep(1000000);
     usleep(1000000);
     usleep(1000000);
     usleep(1000000);
     usleep(1000000);
     usleep(1000000);

   #}
      
}
}


#########################################################
sub writeMDIOReg {
   my ($phy, $addr, $val) = @_;

   nf_regwrite(nf2c0, $phy * $MDIO_PHY_OFFSET + $addr, $val & 0xffff);
}



#
# phyControl -- Print the control register
#
sub phyControl {
   my $phy = shift;

   my @msgs = (
      15, "PHY reset", "Active", "Normal operation",
      14, "Internal loopback", "enabled", "disabled",
      12, "Auto-negotiation", "enabled", "disabled",
      11, "Power down", "enabled", "disabled",
      10, "Isolation", "Isolate PHY from RGMII", "Normal",
       9, "Auto-negotiation", "Restarting", "Restart complete",
       8, "Duplex", "Full", "Half",
       7, "Collision test", "enabled", "disabled",
   );

   my $val = readMDIOReg($phy, MDIO_PHY_0_CONTROL_REG());
   if ($val != -1) {
      print "  Control:\n";
      my $speed = (($val & 0x2000) ? 1 : 0) |
                  (($val & 0x0040) ? 2 : 0);
      if ($speed == 3) {
         print "    Speed: Reserved???\n";
      }
      elsif ($speed == 2) {
         print "    Speed: 1000 Mbps\n";
      }
      elsif ($speed == 1) {
         print "    Speed: 100 Mbps\n";
      }
      elsif ($speed == 0) {
         print "    Speed: 10 Mbps\n";
      }
      printRegBits($val, [8], \@msgs);
      if ($verbose) {
         printRegBits($val, [15, 14, 12, 11, 10, 9, 7], \@msgs);
      }
   }
   else {
      print "Can't read status register...\n";
   }
}
#
# phyStatus -- Print the phy status
#
sub phyStatus {
   my $phy = shift;

   my @msgs = (
      6, "Preamble", "can be suppressed", "always required",
      5, "Auto-negotiation", "complete", "in progress",
      4, "Remote fault", "detected", "not detected",
      3, "Auto-negotiation", "capable", "not capable",
      2, "Link", "up", "down",
      1, "Jabber condition", "detected", "not detected",
   );

   my $val = readMDIOReg($phy, MDIO_PHY_0_STATUS_REG());
   if ($val != -1) {
      print "  Status:\n";
      printRegBits($val, [5, 3, 2], \@msgs);
      if ($verbose) {
         print "    Capabilities:";
         print "   100BASE-T4" if ($val & 0x8000);
         print "   100BASE-X Full-Duplex" if ($val & 0x4000);
         print "   100BASE-X Half-Duplex" if ($val & 0x2000);
         print "   10BASE-T Full-Duplex" if ($val & 0x1000);
         print "   10BASE-T Half-Duplex" if ($val & 0x0800);
         print "   10BASE-T2 Full-Duplex" if ($val & 0x0400);
         print "   10BASE-T2 Half-Duplex" if ($val & 0x0200);
         print "\n";
         printRegBits($val, [6, 4, 1], \@msgs);
      }
   }
   else {
      print "Can't read status register...\n";
   }
}



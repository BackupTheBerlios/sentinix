#!/bin/sh
#
# /etc/rc.d/rc.S:  System initialization script.
#
# Mostly written by:  Patrick J. Volkerding, <volkerdi@slackware.com>
#

echo
echo
echo -e "\033[1;31mSENTINIX\033[0m - http://sentinix.org"
echo
echo

PATH=/sbin:/usr/sbin:/bin:/usr/bin

# Start devfsd if necessary
if [ -r /dev/.devfsd ]; then
  if [ -x /sbin/devfsd ]; then
    echo "Starting devfs daemon:  /sbin/devfsd /dev"
    /sbin/devfsd /dev
  fi
fi

# enable swapping
/sbin/swapon -a

# Test to see if the root partition is read-only, like it ought to be.
READWRITE=no
if echo -n >> "Testing filesystem status"; then
  rm -f "Testing filesystem status"
  READWRITE=yes
fi

# See if a forced filesystem check was requested at shutdown:
if [ -r /etc/forcefsck ]; then
  FORCEFSCK="-f"
fi

# Check the root filesystem:
if [ ! $READWRITE = yes ]; then
  if [ ! -r /etc/fastboot ]; then
    echo "Checking root filesystem:"
    /sbin/fsck $FORCEFSCK -C -a /
  fi
  # If there was a failure, drop into single-user mode.
  if [ $? -gt 1 ] ; then
    echo
    echo
    echo "***********************************************************"
    echo "*** An error occurred during the root filesystem check. ***"
    echo "*** You will now be given a chance to log into the      ***"
    echo "*** system in single-user mode to fix the problem.      ***"
    echo "***                                                     ***"
    echo "*** If you are using the ext2 filesystem, running       ***"
    echo "*** 'e2fsck -v -y <partition>' might help.              ***"
    echo "***********************************************************"
    echo
    echo "Once you exit the single-user shell, the system will reboot."
    echo
    PS1="(Repair filesystem) \#"; export PS1
    sulogin
    echo "Unmounting file systems."
    umount -a -r
    mount -n -o remount,ro /
    echo "Rebooting system."
    sleep 2
    reboot -f
  fi
  # Remount the root filesystem in read-write mode
  echo "Remounting root device with read-write enabled."
  /bin/mount -w -v -n -o remount /
  if [ $? -gt 0 ] ; then
    echo
    echo "Attempt to remount root device as read-write failed!  This is going to"
    echo "cause serious problems."
    echo 
    echo "If you're using the UMSDOS filesystem, you **MUST** mount the root partition"
    echo "read-write!  You can make sure the root filesystem is getting mounted "
    echo "read-write with the 'rw' flag to Loadlin:"
    echo
    echo "loadlin vmlinuz root=/dev/hda1 rw   (replace /dev/hda1 with your root device)"
    echo
    echo "Normal bootdisks can be made to mount a system read-write with the rdev command:"
    echo
    echo "rdev -R /dev/fd0 0"
    echo
    echo "You can also get into your system by using a boot disk with a command like this"
    echo "on the LILO prompt line:  (change the root partition name as needed)"
    echo 
    echo "LILO: mount root=/dev/hda1 rw"
    echo
    echo "Please press ENTER to continue, then reboot and use one of the above methods to"
    echo -n "get into your machine and start looking for the problem. " 
    read junk; 
  fi
else
  echo "Testing filesystem status: read-write filesystem"
  if cat /etc/fstab | grep ' / ' | grep umsdos 1> /dev/null 2> /dev/null ; then
    ROOTTYPE="umsdos"
  fi
  if [ ! "$ROOTTYPE" = "umsdos" ]; then # no warn for UMSDOS
    echo
    echo "*** ERROR: Root partition has already been mounted read-write. Cannot check!"
    echo
    echo "For filesystem checking to work properly, your system must initially mount"
    echo "the root partition as read only. Please modify your kernel with 'rdev' so that"
    echo "it does this. If you're booting with LILO, add a line:"
    echo
    echo "   read-only"
    echo
    echo "to the Linux section in your /etc/lilo.conf and type 'lilo' to reinstall it."
    echo
    echo "If you boot from a kernel on a floppy disk, put it in the drive and type:"
    echo "   rdev -R /dev/fd0 1"
    echo
    echo "If you boot from a bootdisk, or with Loadlin, you can add the 'ro' flag."
    echo
    echo "This will fix the problem *AND* eliminate this annoying message. :^)"
    echo
    echo -n "Press ENTER to continue. "
    read junk;
  fi
fi # Done checking root filesystem

# Any /etc/mtab that exists here is old, so we delete it to start over:
/bin/rm -f /etc/mtab*
# Remounting the / partition will initialize the new /etc/mtab:
/bin/mount -w -o remount /

# Initialize the Logical Volume Manager.
# This won't start unless /etc/lvmtab is found, which is created by /sbin/vgscan.
# Therefore, to use LVM you must run /sbin/vgscan yourself the first time.
if [ -r /etc/lvmtab ]; then
  # Mount /proc early (it's needed for vgscan):
  /bin/mount -a -t proc
  # Scan for new volume groups:
  /sbin/vgscan
  if [ $? = 0 ]; then
    # Make volume groups available to the kernel:
    /sbin/vgchange -ay
  fi
fi

# Check all the non-root filesystems:
if [ ! -r /etc/fastboot ]; then
  echo "Checking non-root filesystems:"
  /sbin/fsck $FORCEFSCK -C -R -A -a
fi

# mount non-root file systems in fstab (but not NFS or SMB 
# because TCP/IP is not yet configured):
/bin/mount -a -v -t nonfs,nosmbfs

# Clean up some temporary files:
/bin/rm -f /var/run/utmp /var/run/*pid /etc/nologin /var/run/lpd* \
  /var/run/ppp* /etc/dhcpc/dhcpcd-eth0.pid /etc/forcefsck /etc/fastboot \
  /var/sxrunning/*

# Create a fresh utmp file:
cat /dev/null > /var/run/utmp

if [ "$ROOTTYPE" = "umsdos" ]; then # we need to update any files added in DOS:
  echo "Synchronizing UMSDOS directory structure:"
  echo "  umssync -r99 -v- /"
  umssync -r99 -v- /
fi

# Setup the /etc/motd to reflect the current kernel level:
# THIS WIPES ANY CHANGES YOU MAKE TO /ETC/MOTD WITH EACH BOOT.
# COMMENT THIS OUT IF YOU WANT TO MAKE A CUSTOM VERSION.
#echo "`/bin/uname -sr`." > /etc/motd

# Configure ISA Plug-and-Play devices:
if [ -r /etc/isapnp.conf ]; then
  if [ -x /sbin/isapnp ]; then
    /sbin/isapnp /etc/isapnp.conf
  fi
fi

# Set the system time from the hardware clock using hwclock --hctosys.
# Detect SGI Visual Workstation, since hwclock will make those freeze up:
if fgrep -l Cobalt-APIC /proc/interrupts 1> /dev/null 2> /dev/null ; then
  echo "SGI Visual Workstation detected.  Not running hwclock."
elif [ -x /sbin/hwclock ]; then
#  if grep "^UTC" /etc/hardwareclock 1> /dev/null 2> /dev/null ; then
#    echo "Setting system time from the hardware clock (UTC)."
#    /sbin/hwclock --utc --hctosys
#  else
    echo "Setting system time from the hardware clock (localtime)."
    /sbin/hwclock --localtime --hctosys
#  fi
fi

# This loads any kernel modules that are needed.  These might be required to
# use your CD-ROM drive, bus mouse, ethernet card, or other optional hardware.
if [ -x /etc/rc.d/rc.modules ]; then
  . /etc/rc.d/rc.modules
fi

# Run serial port setup script:
# (CAREFUL! This can make some systems hang if the rc.serial script isn't
# set up correctly. If this happens, you may have to edit the file from a
# boot disk)
#
# . /etc/rc.d/rc.serial

# Carry an entropy pool between reboots to improve randomness.
# Load and then save 512 bytes, which is the size of the entropy pool.
if [ -f /etc/random-seed ]; then
  echo "Using /etc/random-seed to initialize /dev/urandom."
  cat /etc/random-seed >/dev/urandom
fi
dd if=/dev/urandom of=/etc/random-seed count=1 bs=512 2> /dev/null


Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9691BE0045D
	for <meta-ti@yoctoproject.org>; Thu, 31 Jan 2013 15:42:32 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:41931 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U13m3-0003Kn-B9
	for meta-ti@yoctoproject.org; Thu, 31 Jan 2013 18:42:31 -0500
Date: Thu, 31 Jan 2013 18:42:28 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1301311735390.5243@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: i *really* want a bootable OE image for my pdlogic am1808 experimenter kit
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2013 23:42:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  as i've mentioned recently, i've just come into possession of one of
these:

  http://www.logicpd.com/products/system-on-modules/zoom-am1808/

and i very badly would like to use OE + meta-ti to build a *very*
simple bootable image -- no graphics, no clutter, just a simple system
that i can populate with some HW/flash tools.

  so the short question is: is there a verified recipe for building
such a thing for precisely that board?  because i haven't been having
a lot of luck.

  assuming the machine choice for that board is the am180x-evm, i
first tried building the ti-hw-bringup-image, but that's broken for a
couple systemd-related reasons so i finally gave up on it.

  i *did* get a successful build for OE's core-image-minimal, but it
won't boot fully so i'm kind of stuck there, and here's where i'm
stuck.  the SD card that comes with the kit boots nicely, and here's
the tail end of the boot to establish a baseline to show what works:

===== boot output =====
... snip ...
VFS: Mounted root (ext3 filesystem) on device 179:2.
Freeing init memory: 148K
INIT: version 2.86 booting
Please wait: booting...
Starting udev
udev: starting version 141
Remounting root file system...
Caching udev devnodes
Populating dev cachekjournald starting.  Commit interval 5 seconds
EXT3-fs (mmcblk0p3): using internal journal
EXT3-fs (mmcblk0p3): recovery complete
EXT3-fs (mmcblk0p3): mounted filesystem with writeback data mode
mv: cannot rename '/tmp/devices': No such file or directory
NET: Registered protocol family 10
logger: mount: mount point /proc/bus/usb does not exist
ALSA: Restoring mixer settings...
/usr/sbin/alsactl: load_state:1625: No soundcards found...
Configuring network interfaces... eth0: attached PHY driver [SMSC
LAN8710/LAN8720] (mii_bus:phy_addr=1:00, id=7c0f1)
ADDRCONF(NETDEV_UP): eth0: link is not ready
udhcpc (v1.13.2) started
Sending discover...
Sending discover...
Sending discover...
No lease, forking to background
done.
Setting up IP spoofing protection: rp_filter.
Fri Apr 15 04:54:00 UTC 2011
INIT: Entering runlevel: 5
Starting system message bus: dbus.
Starting Dropbear SSH server: dropbear.
Starting telnet daemon.
Starting syslogd/klogd: done
Starting thttpd.
Starting Matrix GUI application.

 _____                    _____           _         _
|  _  |___ ___ ___ ___   |  _  |___ ___  |_|___ ___| |_
|     |  _| .'| . | . |  |   __|  _| . | | | -_|  _|  _|
|__|__|_| |__,|_  |___|  |__|  |_| |___|_| |___|___|_|
              |___|                    |___|

Arago Project http://arago-project.org am180x-evm ttyS2

Arago 2011.02 am180x-evm ttyS2

am180x-evm login:

===== end of boot output =====

  so, clearly, it can be done.  and here's what happens when i replace
the uImage and root filesystem on that SD card with what came from the
core-image-minimal build:

===== start =====
... snip ...
INIT: version 2.88 booting
Starting udev
Starting Bootlog daemon: bootlogd.
Configuring network interfaces... davinci_mdio davinci_mdio.0:
resetting idled conr
net eth0: attached PHY driver [SMSC LAN8710/LAN8720]
(mii_bus:phy_addr=0:00, id=7c)
udhcpc (v1.20.2) started
Sending discover...
Sending discover...
Sending discover...
No lease, failing
hwclock: can't open '/dev/misc/rtc': No such file or directory
Thu Jan 31 16:02:00 UTC 2013
hwclock: can't open '/dev/misc/rtc': No such file or directory

   (hangs)

  so the kernel boots, mounts the root filesystem, makes it partway in
and hangs right after that attempted access of the real-time clock.

  i had a few minutes to look further and the device_table file in the
root filesystem refers to /dev/rtc, not to /dev/misc/rtc but i don't
know enough to know if that would be enough to cause the boot to hang,
or if it's something happening right after that.

  in short, i would dearly love a recipe that would give me a bootable
kernel and rootfs for this board.  should i be selecting a different
output image?  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


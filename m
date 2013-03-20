Return-Path: <grunzasr@comcast.net>
Received: from qmta10.emeryville.ca.mail.comcast.net
	(qmta10.emeryville.ca.mail.comcast.net [76.96.30.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F10BE012F1
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2013 07:23:37 -0700 (PDT)
Received: from omta03.emeryville.ca.mail.comcast.net ([76.96.30.27])
	by qmta10.emeryville.ca.mail.comcast.net with comcast
	id DqN91l0020b6N64AAqPczy; Wed, 20 Mar 2013 14:23:36 +0000
Received: from [127.0.0.1] ([71.225.124.244])
	by omta03.emeryville.ca.mail.comcast.net with comcast
	id DqPa1l0025GVvnK8PqPaq2; Wed, 20 Mar 2013 14:23:35 +0000
Message-ID: <5149C666.7040306@comcast.net>
Date: Wed, 20 Mar 2013 10:23:34 -0400
From: Steven Grunza <grunzasr@comcast.net>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <514873B9.3020500@comcast.net> <20130319172138.GQ32759@edge>
	<5148A9B4.5060702@comcast.net> <20130319182747.GH14761@denix.org>
In-Reply-To: <20130319182747.GH14761@denix.org>
X-Antivirus: avast! (VPS 130320-0, 03/20/2013), Outbound message
X-Antivirus-Status: Clean
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1363789416;
	bh=1ilnHFyyoc845jnUtLhUfLQ1obiqxVFzWh+Pmn80cik=;
	h=Received:Received:Message-ID:Date:From:Reply-To:MIME-Version:
	Subject:Content-Type;
	b=KArG/aCBJScxF3g2wFGfzVYv318EHaFDeHfz3GJsa+Xt8rj3S+w2Grf/3q74CeZ5E
	egSPw+lwZI0511g4dHNHM71Cq8FG/j3Ajyd47FJuLe2MHU2ZuCE19B3uLY01x2mQCt
	Hc4IUkt7lW3gethi8KjUYfEbUQElvGYkeWPdkHFlvZhsodl0qOqqvemp4rnQZyH5c4
	3zeejkI4uGAkctq4Jqd7Ta7lTLtBkwUT+rmZhralnZSMRXQKEQU5U5RSGXng6mt8SG
	JUs7iaGtXZFhPRKzA5DCftyOpQBd8M3/iPugso6VL77wuCj4RyBfcLKKKOX8TzRYlF
	HZO8cx8v6nisQ==
Subject: Re: Is this the correct list for AM3517 EVM questions?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: grunzasr@comcast.net
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2013 14:23:37 -0000
Content-Type: multipart/alternative;
	boundary="------------010602060904020705070502"

--------------010602060904020705070502
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/2013 2:27 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 19, 2013 at 02:08:52PM -0400, Steven Grunza wrote:
>> On 3/19/2013 1:21 PM, Denys Dmytriyenko wrote:
>>> On Tue, Mar 19, 2013 at 10:18:33AM -0400, Steven Grunza wrote:
>>>> Hello,
>>>>    I have a LogicPD Zoom AM3517 experimenters board.  Is this the
>>>> correct list to ask questions about getting Yocto-based software
>>>> running on this board?
>>> Yes, this is one of the correct lists for asking questions about AM3517 board
>>> when used with the Yocto Project. :) As this is the mailing list for meta-ti,
>>> which is the official Texas Instruments BSP layer for OpenEmbedded-Core and
>>> the Yocto Project, and AM3517 is currently one of the supported platforms in
>>> meta-ti.
>>>
>> Wonderful.  Can someone point me to information so that I can build
>> a system using the Yocto project and program an SD card with the
>> necessary files to boot my board into Linux?
>>
>>    With all of the S7 DIP switches in the off position (which the
>> AM3517 Development Kits User Manual indicates is the default boot
>> from NAND) I don't get any output from the serial UART so my guess
>> is that I've hosed the NAND.
>>
>>    For debugging support I have a TI Stellaris LM3S8962 board which
>> has the ability to act as a JTAG debugger to external hardware.  For
>> software I have OpenOCD 0.6.1
> I would assume you already checked this Hardware Setup page:
> http://processors.wiki.ti.com/index.php/GSG:_AM35x_EVM_Hardware_Setup
>
> Then you would need to check the Boot from SD/MMC page:
> http://processors.wiki.ti.com/index.php/AM35x_EVM_Boot_from_SD/MMC_card
>
> As of the software load, you can build a minimal rootfs image (e.g.
> core-image-minimal) with all the BSP components and setup an SD card as
> described above. You'll get the MLO, u-boot, uImage and rootfs as the
> output of the build, that you need to load on to the card.
To what should I have MACHINE set?  Using beagleboard didn't work.

Build Configuration:
BB_VERSION        = "1.16.0"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto
meta-yocto-bsp    = "<unknown>:<unknown>"


/home/yocto/poky-danny-8.0/build/tmp/deploy/images

-rw-r--r-- 1 grunzasr grunzasr   84719488 Mar 20 09:58 
core-image-minimal-beagleboard-20130320134504.rootfs.jffs2
-rw-r--r-- 1 grunzasr grunzasr  228538001 Mar 20 09:55 
core-image-minimal-beagleboard-20130320134504.rootfs.tar.bz2
lrwxrwxrwx 1 grunzasr grunzasr         60 Mar 20 09:57 
core-image-minimal-beagleboard.tar.bz2 -> 
core-image-minimal-beagleboard-20130320134504.rootfs.tar.bz2
-rw-r--r-- 1 grunzasr grunzasr 1538239488 Feb 26 14:57 
core-image-minimal-qemuppc-20130226141438.rootfs.ext3
-rw-r--r-- 1 grunzasr grunzasr  304174285 Feb 26 14:51 
core-image-minimal-qemuppc-20130226141438.rootfs.tar.bz2
-rw-r--r-- 1 grunzasr grunzasr 1538239488 Feb 26 16:20 
core-image-minimal-qemuppc-20130226210235.rootfs.ext3
-rw-r--r-- 1 grunzasr grunzasr  304179924 Feb 26 16:14 
core-image-minimal-qemuppc-20130226210235.rootfs.tar.bz2
lrwxrwxrwx 1 grunzasr grunzasr         53 Feb 26 16:20 
core-image-minimal-qemuppc.ext3 -> 
core-image-minimal-qemuppc-20130226210235.rootfs.ext3
lrwxrwxrwx 1 grunzasr grunzasr         56 Feb 26 16:17 
core-image-minimal-qemuppc.tar.bz2 -> 
core-image-minimal-qemuppc-20130226210235.rootfs.tar.bz2
-rw-r--r-- 1 grunzasr grunzasr  537657344 Mar 13 20:13 
core-image-sato-beagleboard-20130313180702.rootfs.jffs2
-rw-r--r-- 1 grunzasr grunzasr  343428455 Mar 13 20:07 
core-image-sato-beagleboard-20130313180702.rootfs.tar.bz2
lrwxrwxrwx 1 grunzasr grunzasr         55 Mar 13 20:13 
core-image-sato-beagleboard.jffs2 -> 
core-image-sato-beagleboard-20130313180702.rootfs.jffs2
lrwxrwxrwx 1 grunzasr grunzasr         57 Mar 13 20:11 
core-image-sato-beagleboard.tar.bz2 -> 
core-image-sato-beagleboard-20130313180702.rootfs.tar.bz2
-rw-r--r-- 1 grunzasr grunzasr 2488386560 Feb 26 20:16 
core-image-sato-qemuppc-20130226222738.rootfs.ext3
-rw-r--r-- 1 grunzasr grunzasr  483216390 Feb 26 20:05 
core-image-sato-qemuppc-20130226222738.rootfs.tar.bz2
lrwxrwxrwx 1 grunzasr grunzasr         50 Feb 26 20:16 
core-image-sato-qemuppc.ext3 -> 
core-image-sato-qemuppc-20130226222738.rootfs.ext3
lrwxrwxrwx 1 grunzasr grunzasr         53 Feb 26 20:10 
core-image-sato-qemuppc.tar.bz2 -> 
core-image-sato-qemuppc-20130226222738.rootfs.tar.bz2
lrwxrwxrwx 1 grunzasr grunzasr         70 Mar 13 19:54 MLO-beagleboard 
-> MLO-beagleboard-1.5.0+git1+9f94c6577e3a018b6b75cbe39f32bb331871f915-r0*
-rwxr-xr-x 1 grunzasr grunzasr      22036 Mar 13 19:54 
MLO-beagleboard-1.5.0+git1+9f94c6577e3a018b6b75cbe39f32bb331871f915-r0*
-rw-rw-r-- 1 grunzasr grunzasr   28375528 Mar 13 16:23 
modules-3.4.11-yocto-standard-r4.3-beagleboard.tgz
-rw-rw-r-- 1 grunzasr grunzasr   38056200 Feb 26 13:05 
modules-3.4.11-yocto-standard-r4.3-qemuppc.tgz
-rw-rw-r-- 1 grunzasr grunzasr        294 Mar 20 09:49 
README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
lrwxrwxrwx 1 grunzasr grunzasr         81 Mar 13 20:13 
u-boot-beagleboard.bin -> 
u-boot-beagleboard-v2011.06+git16+b1af6f532e0d348b153d5c148369229d24af361a-r3.bin*
-rwxr-xr-x 1 grunzasr grunzasr     285272 Mar 13 20:13 
u-boot-beagleboard-v2011.06+git16+b1af6f532e0d348b153d5c148369229d24af361a-r3.bin*
lrwxrwxrwx 1 grunzasr grunzasr         81 Mar 13 20:13 u-boot.bin -> 
u-boot-beagleboard-v2011.06+git16+b1af6f532e0d348b153d5c148369229d24af361a-r3.bin*
lrwxrwxrwx 1 grunzasr grunzasr        138 Mar 13 16:23 uImage -> 
uImage-3.4.11+git1+a201268353c030d9fafe00f2041976f7437d9386_1+449f7f520350700858f21a5554b81cc8ad23267d-r4.3-beagleboard-20130313180702.bin
-rw-r--r-- 1 grunzasr grunzasr    4309216 Mar 13 16:23 
uImage-3.4.11+git1+a201268353c030d9fafe00f2041976f7437d9386_1+449f7f520350700858f21a5554b81cc8ad23267d-r4.3-beagleboard-20130313180702.bin
lrwxrwxrwx 1 grunzasr grunzasr        138 Mar 13 16:23 
uImage-beagleboard.bin -> 
uImage-3.4.11+git1+a201268353c030d9fafe00f2041976f7437d9386_1+449f7f520350700858f21a5554b81cc8ad23267d-r4.3-beagleboard-20130313180702.bin
lrwxrwxrwx 1 grunzasr grunzasr        135 Feb 26 13:05 vmlinux -> 
vmlinux-3.4.11+git1+a201268353c030d9fafe00f2041976f7437d9386_2+7833f1549c3d44cce8aea38b65cd501229aad492-r4.3-qemuppc-20130226141438.bin
-rw-r--r-- 1 grunzasr grunzasr   93038630 Feb 26 13:05 
vmlinux-3.4.11+git1+a201268353c030d9fafe00f2041976f7437d9386_2+7833f1549c3d44cce8aea38b65cd501229aad492-r4.3-qemuppc-20130226141438.bin
lrwxrwxrwx 1 grunzasr grunzasr        135 Feb 26 13:05 
vmlinux-qemuppc.bin -> 
vmlinux-3.4.11+git1+a201268353c030d9fafe00f2041976f7437d9386_2+7833f1549c3d44cce8aea38b65cd501229aad492-r4.3-qemuppc-20130226141438.bin
-rwxr-xr-x 1 grunzasr grunzasr      22036 Mar 13 19:54 
x-load-beagleboard-1.5.0+git1+9f94c6577e3a018b6b75cbe39f32bb331871f915-r0.bin.ift*
lrwxrwxrwx 1 grunzasr grunzasr         81 Mar 13 19:54 
x-load-beagleboard.bin.ift -> 
x-load-beagleboard-1.5.0+git1+9f94c6577e3a018b6b75cbe39f32bb331871f915-r0.bin.ift*

grunzasr@stm32dbg% ls -l /mnt
total 0
grunzasr@stm32dbg% sudo cp MLO-beagleboard /mnt
grunzasr@stm32dbg% sudo cp u-boot.bin /mnt
grunzasr@stm32dbg% sudo cp uImage /mnt
grunzasr@stm32dbg% sync
grunzasr@stm32dbg% ls -l /mnt
total 4516
-rwxr-xr-x 1 root root   22036 Mar 20 09:59 MLO-beagleboard*
-rwxr-xr-x 1 root root  285272 Mar 20 10:00 u-boot.bin*
-rwxr-xr-x 1 root root 4309216 Mar 20 10:00 uImage*
grunzasr@stm32dbg% sudo umount /mnt


With DIPSW7-1 & 4 on, others off I get "40X" on serial console then 
nothing else.

Using files built on what I can find from 
AM35x-OMAP35x-LINUX-PSP-04.02.00.07

grunzasr@stm32dbg% pwd
/home/am3517/AM35x-OMAP35x-LINUX-PSP-04.02.00.07/images
grunzasr@stm32dbg% ls -l
total 12
drwxr-xr-x 5 grunzasr grunzasr 4096 Apr 29  2011 boot-strap/
drwxr-xr-x 5 grunzasr grunzasr 4096 Apr 29  2011 kernel/
drwxr-xr-x 5 grunzasr grunzasr 4096 Apr 29  2011 u-boot/
grunzasr@stm32dbg% ls -l boot-strap/am3517/
total 20
-rw-r--r-- 1 grunzasr grunzasr 16700 May  3  2011 x-load.bin.ift
grunzasr@stm32dbg% ls -l kernel/am3517/
total 2968
-rw-r--r-- 1 grunzasr grunzasr 3037308 May  3  2011 uImage
grunzasr@stm32dbg% ls -l u-boot/am3517/
total 220
-rwxr-xr-x 1 grunzasr grunzasr 222196 May  3  2011 u-boot.bin*

grunzasr@stm32dbg% pwd
/home/am3517/AM35x-OMAP35x-LINUX-PSP-04.02.00.07/images
grunzasr@stm32dbg%
grunzasr@stm32dbg%
grunzasr@stm32dbg% ls -l /mnt
total 0
grunzasr@stm32dbg% sudo cp boot-strap/am3517/x-load.bin.ift /mnt/MLO
grunzasr@stm32dbg% sudo cp kernel/am3517/uImage /mnt
grunzasr@stm32dbg% sudo cp u-boot/am3517/u-boot.bin /mnt
grunzasr@stm32dbg% ls -l /mnt
total 3208
-rwxr-xr-x 1 root root   16700 Mar 20 10:13 MLO*
-rwxr-xr-x 1 root root  222196 Mar 20 10:13 u-boot.bin*
-rwxr-xr-x 1 root root 3037308 Mar 20 10:13 uImage*
grunzasr@stm32dbg% sync
grunzasr@stm32dbg% sudo umount /mnt

> This gets me much farther.  I get the following on the serial port:

40X?@C?H?U??Instruments X-Loader 1.51 (May  3 2011 - 19:22:25)
Starting X-loader on MMC
Reading boot sector

222196 Bytes Read from MMC
Starting OS Bootloader from MMC...
Starting OS Bootloader...


U-Boot 2010.06 (May 03 2011 - 19:24:19)

OMAP34xx/35xx-GP ES1.0, CPU-OPP2 L3-165MHz
AM3517EVM Board + LPDDR/NAND
I2C:   ready
DRAM:  256 MiB
NAND:  HW ECC [Kernel/FS layout] selected
512 MiB
*** Warning - bad CRC or NAND, using default environment

In:    serial
Out:   serial
Err:   serial
Die ID #1b7e0000000000000155daa60200c00f
Net:   davinci_emac_initialize
Ethernet PHY: GENERIC @ 0x00
DaVinci EMAC
Hit any key to stop autoboot:  0
AM3517_EVM #

>  From this I conclude that my hardware is at least partially functional, my SD card is compatible with the AM3517 board, my serial connection is functioning, and I have at least the basics of getting the bootloading code (MLO) and u-boot onto the card.

> I suspect I need to change something in the /home/yocto/poky-danny-8.0/build/conf/local.conf file (probably MACHINE) to specify the correct hardware. I also need to figure out how to get the root file system written to the second partition of my SD card.  I couldn't find that information on any of the above mentioned pages or on the pages to which they have links.  My SD card is partitioned like this:

grunzasr@stm32dbg% sudo fdisk -l /dev/sdd

Disk /dev/sdd: 3959 MB, 3959422976 bytes
122 heads, 62 sectors/track, 1022 cylinders, total 7733248 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

    Device Boot      Start         End      Blocks   Id  System
/dev/sdd1   *        2048     2099199     1048576    c  W95 FAT32 (LBA)
/dev/sdd2         2099200     7733247     2817024   83  Linux





--------------010602060904020705070502
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 3/19/2013 2:27 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote cite="mid:20130319182747.GH14761@denix.org" type="cite">
      <pre wrap="">On Tue, Mar 19, 2013 at 02:08:52PM -0400, Steven Grunza wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On 3/19/2013 1:21 PM, Denys Dmytriyenko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">On Tue, Mar 19, 2013 at 10:18:33AM -0400, Steven Grunza wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">Hello,
  I have a LogicPD Zoom AM3517 experimenters board.  Is this the
correct list to ask questions about getting Yocto-based software
running on this board?
</pre>
          </blockquote>
          <pre wrap="">Yes, this is one of the correct lists for asking questions about AM3517 board
when used with the Yocto Project. :) As this is the mailing list for meta-ti,
which is the official Texas Instruments BSP layer for OpenEmbedded-Core and
the Yocto Project, and AM3517 is currently one of the supported platforms in
meta-ti.

</pre>
        </blockquote>
        <pre wrap="">Wonderful.  Can someone point me to information so that I can build
a system using the Yocto project and program an SD card with the
necessary files to boot my board into Linux?

  With all of the S7 DIP switches in the off position (which the
AM3517 Development Kits User Manual indicates is the default boot
from NAND) I don't get any output from the serial UART so my guess
is that I've hosed the NAND.

  For debugging support I have a TI Stellaris LM3S8962 board which
has the ability to act as a JTAG debugger to external hardware.  For
software I have OpenOCD 0.6.1
</pre>
      </blockquote>
      <pre wrap="">
I would assume you already checked this Hardware Setup page:
<a class="moz-txt-link-freetext" href="http://processors.wiki.ti.com/index.php/GSG:_AM35x_EVM_Hardware_Setup">http://processors.wiki.ti.com/index.php/GSG:_AM35x_EVM_Hardware_Setup</a>

Then you would need to check the Boot from SD/MMC page:
<a class="moz-txt-link-freetext" href="http://processors.wiki.ti.com/index.php/AM35x_EVM_Boot_from_SD/MMC_card">http://processors.wiki.ti.com/index.php/AM35x_EVM_Boot_from_SD/MMC_card</a>

As of the software load, you can build a minimal rootfs image (e.g. 
core-image-minimal) with all the BSP components and setup an SD card as 
described above. You'll get the MLO, u-boot, uImage and rootfs as the
output of the build, that you need to load on to the card.
</pre>
    </blockquote>
    To what should I have MACHINE set?&nbsp; Using beagleboard didn't work.<br>
    <br>
    <font face="Courier New, Courier, monospace">Build Configuration:<br>
      BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "1.16.0"<br>
      TARGET_ARCH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "arm"<br>
      TARGET_OS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "linux-gnueabi"<br>
      MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "beagleboard"<br>
      DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "poky"<br>
      DISTRO_VERSION&nbsp;&nbsp;&nbsp; = "1.3"<br>
      TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; = "armv7a vfp neon cortexa8"<br>
      TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "vfp-neon"<br>
      meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
      meta-yocto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
      meta-yocto-bsp&nbsp;&nbsp;&nbsp; = "&lt;unknown&gt;:&lt;unknown&gt;"<br>
    </font><br>
    <font face="Courier New, Courier, monospace"><small><small><small><br>
            /home/yocto/poky-danny-8.0/build/tmp/deploy/images<br>
            <br>
            -rw-r--r-- 1 grunzasr grunzasr&nbsp;&nbsp; 84719488 Mar 20 09:58
            core-image-minimal-beagleboard-20130320134504.rootfs.jffs2<br>
            -rw-r--r-- 1 grunzasr grunzasr&nbsp; 228538001 Mar 20 09:55
            core-image-minimal-beagleboard-20130320134504.rootfs.tar.bz2<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 60 Mar 20 09:57
            core-image-minimal-beagleboard.tar.bz2 -&gt;
            core-image-minimal-beagleboard-20130320134504.rootfs.tar.bz2<br>
            -rw-r--r-- 1 grunzasr grunzasr 1538239488 Feb 26 14:57
            core-image-minimal-qemuppc-20130226141438.rootfs.ext3<br>
            -rw-r--r-- 1 grunzasr grunzasr&nbsp; 304174285 Feb 26 14:51
            core-image-minimal-qemuppc-20130226141438.rootfs.tar.bz2<br>
            -rw-r--r-- 1 grunzasr grunzasr 1538239488 Feb 26 16:20
            core-image-minimal-qemuppc-20130226210235.rootfs.ext3<br>
            -rw-r--r-- 1 grunzasr grunzasr&nbsp; 304179924 Feb 26 16:14
            core-image-minimal-qemuppc-20130226210235.rootfs.tar.bz2<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 53 Feb 26 16:20
            core-image-minimal-qemuppc.ext3 -&gt;
            core-image-minimal-qemuppc-20130226210235.rootfs.ext3<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 56 Feb 26 16:17
            core-image-minimal-qemuppc.tar.bz2 -&gt;
            core-image-minimal-qemuppc-20130226210235.rootfs.tar.bz2<br>
            -rw-r--r-- 1 grunzasr grunzasr&nbsp; 537657344 Mar 13 20:13
            core-image-sato-beagleboard-20130313180702.rootfs.jffs2<br>
            -rw-r--r-- 1 grunzasr grunzasr&nbsp; 343428455 Mar 13 20:07
            core-image-sato-beagleboard-20130313180702.rootfs.tar.bz2<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 55 Mar 13 20:13
            core-image-sato-beagleboard.jffs2 -&gt;
            core-image-sato-beagleboard-20130313180702.rootfs.jffs2<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 57 Mar 13 20:11
            core-image-sato-beagleboard.tar.bz2 -&gt;
            core-image-sato-beagleboard-20130313180702.rootfs.tar.bz2<br>
            -rw-r--r-- 1 grunzasr grunzasr 2488386560 Feb 26 20:16
            core-image-sato-qemuppc-20130226222738.rootfs.ext3<br>
            -rw-r--r-- 1 grunzasr grunzasr&nbsp; 483216390 Feb 26 20:05
            core-image-sato-qemuppc-20130226222738.rootfs.tar.bz2<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 50 Feb 26 20:16
            core-image-sato-qemuppc.ext3 -&gt;
            core-image-sato-qemuppc-20130226222738.rootfs.ext3<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 53 Feb 26 20:10
            core-image-sato-qemuppc.tar.bz2 -&gt;
            core-image-sato-qemuppc-20130226222738.rootfs.tar.bz2<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 70 Mar 13 19:54
            MLO-beagleboard -&gt;
            MLO-beagleboard-1.5.0+git1+9f94c6577e3a018b6b75cbe39f32bb331871f915-r0*<br>
            -rwxr-xr-x 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22036 Mar 13 19:54
            MLO-beagleboard-1.5.0+git1+9f94c6577e3a018b6b75cbe39f32bb331871f915-r0*<br>
            -rw-rw-r-- 1 grunzasr grunzasr&nbsp;&nbsp; 28375528 Mar 13 16:23
            modules-3.4.11-yocto-standard-r4.3-beagleboard.tgz<br>
            -rw-rw-r-- 1 grunzasr grunzasr&nbsp;&nbsp; 38056200 Feb 26 13:05
            modules-3.4.11-yocto-standard-r4.3-qemuppc.tgz<br>
            -rw-rw-r-- 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 294 Mar 20 09:49
            README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 81 Mar 13 20:13
            u-boot-beagleboard.bin -&gt;
u-boot-beagleboard-v2011.06+git16+b1af6f532e0d348b153d5c148369229d24af361a-r3.bin*<br>
            -rwxr-xr-x 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp; 285272 Mar 13 20:13
u-boot-beagleboard-v2011.06+git16+b1af6f532e0d348b153d5c148369229d24af361a-r3.bin*<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 81 Mar 13 20:13
            u-boot.bin -&gt;
u-boot-beagleboard-v2011.06+git16+b1af6f532e0d348b153d5c148369229d24af361a-r3.bin*<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 138 Mar 13 16:23
            uImage -&gt;
uImage-3.4.11+git1+a201268353c030d9fafe00f2041976f7437d9386_1+449f7f520350700858f21a5554b81cc8ad23267d-r4.3-beagleboard-20130313180702.bin<br>
            -rw-r--r-- 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp; 4309216 Mar 13 16:23
uImage-3.4.11+git1+a201268353c030d9fafe00f2041976f7437d9386_1+449f7f520350700858f21a5554b81cc8ad23267d-r4.3-beagleboard-20130313180702.bin<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 138 Mar 13 16:23
            uImage-beagleboard.bin -&gt;
uImage-3.4.11+git1+a201268353c030d9fafe00f2041976f7437d9386_1+449f7f520350700858f21a5554b81cc8ad23267d-r4.3-beagleboard-20130313180702.bin<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 135 Feb 26 13:05
            vmlinux -&gt;
vmlinux-3.4.11+git1+a201268353c030d9fafe00f2041976f7437d9386_2+7833f1549c3d44cce8aea38b65cd501229aad492-r4.3-qemuppc-20130226141438.bin<br>
            -rw-r--r-- 1 grunzasr grunzasr&nbsp;&nbsp; 93038630 Feb 26 13:05
vmlinux-3.4.11+git1+a201268353c030d9fafe00f2041976f7437d9386_2+7833f1549c3d44cce8aea38b65cd501229aad492-r4.3-qemuppc-20130226141438.bin<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 135 Feb 26 13:05
            vmlinux-qemuppc.bin -&gt;
vmlinux-3.4.11+git1+a201268353c030d9fafe00f2041976f7437d9386_2+7833f1549c3d44cce8aea38b65cd501229aad492-r4.3-qemuppc-20130226141438.bin<br>
            -rwxr-xr-x 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22036 Mar 13 19:54
x-load-beagleboard-1.5.0+git1+9f94c6577e3a018b6b75cbe39f32bb331871f915-r0.bin.ift*<br>
            lrwxrwxrwx 1 grunzasr grunzasr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 81 Mar 13 19:54
            x-load-beagleboard.bin.ift -&gt;
x-load-beagleboard-1.5.0+git1+9f94c6577e3a018b6b75cbe39f32bb331871f915-r0.bin.ift*<br>
          </small></small></small></font><br>
    <font face="Courier New, Courier, monospace">grunzasr@stm32dbg% ls
      -l /mnt<br>
      total 0<br>
      grunzasr@stm32dbg% sudo cp MLO-beagleboard /mnt<br>
      grunzasr@stm32dbg% sudo cp u-boot.bin /mnt<br>
      grunzasr@stm32dbg% sudo cp uImage /mnt<br>
      grunzasr@stm32dbg% sync<br>
      grunzasr@stm32dbg% ls -l /mnt<br>
      total 4516<br>
      -rwxr-xr-x 1 root root&nbsp;&nbsp; 22036 Mar 20 09:59 MLO-beagleboard*<br>
      -rwxr-xr-x 1 root root&nbsp; 285272 Mar 20 10:00 u-boot.bin*<br>
      -rwxr-xr-x 1 root root 4309216 Mar 20 10:00 uImage*<br>
      grunzasr@stm32dbg% sudo umount /mnt<br>
    </font><br>
    <br>
    With DIPSW7-1 &amp; 4 on, others off I get "40X" on serial console
    then nothing else.<br>
    <br>
    Using files built on what I can find from
    AM35x-OMAP35x-LINUX-PSP-04.02.00.07<br>
    <br>
    <font face="Courier New, Courier, monospace">grunzasr@stm32dbg% pwd<br>
      /home/am3517/AM35x-OMAP35x-LINUX-PSP-04.02.00.07/images<br>
      grunzasr@stm32dbg% ls -l <br>
      total 12<br>
      drwxr-xr-x 5 grunzasr grunzasr 4096 Apr 29&nbsp; 2011 boot-strap/<br>
      drwxr-xr-x 5 grunzasr grunzasr 4096 Apr 29&nbsp; 2011 kernel/<br>
      drwxr-xr-x 5 grunzasr grunzasr 4096 Apr 29&nbsp; 2011 u-boot/<br>
      grunzasr@stm32dbg% ls -l boot-strap/am3517/<br>
      total 20<br>
      -rw-r--r-- 1 grunzasr grunzasr 16700 May&nbsp; 3&nbsp; 2011 x-load.bin.ift<br>
      grunzasr@stm32dbg% ls -l kernel/am3517/<br>
      total 2968<br>
      -rw-r--r-- 1 grunzasr grunzasr 3037308 May&nbsp; 3&nbsp; 2011 uImage<br>
      grunzasr@stm32dbg% ls -l u-boot/am3517/<br>
      total 220<br>
      -rwxr-xr-x 1 grunzasr grunzasr 222196 May&nbsp; 3&nbsp; 2011 u-boot.bin*<br>
      <br>
      grunzasr@stm32dbg% pwd<br>
      /home/am3517/AM35x-OMAP35x-LINUX-PSP-04.02.00.07/images<br>
      grunzasr@stm32dbg%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
      grunzasr@stm32dbg% <br>
      grunzasr@stm32dbg% ls -l /mnt<br>
      total 0<br>
      grunzasr@stm32dbg% sudo cp boot-strap/am3517/x-load.bin.ift
      /mnt/MLO<br>
      grunzasr@stm32dbg% sudo cp kernel/am3517/uImage /mnt&nbsp;&nbsp; <br>
      grunzasr@stm32dbg% sudo cp u-boot/am3517/u-boot.bin /mnt<br>
      grunzasr@stm32dbg% ls -l /mnt<br>
      total 3208<br>
      -rwxr-xr-x 1 root root&nbsp;&nbsp; 16700 Mar 20 10:13 MLO*<br>
      -rwxr-xr-x 1 root root&nbsp; 222196 Mar 20 10:13 u-boot.bin*<br>
      -rwxr-xr-x 1 root root 3037308 Mar 20 10:13 uImage*<br>
      grunzasr@stm32dbg% sync<br>
      grunzasr@stm32dbg% sudo umount /mnt<br>
    </font><br>
    <blockquote cite="mid:20130319182747.GH14761@denix.org" type="cite">
      <pre wrap="">This gets me much farther.  I get the following on the serial port:</pre>
    </blockquote>
    <br>
    <small><font face="Courier New, Courier, monospace">40X&#65533;@C&#65533;H&#65533;U&#65533;&#4417;Instruments
        X-Loader 1.51 (May&nbsp; 3 2011 - 19:22:25)<br>
        Starting X-loader on MMC <br>
        Reading boot sector<br>
        <br>
        222196 Bytes Read from MMC <br>
        Starting OS Bootloader from MMC...<br>
        Starting OS Bootloader...<br>
        <br>
        <br>
        U-Boot 2010.06 (May 03 2011 - 19:24:19)<br>
        <br>
        OMAP34xx/35xx-GP ES1.0, CPU-OPP2 L3-165MHz<br>
        AM3517EVM Board + LPDDR/NAND<br>
        I2C:&nbsp;&nbsp; ready<br>
        DRAM:&nbsp; 256 MiB<br>
        NAND:&nbsp; HW ECC [Kernel/FS layout] selected<br>
        512 MiB<br>
        *** Warning - bad CRC or NAND, using default environment<br>
        <br>
        In:&nbsp;&nbsp;&nbsp; serial<br>
        Out:&nbsp;&nbsp; serial<br>
        Err:&nbsp;&nbsp; serial<br>
        Die ID #1b7e0000000000000155daa60200c00f<br>
        Net:&nbsp;&nbsp; davinci_emac_initialize<br>
        Ethernet PHY: GENERIC @ 0x00<br>
        DaVinci EMAC<br>
        Hit any key to stop autoboot:&nbsp; 0 <br>
        AM3517_EVM # <br>
      </font></small><br>
    <blockquote cite="mid:20130319182747.GH14761@denix.org" type="cite">
      <pre wrap="">From this I conclude that my hardware is at least partially functional, my SD card is compatible with the AM3517 board, my serial connection is functioning, and I have at least the basics of getting the bootloading code (MLO) and u-boot onto the card.  </pre>
    </blockquote>
    <br>
    <blockquote cite="mid:20130319182747.GH14761@denix.org" type="cite">
      <pre wrap="">I suspect I need to change something in the /home/yocto/poky-danny-8.0/build/conf/local.conf file (probably MACHINE) to specify the correct hardware. I also need to figure out how to get the root file system written to the second partition of my SD card.  I couldn't find that information on any of the above mentioned pages or on the pages to which they have links.  My SD card is partitioned like this:</pre>
    </blockquote>
    <br>
    <font face="Courier New, Courier, monospace">grunzasr@stm32dbg% sudo
      fdisk -l /dev/sdd<br>
      <br>
      Disk /dev/sdd: 3959 MB, 3959422976 bytes<br>
      122 heads, 62 sectors/track, 1022 cylinders, total 7733248 sectors<br>
      Units = sectors of 1 * 512 = 512 bytes<br>
      Sector size (logical/physical): 512 bytes / 512 bytes<br>
      I/O size (minimum/optimal): 512 bytes / 512 bytes<br>
      Disk identifier: 0x00000000<br>
      <br>
      &nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&nbsp; System<br>
      /dev/sdd1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2048&nbsp;&nbsp;&nbsp;&nbsp; 2099199&nbsp;&nbsp;&nbsp;&nbsp; 1048576&nbsp;&nbsp;&nbsp; c&nbsp; W95 FAT32
      (LBA)<br>
      /dev/sdd2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2099200&nbsp;&nbsp;&nbsp;&nbsp; 7733247&nbsp;&nbsp;&nbsp;&nbsp; 2817024&nbsp;&nbsp; 83&nbsp; Linux<br>
    </font><br>
    <br>
    <br>
    <br>
  </body>
</html>

--------------010602060904020705070502--

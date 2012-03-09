Return-Path: <raj.khem@gmail.com>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F15FE0030B
	for <meta-ti@yoctoproject.org>; Thu,  8 Mar 2012 22:04:26 -0800 (PST)
Received: by iagw33 with SMTP id w33so2285213iag.35
	for <meta-ti@yoctoproject.org>; Thu, 08 Mar 2012 22:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mail-followup-to:mime-version
	:content-type:content-disposition:user-agent;
	bh=PZbW4jtbGmsEy5eWBWIWIw9LzjUJp6yBs2EODueS1pE=;
	b=bqK0AdyP8AW3eD6i1BGA0N9BSNR/uKGBr48/ZC0m89FJoEzE75r69nHYL3xQIts6gB
	v3q5jC4sdLUOkEGbv2pvpdD9Oig8WACLmYvdYum1OMKRt/gd56FmoQ5dc0FY4+n7oI4X
	l/N4ksz2Bij+39cmulcDVNUEUS3Wt2Xk702x0my/qnOsZy0f8GMmIfw0Z7bJ60ZCHsQh
	O6E5CsYaHeE8SOjUT2u4jWOZF+Qut9nFJDyYjlxjzZPik65Tz9EFlGlREJ8ujKmaN1Be
	19OMZFmGW36ouHc8jWIVP1SR657v4uDtVEky0BTZdU0N5jH8VIGBtEIgsMa1+/VFzpq7
	tFOQ==
Received: by 10.43.53.1 with SMTP id vo1mr1429509icb.2.1331273066067;
	Thu, 08 Mar 2012 22:04:26 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id cv10sm922376igc.13.2012.03.08.22.04.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 22:04:24 -0800 (PST)
Date: Thu, 8 Mar 2012 22:06:35 -0800
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Message-ID: <20120309060635.GA10899@sakrah.homelinux.org>
Mail-Followup-To: meta-ti@yoctoproject.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: u-boot build errors for beagleboard
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Mar 2012 06:04:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi 

This is angstrom/oe-core combo has anyone seen these errors ?
is there something bad in my env ? please let me know

DISTRO=angstrom-2010.x MACHINE=beagleboard bitbake u-boot

 arm-angstrom-linux-gnueabi-objdump: 'board/ti/beagle/libbeagle.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'arch/arm/cpu/armv7/libarmv7.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'arch/arm/cpu/armv7/omap-common/libomap-common.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'arch/arm/cpu/armv7/omap3/libomap3.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'arch/arm/lib/libarm.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'common/libcommon.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'disk/libdisk.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/i2c/libi2c.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/misc/libmisc.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/mmc/libmmc.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/mtd/libmtd.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/mtd/nand/libnand.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/pcmcia/libpcmcia.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/power/libpower.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/rtc/librtc.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/serial/libserial.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/spi/libspi.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/usb/eth/libusb_eth.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/usb/gadget/libusb_gadget.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/usb/host/libusb_host.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/usb/musb/libusb_musb.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/usb/phy/libusb_phy.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'drivers/video/libvideo.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'fs/ext2/libext2fs.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'fs/fat/libfat.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'fs/jffs2/libjffs2.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'lib/libfdt/libfdt.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'lib/libgeneric.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'lib/zlib/libz.o': No such file
| arm-angstrom-linux-gnueabi-objdump: 'net/libnet.o': No such file
| arm-angstrom-linux-gnueabi-ld: arch/arm/cpu/armv7/libarmv7.o: No such file: No such file or directory
| make: *** [u-boot] Error 1
| ERROR: oe_runmake failed
NOTE: package u-boot-2011.12-r5: task do_compile: Failed
ERROR: Task 7 (/home/kraj/work/angstrom/sources/meta-ti/recipes-bsp/u-boot/u-boot_2011.12.bb, do_compile) failed with exit code '1'

-- 
-Khem


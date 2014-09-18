Return-Path: <alexandre.belloni@free-electrons.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E092EE00781; Thu, 18 Sep 2014 06:40:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 414 seconds by postgrey-1.32 at yocto-www;
	Thu, 18 Sep 2014 06:40:53 PDT
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A272E0056A
	for <meta-ti@yoctoproject.org>; Thu, 18 Sep 2014 06:40:53 -0700 (PDT)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 96E6375E; Thu, 18 Sep 2014 15:33:59 +0200 (CEST)
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 3C64459E
	for <meta-ti@yoctoproject.org>; Thu, 18 Sep 2014 15:33:59 +0200 (CEST)
Date: Thu, 18 Sep 2014 15:33:55 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: meta-ti@yoctoproject.org
Message-ID: <20140918133355.GC29620@piout.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Creating am335x sdcard images with wic
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
X-List-Received-Date: Thu, 18 Sep 2014 13:40:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I tried multiple ways of create sd card images for my am335x based
platform.

I tried to revive the sdimg image type, using the last patch from
Otavio [1]

This didn't generate bootable images.

Now, I'm trying to use wic, based on this patch from Maciej [2].
I have multiple issue, the first one is making wic load the plugin. I
have to apply the patch on poky rather than on my own layer to get wic
to load that plugin, is that intended ?

Next, I'm still not able to generate a bootable image. I tracked it down
to an issue with the fat filesystem rather than the partitionning
itself.

1/ With wic, this is the command line to generate the FAT
filesystem:

mkdosfs -F 16 -n boot -d /var/tmp/wic/build/boot -C /var/tmp/wic/build/boot 10240

This results in an image that doesn't boot.


2/ On the same SD card, if I use:

mkdosfs -F 16 -n boot -d /var/tmp/wic/build/boot /dev/mmcblk0p1

This results in an SD card that can boot, the MLO starts, loads and
starts u-boot.img but then it fails to load my dtb from the FAT
filesystem because somehow, it only has short names.


3/ On the same SD card, if I manually format and copy files
mkfs.vfat -F 16 /dev/mmcblk0p1 -n boot
mount /dev/mmcblk0p1 /mnt
cp $BUILDDIR/tmp/deploy/images/beaglebone/{MLO,u-boot.img,zImage} /mnt
cp $BUILDDIR/tmp/deploy/images/beaglebone/*.dtb /mnt
umount /dev/mmcblk0p1

This one just boots fine, with long names.

Any insight?

[1] https://lists.yoctoproject.org/pipermail/meta-ti/2011-December/000234.html
[2] https://lists.yoctoproject.org/pipermail/meta-ti/2014-July/004901.html
-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com


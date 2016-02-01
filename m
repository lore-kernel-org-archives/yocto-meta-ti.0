Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3677FE0079A; Mon,  1 Feb 2016 13:14:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF3ADE00444
	for <meta-ti@yoctoproject.org>; Mon,  1 Feb 2016 13:14:09 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u11LE8gQ028072;
	Mon, 1 Feb 2016 15:14:08 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u11LE718014984;
	Mon, 1 Feb 2016 15:14:07 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Feb 2016 15:14:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u11LE7u3002725;
	Mon, 1 Feb 2016 15:14:07 -0600
Date: Mon, 1 Feb 2016 16:13:51 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <winiston@futuraautomation.com>
Message-ID: <20160201211351.GQ11314@edge>
References: <32F7239B343B45C78216EBDDA2AC66CA@RD3>
MIME-Version: 1.0
In-Reply-To: <32F7239B343B45C78216EBDDA2AC66CA@RD3>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: Re: Error while writing image on sd card
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
X-List-Received-Date: Mon, 01 Feb 2016 21:14:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

You are trying to make a EFI image, which AM437 doesn't use.

You can use one of the many available methods to boot your AM437 platform, 
SD/MMC boot is just one of the many. There's plenty of documentation and 
examples on http://processors.wiki.ti.com/ specific to TI embedded processors, 
including instructions on how to make a bootable SD/MMC image and even 
existing scripts, like the one that comes with TI SDK products.

-- 
Denys


On Fri, Jan 29, 2016 at 03:49:03PM +0530, winiston@futuraautomation.com wrote:
> Dear,
> 
> Host system : Ubuntu 14.04
> Target system :  AM437x-evm
> 
> I tried to write the image on the sd card, It spits out the error.   I am 
> using  card reader. In the device tree, card reader detects as /dev/sdb 
> & /dev/sde and  sd card detects as /dev/sde1 , /dev/sde2 & /dev/sde3     . 
> 
> Please see the below output for my writing command.
> 
> winiston@winiston-VirtualBox:~/poky/build$ sudo 
> $HOME/poky/scripts/contrib/mkefidisk.sh /dev/sde \tmp/deploy/images/am437x-evm/core-image-minimal-am437x-evm.tar.bz2 /dev/sda
> Image details
>     image: 
> 'tmp/deploy/images/am437x-evm/core-image-minimal-am437x-evm.tar.bz2' -> 
> 'core-image-minimal-am437x-evm-20160129065004.rootfs.tar.bz2'
>      size: 2180726 bytes
> modified: 2016-01-29 12:21:04.000000000 +0530
>      type: bzip2 compressed data, block size = 900k
> 
> Device details
>   device: /dev/sde
>   vendor: Multiple
>    model: Flash Reader
>     size: 16088301568 bytes
> 
> Prepare EFI image on /dev/sde [y/N]? y
> 
> Boot partition size:   20 MB (/dev/sde1)
> ROOTFS partition size: 15264 MB (/dev/sde2)
> Swap partition size:   804 MB (/dev/sde3)
> 
> Partitioning installation media (/dev/sde)
> Formatting partitions
> Failed to mount 
> tmp/deploy/images/am437x-evm/core-image-minimal-am437x-evm.tar.bz2
> Failed to mount rootfs.img
> Preparing boot partition
> Failed to copy vmlinuz
> Failed to copy EFI dir
> No EFI bootloader configuration found
> winiston@winiston-VirtualBox:~/poky/build$
> 
> What could be the problem? How do I burn image on sd card?
> 
> 
> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
> 
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti



Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 264CEE00566; Fri, 10 Feb 2017 08:54:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A92D6E00519
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2017 08:54:45 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1AGsiqw014613;
	Fri, 10 Feb 2017 10:54:44 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1AGsim5029929;
	Fri, 10 Feb 2017 10:54:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Feb 2017 10:54:43 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1AGsio6014077;
	Fri, 10 Feb 2017 10:54:44 -0600
Date: Fri, 10 Feb 2017 11:54:43 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mihaela Apetroaie-Cristea <apetroaiecristeamihaela@gmail.com>
Message-ID: <20170210165443.GH2612@edge>
References: <CAFKtCfGckvbaw5ULEz4-34XNbs-1Y72fB+HoR1pRZOBkZMkt4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFKtCfGckvbaw5ULEz4-34XNbs-1Y72fB+HoR1pRZOBkZMkt4g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: failed to build sdimg
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
X-List-Received-Date: Fri, 10 Feb 2017 16:54:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 10, 2017 at 04:46:02PM +0000, Mihaela Apetroaie-Cristea wrote:
> Hello,
> 
> I am trying to build a Beaglebone image using yocto and the meta-ti layer,
> but I am getting the following error:
> 
> 0+0 records out
> 0 bytes (0 B) copied, 8.3469e-05 s, 0.0 kB/s
> + mkfs.ext4 -F
> /media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/data.ext4
> -d
> /media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/data
> mke2fs 1.43 (17-May-2016)
> Discarding device blocks:
> 1024/131072^H^H^H^H^H^H^H^H^H^H^H^H^H
> ^H^H^H^H^H^H^H^H^H^H^H^H^Hdone
> Creating filesystem with 131072 1k blocks and 32768 inodes
> Filesystem UUID: 0b7bc83e-79f0-4136-8426-b56ac37f45bf
> Superblock backups stored on blocks:
>         8193, 24577, 40961, 57345, 73729
> 
> Allocating group tables:  0/16^H^H^H^H^H     ^H^H^H^H^Hdone
> Writing inode tables:  0/16^H^H^H^H^H     ^H^H^H^H^Hdone
> Creating journal (4096 blocks): done
> Copying files into the device: done
> Writing superblocks and filesystem accounting information:
> 0/16^H^H^H^H^H     ^H^H^H^H^Hdone
> 
> +
> wks=/media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/mender-sdimg.wks
> + rm -f
> /media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/mender-sdimg.wks
> + [ -n  ]
> + [ -n 4194304 ]
> + expr 4194304 / 1024
> + boot_env_align_kb=4096
> + cat
> + cat
> +
> outimgname=/media/mika/new/poky/build3/tmp/deploy/images/beaglebone/core-image-minimal-beaglebone-20170210153152.sdimg
> +
> wicout=/media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-beaglebone-20170210153152-sdimg
> + BUILDDIR=/media/mika/new/poky/build3 wic create
> /media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/mender-sdimg.wks
> --vars /media/mika/new/poky/build3/tmp/sysroots/beaglebone/imgdata/ $
> Warning: bootloader config not specified, using defaults
> Error: Malformed boot file entry: u-boot.bin;
> Checking basic build environment...
> Done.
> 
> Creating image(s)...
> 
> + bb_exit_handler
> + ret=1
> + echo WARNING: exit code 1 from a shell command.
> WARNING: exit code 1 from a shell command.
> + exit 1
> ERROR: Function failed: do_image_sdimg (log file is located at
> /media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_image_sdimg.32746)
> 
> 
> I am building the image on a Debian Jessie VM, metat-ti and poky are both
> morty up to date.

Mihaela,

The above code is not coming from meta-ti - e.g. mender and wic for sdimg 
image creation.

-- 
Denys


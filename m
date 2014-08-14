Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F613E004DD; Thu, 14 Aug 2014 13:05:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6E5DE0034B
	for <meta-ti@yoctoproject.org>; Thu, 14 Aug 2014 13:04:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7EK4pN8008281;
	Thu, 14 Aug 2014 15:04:51 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7EK4pi5025198;
	Thu, 14 Aug 2014 15:04:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 14 Aug 2014 15:04:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7EK4pkh003603;
	Thu, 14 Aug 2014 15:04:51 -0500
Date: Thu, 14 Aug 2014 16:04:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20140814200450.GX23523@edge>
References: <53ED13BE.2090809@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <53ED13BE.2090809@pseudoterminal.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: BeagleBone Black , u-boot, and zImage
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
X-List-Received-Date: Thu, 14 Aug 2014 20:05:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 14, 2014 at 09:53:34PM +0200, Carlos Rafael Giani wrote:
> Hello,
> 
> after building a rootfs for the Beaglebone Black, I see the
> following files in the deploy folder for the machine:
> 
> MLO
> u-boot.img
> u-boot-spl.bin
> zImage
> 
> as well as other symlinks with "-beaglebone" attached to their filenames.
> 
> What should I copy, the SPL bin, or the .img u-boot binary?
> Also, u-boot tries to load a uImage, even though a zImage was built.
> There is also no uEnv.txt file.
> Do I have to write one to be able to let u-boot load the zImage, or
> should it work out-of-the-box?

Depends on the rootfs image you are building. Most images that are based on 
core-image-base will take care of deploying necessary pieces into the rootfs. 
But core-image-minimal is special and very bare-bone, so extra manual steps 
are required.

Regardless of the rootfs image, you'd need MLO and u-boot.img to be located in 
the first FAT partition of your SD card or eMMC flash.

Then, if your rootfs does not already have zImage and the necessary DTB files 
in the /boot directory, you have to place them there (i.e. core-image-minimal) 
and you are ready to boot. All the defaults will work for out-of-the-box in 
this case. No uEnv.txt is necessary, unless you need to do something extra 
special...

-- 
Denys


Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B48D8E00343
	for <meta-ti@yoctoproject.org>; Fri, 23 Aug 2013 08:34:24 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NFYOMY025239;
	Fri, 23 Aug 2013 10:34:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NFYN2U003567;
	Fri, 23 Aug 2013 10:34:23 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 23 Aug 2013 10:34:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NFYNTq022560;
	Fri, 23 Aug 2013 10:34:23 -0500
Date: Fri, 23 Aug 2013 11:34:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Bernard Mentink <bmentink@gmail.com>
Message-ID: <20130823153422.GB27059@edge>
References: <CALEed8Ywhz3PEPEGePauXhC6b_-ahzHZSQ+BgJqk+rQMe2yDYQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALEed8Ywhz3PEPEGePauXhC6b_-ahzHZSQ+BgJqk+rQMe2yDYQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Cannot boot beaglebone image
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
X-List-Received-Date: Fri, 23 Aug 2013 15:34:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 08, 2013 at 10:57:32AM +1200, Bernard Mentink wrote:
> Hi There,
> 
> Very new to Yocto and the Ti BSP so be nice ;-)
> 
> I have built the minimal image and created an SD card with the boot and
> rootfs partitions ..
> 
> I have copied MLO (first), u-boot.img, am335x-bone.dtb, u-boot-spl.bin and
> uImage to the "boot" partition.
> (I am not sure if the am33xx file or the spl file is necessary ..)
> I have un-tar'ed the root filesystem to the "rootfs" partition.
> 
> However when I boot this card, all I see on the beaglebone black is 4
> lights on continuous ..
> There is no serial port over USB to see what is going on, and no ethernet
> device shows up, even after including dropbear in the image ..
> 
> I am at a loss ... there is no "standard" serial port to see if u-boot is
> coming up at all ..

Did you have anything in eMMC?


> By the way, to sucessfully build meta-ti, I had to add the following line
> to my local.conf   ..
> BBMASK ?= ".*/meta-ti/recipes-(misc|bsp/formfactor|graphics/mesa)/"
> 
> ... if I did not do that, the build failed with all the Angstom licencing
> rubbish (it should not be in there .... I want a "distro-less" build  ;)

Yes, that is explained in README, which nobody reads :(

-- 
Denys


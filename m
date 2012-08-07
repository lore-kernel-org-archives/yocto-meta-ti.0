Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BCFCE011AD
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2012 08:38:12 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q77Fc7MV015661;
	Tue, 7 Aug 2012 10:38:07 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q77Fc77F028597;
	Tue, 7 Aug 2012 10:38:07 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 7 Aug 2012 10:38:07 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q77Fc7oE027697;
	Tue, 7 Aug 2012 10:38:07 -0500
Date: Tue, 7 Aug 2012 11:38:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120807153806.GC8716@edge>
References: <5020D9A0.30000@communistcode.co.uk> <20120807153016.GA8716@edge>
	<015A9197-70E1-4195-BA85-71097586D635@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <015A9197-70E1-4195-BA85-71097586D635@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Turning off kernel config option
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
X-List-Received-Date: Tue, 07 Aug 2012 15:38:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 07, 2012 at 05:32:36PM +0200, Koen Kooi wrote:
> 
> Op 7 aug. 2012, om 17:30 heeft Denys Dmytriyenko <denys@ti.com> het volgende geschreven:
> 
> > On Tue, Aug 07, 2012 at 10:02:24AM +0100, Jack Mitchell wrote:
> >> I am trying to turn of CONFIG_SPI_DEBUG in the beaglebone BSP from
> >> meta-ti. I am using the poky distro configuration and I have changed
> >> the defconfig in
> >> meta-ti/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
> >> but it still builds with CONFIG_SPI_DEBUG enabled.
> > 
> > That should be the correct location, please make sure you re-do the unpack 
> > task - if you previously built the kernel with the old defconfig, it will be 
> > stored in the work directory and won't be copied from the repository above, 
> > until you repeat the do_unpack task, i.e. by clenaing the build.

BTW, no need to clean the entire build, just the kernel build:

$ bitbake virtual/kernel -c clean

> Or just increment PR as you're supposed to, it's an output change after all. 
> No need to check anything if you do it properly :) 

Well, but then you are staring to change the recipe, which might be overkill 
for a simple defconfig change you want to test. If you go that route, you may 
want to create your own custom layer with the modified defconfig overlayed on 
top of meta-ti and a simple .bbappend with PRINC. That way your changes will 
be detached from meta-ti and you won't need to merge the recipe changes every 
time meta-ti updates... Although, there's no way to bbappend the defconfig 
itself - that's where config fragments come to play.

-- 
Denys


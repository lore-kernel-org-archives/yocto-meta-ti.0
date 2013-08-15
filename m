Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 815C4E0144E
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 12:06:03 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7FJ61kP030623;
	Thu, 15 Aug 2013 14:06:01 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7FJ60bl008083;
	Thu, 15 Aug 2013 14:06:01 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 15 Aug 2013 14:06:01 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7FJ60L7015370;
	Thu, 15 Aug 2013 14:06:01 -0500
Date: Thu, 15 Aug 2013 15:06:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20130815190600.GF2190@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CABcZANkNbqisKRLHTGmRSs=mbR4VBg2TqfV+CJp54R3G2eNUng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANkNbqisKRLHTGmRSs=mbR4VBg2TqfV+CJp54R3G2eNUng@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Thu, 15 Aug 2013 19:06:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 15, 2013 at 09:25:38AM -0700, Chris Larson wrote:
> On Thu, Aug 15, 2013 at 8:52 AM, Brian Hutchinson <b.hutchman@gmail.com>wrote:
> 
> > I have a custom TI816x board that uses a modified kernel from the TI PSP.
> >  Kernel is of the 2.6.37 flavor.  I'm trying to migrate to OE Core
> > environment and I'm having trouble with getting the kernel to work.
> >
> > With the toolchain in denzil (gcc version 4.6.4 20120303), kernel will at
> > least boot but will die with:
> >
> > Unable to handle kernel NULL pointer dereference at virtual address
> > 00000002
> > pgd = c0004000
> > [00000002] *pgd=00000000
> > Internal error: Oops: 5 [#1]
> >
> > Any of the more modern toolchains (poky/meta-ti master or Linaro
> > (gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux) are used, the kernel
> > won't even make a peep ... nothing is displayed.
> >
> 
> I haven't seen the panic, but I have seen a complete silent boot hang when
> moving from 4.6 to 4.7 or 4.8 on my OMAP5 EVM board. The gcc-linaro
> toolchain worked, as did a 2012.03 sourcery toolchain, but neither the
> 2013.05 toolchain nor the internal built yocto toolchain from 1.5/master
> resulted in a successful boot. I got past that issue by cherry picking
> these two commits from a more recent kernel:
> 
> 455bd4c430b0c0a361f38e8658a0d6cb469942b5 - ARM: 7668/1: fix memset-related
> crashes caused by recent GCC (4.7.2) optimizations
> 418df63adac56841ef6b0f1fcf435bc64d4ed177 - ARM: 7670/1: fix the memset fix
> 
> See also
> http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/39864
> 
> Presumably you may need more than just that since you're also hitting a
> panic with 4.6, but it may be worth trying those as a starting point. Good
> luck!

Yes, it is often a PITA to get old kernels build and work properly with new 
toolchains. E.g. you are aware of the alignment issue with 4.7, right?

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-kernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch

-- 
Denys


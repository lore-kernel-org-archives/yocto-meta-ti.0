Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88643E01742
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 13:16:55 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MV300CJJ705FB30@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 22 Oct 2013 15:16:54 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E3E8A200AC; Tue,
	22 Oct 2013 16:16:52 -0400 (EDT)
Date: Tue, 22 Oct 2013 16:16:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Rudolf Streif <rstreif@linuxfoundation.org>, meta-ti@yoctoproject.org
Message-id: <20131022201652.GB404@denix.org>
References: <CA+gsK-qKLdXTq1PJEmXLp0d5n5wEYf+6Na+pFj+UwnWLO_dt2g@mail.gmail.com>
	<20131019023954.GK2127@edge>
	<CA+gsK-q8W-wAP-rBhy7RgHUddsbdE_SaNOgyfFQ+zj2ksSidKw@mail.gmail.com>
	<CA+gsK-owJQGEhzv9tgmiF+fORTErYVbQUhcoQ3BVLA+p3a+9Qw@mail.gmail.com>
	<CA+gsK-qaWVUGPe7fW62V+tH0F3GVZHHXGD_+LHQX7hiE7VcZRg@mail.gmail.com>
	<20131021211522.GA26549@denix.org>
	<CA+gsK-q6=AXpMNQOJYK47W_JJvhbi=YT7sdUOrjYVxC0aMDqBA@mail.gmail.com>
	<20131021231859.GA7779@edge>
	<CA+gsK-rx6conDzh=Zxk5zu7=KT=it=wZE8ZBGPaxUwhoKGuyOg@mail.gmail.com>
	<20131022193620.GB9301@edge>
MIME-version: 1.0
In-reply-to: <20131022193620.GB9301@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: AM335x EVM and core-image-sato
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
X-List-Received-Date: Tue, 22 Oct 2013 20:17:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hey, Rudi,

Just one more quick check about your board - are you sure yours is an EVM? Or 
is it an SK-EVM i.e. a "Starter Kit"? Basically, what color is the PCB of your 
board - is it green (EVM) or purple (SK)?

For example, here's the EVM:
https://plus.google.com/u/0/110579591067038943673/posts/SLB35o1JgBu

-- 
Denys



On Tue, Oct 22, 2013 at 03:36:21PM -0400, Denys Dmytriyenko wrote:
> Huh, I'm wondering if 1.2 is still supported... There were 2.0 and 2.1 
> versions of the silicon and I believe those are the latest ones. Need to 
> double-check that.
> 
> Denys
> 
> 
> On Tue, Oct 22, 2013 at 08:57:51AM +0100, Rudolf Streif wrote:
> > Where do I find the PG version of the board? The barcode sticker on the
> > board says rev 1.2.
> > 
> > 
> > On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> > 
> > > Now I'm just wondering what PG version of the board you've got, if it
> > > fails in
> > > the same way with our 3.8 kernel and a known good set of 3.12 images...
> > >
> > >
> > > On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > > > Thanks, Denys.
> > > >
> > > > Interesting point about gcc. It's version 4.8.1 which is the default for
> > > > poky master. Which is what I used all along.
> > > >
> > > > Thanks for sending your binaries. They fail too with the exact same
> > > > problem. See attached log. I found [1] on gmane which exactly describes
> > > the
> > > > problem I am seeing.
> > > >
> > > > If that is the case then I was wondering why my earlier builds with
> > > > 3.12-rc3 actually worked. And I tried them again and they are now failing
> > > > too. Of course I don't know anything about the specifics of the gpio and
> > > > the timers on the chip but it looks like a weird hardware initialization
> > > > condition. And I don't know if the proposed patch in [1] was ever
> > > > incorporated in your kernel tree.
> > > >
> > > > I don't think it's the hardware (or at least not alone) because the SD
> > > that
> > > > ships with it with the 3.2 kernel works just fine.
> > > >
> > > > Cheers,
> > > > Rudi
> > > >
> > > >
> > > > [1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
> > > >
> > > >
> > > > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.org>
> > > wrote:
> > > >
> > > > > Rudi,
> > > > >
> > > > > As we discussed earlier today, let my send you my binaries for the
> > > kernel
> > > > > and
> > > > > u-boot to try on your board. I just wanted to ask you about the
> > > toolchain
> > > > > that
> > > > > you used to build yours. In our builds we use Linaro gcc-4.7 hardfp
> > > > > toolchain
> > > > > and I vaguely remember hearing about some problems with the recent
> > > gcc-4.8
> > > > > toolchain from oe-core... I'm wondering if you are having the same
> > > issue.
> > > > >
> > > > > --
> > > > > Denys
> > > > >
> > > > >
> > > > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > > > > Since the 3.12-rc5 kernel does not work I decided to give the 3.8
> > > kernel
> > > > > a
> > > > > > try. The issue with this one is that the linux-ti-staging_3.8.bbrecipe
> > > > > > explicitly sets KERNEL_IMAGETYPE="uImage". However, the u-boot
> > > > > environment
> > > > > > has now moved on to using zImage which consequently means u-boot
> > > will not
> > > > > > find the kernel file.
> > > > > >
> > > > > > I do not know why KERNEL_IMAGETYPE = "uImage" was hacked into the
> > > > > > linux-ti-staging_3.8.bb recipe but whoever did it did not think
> > > about
> > > > > > u-boot. Does zImage not work with 3.8? I did not try it but it should
> > > > > > normally have no effect. Since there is no dependency of the u-boot
> > > > > recipes
> > > > > > on the kernel image types changes to the kernel image type for newer
> > > > > > versions of the kernel then automatically means that it must be
> > > changed
> > > > > for
> > > > > > the previous versions too.
> > > > > >
> > > > > > I mocked around with the u-boot environment and booted the 3.8 uImage
> > > > > > kernel. To my surprise the 3.8 kernel from the TI staging repository
> > > > > fails
> > > > > > with the exact same problem and stops booting with a kernel not
> > > syncing
> > > > > > message during the init calls. Apparently a patch must have been
> > > applied
> > > > > to
> > > > > > the kernel repo that breaks it. It has nothing possibly to do with
> > > the
> > > > > > build system.
> > > > > >
> > > > > > I would appreciate any hints to get this kernel built and boot on the
> > > > > board.
> > > > > >
> > > > > > Thanks,
> > > > > > Rudi
> > > > > >
> > > > > >
> > > > > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > > > > <rstreif@linuxfoundation.org>wrote:
> > > > > >
> > > > > > > Denys,
> > > > > > >
> > > > > > > I recompiled the 3.12-rc5 kernel again but it still stalls during
> > > > > > > initialization. I attached the boot log. I don't know much about
> > > the
> > > > > > > platform details but maybe that's an issue you know about.
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Rudi
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >>
> > > > > > >> [1]
> > > > > > >> Build Configuration:
> > > > > > >> BB_VERSION        = "1.21.0"
> > > > > > >> BUILD_SYS         = "x86_64-linux"
> > > > > > >> NATIVELSBSTRING   = "Fedora-18"
> > > > > > >> TARGET_SYS        = "arm-poky-linux-gnueabi"
> > > > > > >> MACHINE           = "am335x-evm"
> > > > > > >> DISTRO            = "poky"
> > > > > > >> DISTRO_VERSION    = "1.5+snapshot-20131019"
> > > > > > >> TUNE_FEATURES     = "armv7a vfp neon"
> > > > > > >> TARGET_FPU        = "vfp-neon"
> > > > > > >> meta-yocto        =
> > > "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > > >> meta-ti           =
> > > "master:c11504664990f007c3903d349e7cc135a904f8e2"
> > > > > > >> meta-oe           =
> > > "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
> > > > > > >> meta              =
> > > "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > > >>
> > > > > > >>
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > --
> > > > > > *Rudolf J. Streif*
> > > > > > Director of Embedded Solutions
> > > > > > The Linux Foundation
> > > > > >
> > > > > > rudolf.streif@linux.com
> > > > > > Phone: +1.619.537.6646
> > > > > > Skype: rudolfstreif
> > > > > > PGP: RSA 2048/2048 D6E7D28B
> > > > > >
> > > > > > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > > > > > Linux Foundation Training Schedule: training.linuxfoundation.org
> > > > >
> > > > > > _______________________________________________
> > > > > > meta-ti mailing list
> > > > > > meta-ti@yoctoproject.org
> > > > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > --
> > > > *Rudolf J. Streif*
> > > > Director of Embedded Solutions
> > > > The Linux Foundation
> > > >
> > > > rudolf.streif@linux.com
> > > > Phone: +1.619.537.6646
> > > > Skype: rudolfstreif
> > > > PGP: RSA 2048/2048 D6E7D28B
> > > >
> > > > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > > > Linux Foundation Training Schedule: training.linuxfoundation.org
> > >
> > >
> > >
> > 
> > 
> > -- 
> > -- 
> > *Rudolf J. Streif*
> > Director of Embedded Solutions
> > The Linux Foundation
> > 
> > rudolf.streif@linux.com
> > Phone: +1.619.537.6646
> > Skype: rudolfstreif
> > PGP: RSA 2048/2048 D6E7D28B
> > 
> > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > Linux Foundation Training Schedule: training.linuxfoundation.org
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 


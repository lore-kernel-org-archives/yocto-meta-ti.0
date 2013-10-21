Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACB4EE01718
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 14:15:43 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MV1007SUF1MKV90@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 21 Oct 2013 16:15:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D28EA20101; Mon,
	21 Oct 2013 17:15:22 -0400 (EDT)
Date: Mon, 21 Oct 2013 17:15:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Rudolf Streif <rstreif@linuxfoundation.org>
Message-id: <20131021211522.GA26549@denix.org>
References: <CA+gsK-p49VYtzviOwgtzssxxXnAS4Eku0Y95bsFL5LvT+v=9Sw@mail.gmail.com>
	<20131017214528.GC30989@edge>
	<CA+gsK-qKLdXTq1PJEmXLp0d5n5wEYf+6Na+pFj+UwnWLO_dt2g@mail.gmail.com>
	<20131019023954.GK2127@edge>
	<CA+gsK-q8W-wAP-rBhy7RgHUddsbdE_SaNOgyfFQ+zj2ksSidKw@mail.gmail.com>
	<CA+gsK-owJQGEhzv9tgmiF+fORTErYVbQUhcoQ3BVLA+p3a+9Qw@mail.gmail.com>
	<CA+gsK-qaWVUGPe7fW62V+tH0F3GVZHHXGD_+LHQX7hiE7VcZRg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+gsK-qaWVUGPe7fW62V+tH0F3GVZHHXGD_+LHQX7hiE7VcZRg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Mon, 21 Oct 2013 21:15:43 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Rudi,

As we discussed earlier today, let my send you my binaries for the kernel and 
u-boot to try on your board. I just wanted to ask you about the toolchain that 
you used to build yours. In our builds we use Linaro gcc-4.7 hardfp toolchain 
and I vaguely remember hearing about some problems with the recent gcc-4.8 
toolchain from oe-core... I'm wondering if you are having the same issue.

-- 
Denys


On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> Since the 3.12-rc5 kernel does not work I decided to give the 3.8 kernel a
> try. The issue with this one is that the linux-ti-staging_3.8.bb recipe
> explicitly sets KERNEL_IMAGETYPE="uImage". However, the u-boot environment
> has now moved on to using zImage which consequently means u-boot will not
> find the kernel file.
> 
> I do not know why KERNEL_IMAGETYPE = "uImage" was hacked into the
> linux-ti-staging_3.8.bb recipe but whoever did it did not think about
> u-boot. Does zImage not work with 3.8? I did not try it but it should
> normally have no effect. Since there is no dependency of the u-boot recipes
> on the kernel image types changes to the kernel image type for newer
> versions of the kernel then automatically means that it must be changed for
> the previous versions too.
> 
> I mocked around with the u-boot environment and booted the 3.8 uImage
> kernel. To my surprise the 3.8 kernel from the TI staging repository fails
> with the exact same problem and stops booting with a kernel not syncing
> message during the init calls. Apparently a patch must have been applied to
> the kernel repo that breaks it. It has nothing possibly to do with the
> build system.
> 
> I would appreciate any hints to get this kernel built and boot on the board.
> 
> Thanks,
> Rudi
> 
> 
> On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> <rstreif@linuxfoundation.org>wrote:
> 
> > Denys,
> >
> > I recompiled the 3.12-rc5 kernel again but it still stalls during
> > initialization. I attached the boot log. I don't know much about the
> > platform details but maybe that's an issue you know about.
> >
> > Thanks,
> > Rudi
> >
> >
> >
> >>
> >> [1]
> >> Build Configuration:
> >> BB_VERSION        = "1.21.0"
> >> BUILD_SYS         = "x86_64-linux"
> >> NATIVELSBSTRING   = "Fedora-18"
> >> TARGET_SYS        = "arm-poky-linux-gnueabi"
> >> MACHINE           = "am335x-evm"
> >> DISTRO            = "poky"
> >> DISTRO_VERSION    = "1.5+snapshot-20131019"
> >> TUNE_FEATURES     = "armv7a vfp neon"
> >> TARGET_FPU        = "vfp-neon"
> >> meta-yocto        = "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> >> meta-ti           = "master:c11504664990f007c3903d349e7cc135a904f8e2"
> >> meta-oe           = "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
> >> meta              = "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> >>
> >>
> >
> >
> >
> >
> >
> 
> 
> -- 
> -- 
> *Rudolf J. Streif*
> Director of Embedded Solutions
> The Linux Foundation
> 
> rudolf.streif@linux.com
> Phone: +1.619.537.6646
> Skype: rudolfstreif
> PGP: RSA 2048/2048 D6E7D28B
> 
> Linux Foundation Events Schedule:  events.linuxfoundation.org
> Linux Foundation Training Schedule: training.linuxfoundation.org

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti



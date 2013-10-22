Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C438FE01742
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 15:28:19 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9MMSFG1009938;
	Tue, 22 Oct 2013 17:28:15 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9MMSFU5029300;
	Tue, 22 Oct 2013 17:28:15 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 22 Oct 2013 17:28:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9MMSE3X017262;
	Tue, 22 Oct 2013 17:28:14 -0500
Date: Tue, 22 Oct 2013 18:28:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
Message-ID: <20131022222813.GA9802@edge>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF752@USNYGRMBX4.raymondcorp.local>
MIME-Version: 1.0
In-Reply-To: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF752@USNYGRMBX4.raymondcorp.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Tue, 22 Oct 2013 22:28:20 -0000
X-Groupsio-MsgNum: 3573
Content-Type: multipart/mixed; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Josh,

Yes, in your case it was clear from the beginning you had a problem with SK 
and it is kind of known... In Rudi's case he was saying he had an actual EVM, 
which is known to boot fine at the moment, hence I was confirming with him.

For your case, please try the DTB file attached. Thanks.

-- 
Denys


On Tue, Oct 22, 2013 at 08:36:13PM +0000, Vanderpool Josh wrote:
> It is a SK and the revision of silicon is 1.0 as it is a XAM3359ZCZ no A or 
> B after the AM335x.
> 
> ________________________________________
> From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] on behalf of meta-ti-request@yoctoproject.org [meta-ti-request@yoctoproject.org]
> Sent: Tuesday, October 22, 2013 4:17 PM
> To: meta-ti@yoctoproject.org
> Subject: meta-ti Digest, Vol 25, Issue 36
> 
> Send meta-ti mailing list submissions to
>         meta-ti@yoctoproject.org
> 
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.yoctoproject.org/listinfo/meta-ti
> or, via email, send a message with subject or body 'help' to
>         meta-ti-request@yoctoproject.org
> 
> You can reach the person managing the list at
>         meta-ti-owner@yoctoproject.org
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of meta-ti digest..."
> 
> 
> Today's Topics:
> 
>    1. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)
>    2. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)
>    3. Re: AM335x-SK kernel panic with Poky(master), meta-ti(master)
>       core-image-base (Vanderpool Josh)
>    4. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)
> 
> 
> ----------------------------------------------------------------------
> 
> Message: 1
> Date: Tue, 22 Oct 2013 15:36:21 -0400
> From: Denys Dmytriyenko <denys@ti.com>
> To: Rudolf Streif <rstreif@linuxfoundation.org>
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] AM335x EVM and core-image-sato
> Message-ID: <20131022193620.GB9301@edge>
> Content-Type: text/plain; charset="us-ascii"
> 
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
> 
> 
> ------------------------------
> 
> Message: 2
> Date: Tue, 22 Oct 2013 15:37:32 -0400
> From: Denys Dmytriyenko <denys@ti.com>
> To: Rudolf Streif <rstreif@linuxfoundation.org>
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] AM335x EVM and core-image-sato
> Message-ID: <20131022193732.GC9301@edge>
> Content-Type: text/plain; charset="us-ascii"
> 
> And just to double-check here as well - you did try all the binaries I sent
> you, including MLO, u-boot, zImage and DTB, right?
> 
> Denys
> 
> 
> On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > Thanks, Denys.
> >
> > Interesting point about gcc. It's version 4.8.1 which is the default for
> > poky master. Which is what I used all along.
> >
> > Thanks for sending your binaries. They fail too with the exact same
> > problem. See attached log. I found [1] on gmane which exactly describes the
> > problem I am seeing.
> >
> > If that is the case then I was wondering why my earlier builds with
> > 3.12-rc3 actually worked. And I tried them again and they are now failing
> > too. Of course I don't know anything about the specifics of the gpio and
> > the timers on the chip but it looks like a weird hardware initialization
> > condition. And I don't know if the proposed patch in [1] was ever
> > incorporated in your kernel tree.
> >
> > I don't think it's the hardware (or at least not alone) because the SD that
> > ships with it with the 3.2 kernel works just fine.
> >
> > Cheers,
> > Rudi
> >
> >
> > [1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
> >
> >
> > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > > Rudi,
> > >
> > > As we discussed earlier today, let my send you my binaries for the kernel
> > > and
> > > u-boot to try on your board. I just wanted to ask you about the toolchain
> > > that
> > > you used to build yours. In our builds we use Linaro gcc-4.7 hardfp
> > > toolchain
> > > and I vaguely remember hearing about some problems with the recent gcc-4.8
> > > toolchain from oe-core... I'm wondering if you are having the same issue.
> > >
> > > --
> > > Denys
> > >
> > >
> > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > > Since the 3.12-rc5 kernel does not work I decided to give the 3.8 kernel
> > > a
> > > > try. The issue with this one is that the linux-ti-staging_3.8.bb recipe
> > > > explicitly sets KERNEL_IMAGETYPE="uImage". However, the u-boot
> > > environment
> > > > has now moved on to using zImage which consequently means u-boot will not
> > > > find the kernel file.
> > > >
> > > > I do not know why KERNEL_IMAGETYPE = "uImage" was hacked into the
> > > > linux-ti-staging_3.8.bb recipe but whoever did it did not think about
> > > > u-boot. Does zImage not work with 3.8? I did not try it but it should
> > > > normally have no effect. Since there is no dependency of the u-boot
> > > recipes
> > > > on the kernel image types changes to the kernel image type for newer
> > > > versions of the kernel then automatically means that it must be changed
> > > for
> > > > the previous versions too.
> > > >
> > > > I mocked around with the u-boot environment and booted the 3.8 uImage
> > > > kernel. To my surprise the 3.8 kernel from the TI staging repository
> > > fails
> > > > with the exact same problem and stops booting with a kernel not syncing
> > > > message during the init calls. Apparently a patch must have been applied
> > > to
> > > > the kernel repo that breaks it. It has nothing possibly to do with the
> > > > build system.
> > > >
> > > > I would appreciate any hints to get this kernel built and boot on the
> > > board.
> > > >
> > > > Thanks,
> > > > Rudi
> > > >
> > > >
> > > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > > <rstreif@linuxfoundation.org>wrote:
> > > >
> > > > > Denys,
> > > > >
> > > > > I recompiled the 3.12-rc5 kernel again but it still stalls during
> > > > > initialization. I attached the boot log. I don't know much about the
> > > > > platform details but maybe that's an issue you know about.
> > > > >
> > > > > Thanks,
> > > > > Rudi
> > > > >
> > > > >
> > > > >
> > > > >>
> > > > >> [1]
> > > > >> Build Configuration:
> > > > >> BB_VERSION        = "1.21.0"
> > > > >> BUILD_SYS         = "x86_64-linux"
> > > > >> NATIVELSBSTRING   = "Fedora-18"
> > > > >> TARGET_SYS        = "arm-poky-linux-gnueabi"
> > > > >> MACHINE           = "am335x-evm"
> > > > >> DISTRO            = "poky"
> > > > >> DISTRO_VERSION    = "1.5+snapshot-20131019"
> > > > >> TUNE_FEATURES     = "armv7a vfp neon"
> > > > >> TARGET_FPU        = "vfp-neon"
> > > > >> meta-yocto        = "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > >> meta-ti           = "master:c11504664990f007c3903d349e7cc135a904f8e2"
> > > > >> meta-oe           = "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
> > > > >> meta              = "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > >>
> > > > >>
> > > > >
> > > > >
> > > > >
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
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
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
> 
> 
> 
> 
> ------------------------------
> 
> Message: 3
> Date: Tue, 22 Oct 2013 19:52:13 +0000
> From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
> To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
> Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),
>         meta-ti(master) core-image-base
> Message-ID:
>         <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF6D7@USNYGRMBX4.raymondcorp.local>
> 
> Content-Type: text/plain; charset="us-ascii"
> 
> Thanks for the links Rudi, I looked for the file referenced in [2] "arch/arm/mach-omap2/cclock33xx_data.c" to see if the patch works but...
> 
> There is no cclock33xx_data.c rather there is in tmp/work/am335x_evm-poky-linux-gnueabi/linux-ti-staging/3.11+3.12-rc5-r20a+gitrAUTOINC+eb765a394c/git/arch/arm/mach-omap2/cclock3xxx_data.c.
> 
> however a search I found tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/linux-libc-headers/3.10-r0/linux-3.10/arch/arm/mach-omap2/cclock33xx_data.c
> 
> So it appears there is mis-match as the patch is in the 3.10 files that re in the armv7a-vfp-neon-poky-linux-gnueabi directory?
> 
> So is this something that is just lost from the 3.12-rc5 kernel and shouldn't the linux-linc-headers be the version being built?
> 
> Unfortunately being inexperienced with the project I am at a loss at how to fix this but hope this help point someone to the solution.
> 
> Regards,
> Josh
> 
> ________________________________________
> From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] on behalf of meta-ti-request@yoctoproject.org [meta-ti-request@yoctoproject.org]
> Sent: Tuesday, October 22, 2013 3:00 PM
> To: meta-ti@yoctoproject.org
> Subject: meta-ti Digest, Vol 25, Issue 35
> 
> Send meta-ti mailing list submissions to
>         meta-ti@yoctoproject.org
> 
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.yoctoproject.org/listinfo/meta-ti
> or, via email, send a message with subject or body 'help' to
>         meta-ti-request@yoctoproject.org
> 
> You can reach the person managing the list at
>         meta-ti-owner@yoctoproject.org
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of meta-ti digest..."
> 
> 
> Today's Topics:
> 
>    1. Re: AM335x-SK kernel panic with Poky(master), meta-ti(master)
>       core-image-base (Rudolf Streif)
> 
> 
> ----------------------------------------------------------------------
> 
> Message: 1
> Date: Tue, 22 Oct 2013 18:18:29 +0100
> From: Rudolf Streif <rstreif@linuxfoundation.org>
> To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
> Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
> Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),
>         meta-ti(master) core-image-base
> Message-ID:
>         <CA+gsK-pNkDYCcecOftuopRu9XnxK3Xr9ZbSU23yekqQEczCYeg@mail.gmail.com>
> Content-Type: text/plain; charset="iso-8859-1"
> 
> Hi Josh,
> 
> I am seeing the exact same problem with my am335x-evmsk and the latest
> meta-ti with 3.12-rc5 kernel. I posted it on this mailing list [1].
> 
> This problem looks like the one posted here [2].
> 
> The bad news is I don't have a solution for it. The good news is that Denys
> and I are attending the same conference and I keep harassing him about it.
> :)
> 
> Cheers,
> Rudi
> 
> 
> [1]
> https://lists.yoctoproject.org/pipermail/meta-ti/2013-October/003519.html
> [2] http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
> 
> 
> On Tue, Oct 22, 2013 at 5:28 PM, Vanderpool Josh <
> Joshua.Vanderpool@raymondcorp.com> wrote:
> 
> > I am having a similar issue as Rudi.
> > Attached is the bootLog.
> >
> >
> > Build Configuration:
> > BB_VERSION        = "1.21.0"
> > BUILD_SYS         = "x86_64-linux"
> > NATIVELSBSTRING   = "Ubuntu-12.04"
> > TARGET_SYS        = "arm-poky-linux-gnueabi"
> > MACHINE           = "am335x-evm"
> > DISTRO            = "poky"
> > DISTRO_VERSION    = "1.5+snapshot-20131022"
> > TUNE_FEATURES     = "armv7a vfp neon"
> > TARGET_FPU        = "vfp-neon"
> > meta
> > meta-yocto        = "master:505114c13d29799a25379f7ce720d632616d8776"
> > meta-ti           = "master:c11504664990f007c3903d349e7cc135a904f8e2"
> > meta-qt5          = "master:84cd4be2491895b0c3a0af64e4c83d58910d1f6c"
> >
> > Josh Vanderpool
> > Electrical Engineer
> > Control Systems
> > The Raymond Corporation
> > 20 South Canal Street
> > Greene, New York 13778-0130
> > Phone: 607-656-2617
> > Fax: 607-656-4845
> > joshua.vanderpool@raymondcorp.com
> > http://www.raymondcorp.com
> >
> >
> > Confidentiality Notice:
> >
> > The preceding e-mail message (including any attachments) contains
> > information that may be confidential, protected by applicable legal
> > privileges, or constitute non-public information. It is intended to be
> > conveyed only to the designated recipient(s). If you are not an intended
> > recipient of this message, please notify the sender by replying to this
> > message and then delete it from your system. Use, dissemination,
> > distribution or reproduction of this message by unintended recipients is
> > not authorized and may be unlawful.
> >
> >
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: <http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20131022/34dc4b0c/attachment-0001.html>
> 
> ------------------------------
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 
> 
> End of meta-ti Digest, Vol 25, Issue 35
> ***************************************
> Confidentiality Notice:
> 
> The preceding e-mail message (including any attachments) contains information that may be confidential, protected by applicable legal privileges, or constitute non-public information. It is intended to be conveyed only to the designated recipient(s). If you are not an intended recipient of this message, please notify the sender by replying to this message and then delete it from your system. Use, dissemination, distribution or reproduction of this message by unintended recipients is
> not authorized and may be unlawful.
> 
> 
> 
> 
> 
> ------------------------------
> 
> Message: 4
> Date: Tue, 22 Oct 2013 16:16:52 -0400
> From: Denys Dmytriyenko <denys@ti.com>
> To: Rudolf Streif <rstreif@linuxfoundation.org>,
>         meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] AM335x EVM and core-image-sato
> Message-ID: <20131022201652.GB404@denix.org>
> Content-Type: text/plain; charset=us-ascii
> 
> Hey, Rudi,
> 
> Just one more quick check about your board - are you sure yours is an EVM? Or
> is it an SK-EVM i.e. a "Starter Kit"? Basically, what color is the PCB of your
> board - is it green (EVM) or purple (SK)?
> 
> For example, here's the EVM:
> https://plus.google.com/u/0/110579591067038943673/posts/SLB35o1JgBu
> 
> --
> Denys
> 
> 
> 
> On Tue, Oct 22, 2013 at 03:36:21PM -0400, Denys Dmytriyenko wrote:
> > Huh, I'm wondering if 1.2 is still supported... There were 2.0 and 2.1
> > versions of the silicon and I believe those are the latest ones. Need to
> > double-check that.
> >
> > Denys
> >
> >
> > On Tue, Oct 22, 2013 at 08:57:51AM +0100, Rudolf Streif wrote:
> > > Where do I find the PG version of the board? The barcode sticker on the
> > > board says rev 1.2.
> > >
> > >
> > > On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > > Now I'm just wondering what PG version of the board you've got, if it
> > > > fails in
> > > > the same way with our 3.8 kernel and a known good set of 3.12 images...
> > > >
> > > >
> > > > On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > > > > Thanks, Denys.
> > > > >
> > > > > Interesting point about gcc. It's version 4.8.1 which is the default for
> > > > > poky master. Which is what I used all along.
> > > > >
> > > > > Thanks for sending your binaries. They fail too with the exact same
> > > > > problem. See attached log. I found [1] on gmane which exactly describes
> > > > the
> > > > > problem I am seeing.
> > > > >
> > > > > If that is the case then I was wondering why my earlier builds with
> > > > > 3.12-rc3 actually worked. And I tried them again and they are now failing
> > > > > too. Of course I don't know anything about the specifics of the gpio and
> > > > > the timers on the chip but it looks like a weird hardware initialization
> > > > > condition. And I don't know if the proposed patch in [1] was ever
> > > > > incorporated in your kernel tree.
> > > > >
> > > > > I don't think it's the hardware (or at least not alone) because the SD
> > > > that
> > > > > ships with it with the 3.2 kernel works just fine.
> > > > >
> > > > > Cheers,
> > > > > Rudi
> > > > >
> > > > >
> > > > > [1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
> > > > >
> > > > >
> > > > > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.org>
> > > > wrote:
> > > > >
> > > > > > Rudi,
> > > > > >
> > > > > > As we discussed earlier today, let my send you my binaries for the
> > > > kernel
> > > > > > and
> > > > > > u-boot to try on your board. I just wanted to ask you about the
> > > > toolchain
> > > > > > that
> > > > > > you used to build yours. In our builds we use Linaro gcc-4.7 hardfp
> > > > > > toolchain
> > > > > > and I vaguely remember hearing about some problems with the recent
> > > > gcc-4.8
> > > > > > toolchain from oe-core... I'm wondering if you are having the same
> > > > issue.
> > > > > >
> > > > > > --
> > > > > > Denys
> > > > > >
> > > > > >
> > > > > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > > > > > Since the 3.12-rc5 kernel does not work I decided to give the 3.8
> > > > kernel
> > > > > > a
> > > > > > > try. The issue with this one is that the linux-ti-staging_3.8.bbrecipe
> > > > > > > explicitly sets KERNEL_IMAGETYPE="uImage". However, the u-boot
> > > > > > environment
> > > > > > > has now moved on to using zImage which consequently means u-boot
> > > > will not
> > > > > > > find the kernel file.
> > > > > > >
> > > > > > > I do not know why KERNEL_IMAGETYPE = "uImage" was hacked into the
> > > > > > > linux-ti-staging_3.8.bb recipe but whoever did it did not think
> > > > about
> > > > > > > u-boot. Does zImage not work with 3.8? I did not try it but it should
> > > > > > > normally have no effect. Since there is no dependency of the u-boot
> > > > > > recipes
> > > > > > > on the kernel image types changes to the kernel image type for newer
> > > > > > > versions of the kernel then automatically means that it must be
> > > > changed
> > > > > > for
> > > > > > > the previous versions too.
> > > > > > >
> > > > > > > I mocked around with the u-boot environment and booted the 3.8 uImage
> > > > > > > kernel. To my surprise the 3.8 kernel from the TI staging repository
> > > > > > fails
> > > > > > > with the exact same problem and stops booting with a kernel not
> > > > syncing
> > > > > > > message during the init calls. Apparently a patch must have been
> > > > applied
> > > > > > to
> > > > > > > the kernel repo that breaks it. It has nothing possibly to do with
> > > > the
> > > > > > > build system.
> > > > > > >
> > > > > > > I would appreciate any hints to get this kernel built and boot on the
> > > > > > board.
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Rudi
> > > > > > >
> > > > > > >
> > > > > > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > > > > > <rstreif@linuxfoundation.org>wrote:
> > > > > > >
> > > > > > > > Denys,
> > > > > > > >
> > > > > > > > I recompiled the 3.12-rc5 kernel again but it still stalls during
> > > > > > > > initialization. I attached the boot log. I don't know much about
> > > > the
> > > > > > > > platform details but maybe that's an issue you know about.
> > > > > > > >
> > > > > > > > Thanks,
> > > > > > > > Rudi
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > >>
> > > > > > > >> [1]
> > > > > > > >> Build Configuration:
> > > > > > > >> BB_VERSION        = "1.21.0"
> > > > > > > >> BUILD_SYS         = "x86_64-linux"
> > > > > > > >> NATIVELSBSTRING   = "Fedora-18"
> > > > > > > >> TARGET_SYS        = "arm-poky-linux-gnueabi"
> > > > > > > >> MACHINE           = "am335x-evm"
> > > > > > > >> DISTRO            = "poky"
> > > > > > > >> DISTRO_VERSION    = "1.5+snapshot-20131019"
> > > > > > > >> TUNE_FEATURES     = "armv7a vfp neon"
> > > > > > > >> TARGET_FPU        = "vfp-neon"
> > > > > > > >> meta-yocto        =
> > > > "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > > > >> meta-ti           =
> > > > "master:c11504664990f007c3903d349e7cc135a904f8e2"
> > > > > > > >> meta-oe           =
> > > > "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
> > > > > > > >> meta              =
> > > > "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > > > >>
> > > > > > > >>
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > --
> > > > > > > *Rudolf J. Streif*
> > > > > > > Director of Embedded Solutions
> > > > > > > The Linux Foundation
> > > > > > >
> > > > > > > rudolf.streif@linux.com
> > > > > > > Phone: +1.619.537.6646
> > > > > > > Skype: rudolfstreif
> > > > > > > PGP: RSA 2048/2048 D6E7D28B
> > > > > > >
> > > > > > > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > > > > > > Linux Foundation Training Schedule: training.linuxfoundation.org
> > > > > >
> > > > > > > _______________________________________________
> > > > > > > meta-ti mailing list
> > > > > > > meta-ti@yoctoproject.org
> > > > > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > --
> > > > > *Rudolf J. Streif*
> > > > > Director of Embedded Solutions
> > > > > The Linux Foundation
> > > > >
> > > > > rudolf.streif@linux.com
> > > > > Phone: +1.619.537.6646
> > > > > Skype: rudolfstreif
> > > > > PGP: RSA 2048/2048 D6E7D28B
> > > > >
> > > > > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > > > > Linux Foundation Training Schedule: training.linuxfoundation.org
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > --
> > > *Rudolf J. Streif*
> > > Director of Embedded Solutions
> > > The Linux Foundation
> > >
> > > rudolf.streif@linux.com
> > > Phone: +1.619.537.6646
> > > Skype: rudolfstreif
> > > PGP: RSA 2048/2048 D6E7D28B
> > >
> > > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > > Linux Foundation Training Schedule: training.linuxfoundation.org
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> 
> 
> ------------------------------
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 
> 
> End of meta-ti Digest, Vol 25, Issue 36
> ***************************************
> Confidentiality Notice:
> 
> The preceding e-mail message (including any attachments) contains information that may be confidential, protected by applicable legal privileges, or constitute non-public information. It is intended to be conveyed only to the designated recipient(s). If you are not an intended recipient of this message, please notify the sender by replying to this message and then delete it from your system. Use, dissemination, distribution or reproduction of this message by unintended recipients is 
> not authorized and may be unlawful.
> 
> 
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

--Q68bSM7Ycu6FN28Q
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="am335x-evmsk.dtb"
Content-Transfer-Encoding: base64

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
bGVkQDEAAAAAAAADAAAAEQAACG5ldm1zazpncmVlbjp1c3IwAAAAAAAAAAMAAAAMAAAIdAAAAFMA
AAAEAAAAAAAAAAMAAAAEAAAIem9mZgAAAAACAAAAAWxlZEAyAAAAAAAAAwAAABEAAAhuZXZtc2s6
Z3JlZW46dXNyMQAAAAAAAAADAAAADAAACHQAAABTAAAABQAAAAAAAAADAAAABAAACHpvZmYAAAAA
AgAAAAFsZWRAMwAAAAAAAAMAAAARAAAIbmV2bXNrOmdyZWVuOm1tYzAAAAAAAAAAAwAAAAwAAAh0
AAAAUwAAAAYAAAAAAAAAAwAAAAUAAAiIbW1jMAAAAAAAAAADAAAABAAACHpvZmYAAAAAAgAAAAFs
ZWRANAAAAAAAAAMAAAAWAAAIbmV2bXNrOmdyZWVuOmhlYXJ0YmVhdAAAAAAAAAMAAAAMAAAIdAAA
AFMAAAAHAAAAAAAAAAMAAAAKAAAIiGhlYXJ0YmVhdAAAAAAAAAMAAAAEAAAIem9mZgAAAAACAAAA
AgAAAAFiYWNrbGlnaHQAAAAAAAADAAAADgAAABtwd20tYmFja2xpZ2h0AAAAAAAAAwAAABAAAAie
AAAAVAAAAAAAAMNQAAAAAQAAAAMAAAAkAAAIowAAAAAAAAA6AAAAPQAAAEIAAABLAAAAWgAAAH0A
AACqAAAA/wAAAAMAAAAEAAAItQAAAAgAAAACAAAAAgAAAAkjYWRkcmVzcy1jZWxscwAjc2l6ZS1j
ZWxscwBjb21wYXRpYmxlAGludGVycnVwdC1wYXJlbnQAbW9kZWwAc2VyaWFsMABzZXJpYWwxAHNl
cmlhbDIAc2VyaWFsMwBzZXJpYWw0AHNlcmlhbDUAZF9jYW4wAGRfY2FuMQB1c2IwAHVzYjEAcGh5
MABwaHkxAGV0aGVybmV0MABldGhlcm5ldDEAZGV2aWNlX3R5cGUAcmVnAG9wZXJhdGluZy1wb2lu
dHMAdm9sdGFnZS10b2xlcmFuY2UAY2xvY2tzAGNsb2NrLW5hbWVzAGNsb2NrLWxhdGVuY3kAY3B1
MC1zdXBwbHkAdGksaHdtb2RzAHBpbmN0cmwtc2luZ2xlLHJlZ2lzdGVyLXdpZHRoAHBpbmN0cmwt
c2luZ2xlLGZ1bmN0aW9uLW1hc2sAcGluY3RybC1uYW1lcwBwaW5jdHJsLTAAcGluY3RybC1zaW5n
bGUscGlucwBsaW51eCxwaGFuZGxlAHJhbmdlcwBpbnRlcnJ1cHQtY29udHJvbGxlcgAjaW50ZXJy
dXB0LWNlbGxzAHRpLGludGMtc2l6ZQBpbnRlcnJ1cHRzACNkbWEtY2VsbHMAZG1hLWNoYW5uZWxz
AHRpLGVkbWEtcmVnaW9ucwB0aSxlZG1hLXNsb3RzAGdwaW8tY29udHJvbGxlcgAjZ3Bpby1jZWxs
cwB0aSxuby1yZXNldABjbG9jay1mcmVxdWVuY3kAc3RhdHVzAHZjYzEtc3VwcGx5AHZjYzItc3Vw
cGx5AHZjYzMtc3VwcGx5AHZjYzQtc3VwcGx5AHZjYzUtc3VwcGx5AHZjYzYtc3VwcGx5AHZjYzct
c3VwcGx5AHZjY2lvLXN1cHBseQByZWd1bGF0b3ItY29tcGF0aWJsZQByZWd1bGF0b3ItYWx3YXlz
LW9uAHJlZ3VsYXRvci1uYW1lAHJlZ3VsYXRvci1taW4tbWljcm92b2x0AHJlZ3VsYXRvci1tYXgt
bWljcm92b2x0AHJlZ3VsYXRvci1ib290LW9uAFZkZC1zdXBwbHkAVmRkX0lPLXN1cHBseQBzdCxj
bGljay1zaW5nbGUteABzdCxjbGljay1zaW5nbGUteQBzdCxjbGljay1zaW5nbGUtegBzdCxjbGlj
ay10aHJlc2gteABzdCxjbGljay10aHJlc2gteQBzdCxjbGljay10aHJlc2gtegBzdCxpcnExLWNs
aWNrAHN0LGlycTItY2xpY2sAc3Qsd2FrZXVwLXgtbG8Ac3Qsd2FrZXVwLXgtaGkAc3Qsd2FrZXVw
LXktbG8Ac3Qsd2FrZXVwLXktaGkAc3Qsd2FrZXVwLXotbG8Ac3Qsd2FrZXVwLXotaGkAc3QsbWlu
LWxpbWl0LXgAc3QsbWluLWxpbWl0LXkAc3QsbWluLWxpbWl0LXoAc3QsbWF4LWxpbWl0LXgAc3Qs
bWF4LWxpbWl0LXkAc3QsbWF4LWxpbWl0LXoAQVZERC1zdXBwbHkASU9WREQtc3VwcGx5AERSVkRE
LXN1cHBseQBEVkRELXN1cHBseQB0aSxkdWFsLXZvbHQAdGksbmVlZHMtc3BlY2lhbC1yZXNldAB0
aSxuZWVkcy1zcGVjaWFsLWhzLWhhbmRsaW5nAGRtYXMAZG1hLW5hbWVzAHZtbWMtc3VwcGx5AGJ1
cy13aWR0aAB0aSxtYm94LW51bS11c2VycwB0aSxtYm94LW51bS1maWZvcwB0aSxtYm94LW5hbWVz
AHRpLG1ib3gtZGF0YQB0aSx0aW1lci1hbHdvbgB0aSx0aW1lci1wd20AdGksc3BpLW51bS1jcwBy
ZWctbmFtZXMAdGksY3RybF9tb2QAaW50ZXJydXB0LW5hbWVzAGRyX21vZGUAbWVudG9yLG11bHRp
cG9pbnQAbWVudG9yLG51bS1lcHMAbWVudG9yLHJhbS1iaXRzAG1lbnRvcixwb3dlcgBwaHlzACNk
bWEtY2hhbm5lbHMAI2RtYS1yZXF1ZXN0cwAjcHdtLWNlbGxzAGNwZG1hX2NoYW5uZWxzAGFsZV9l
bnRyaWVzAGJkX3JhbV9zaXplAG5vX2JkX3JhbQByeF9kZXNjcwBtYWNfY29udHJvbABzbGF2ZXMA
YWN0aXZlX3NsYXZlAGNwdHNfY2xvY2tfbXVsdABjcHRzX2Nsb2NrX3NoaWZ0AHBpbmN0cmwtMQBi
dXNfZnJlcQBtYWMtYWRkcmVzcwBwaHlfaWQAcGh5LW1vZGUAI2lvLWNoYW5uZWwtY2VsbHMAdGks
bm8taWRsZQBncG1jLG51bS1jcwBncG1jLG51bS13YWl0cGlucwAjcmVzZXQtY2VsbHMAaGFjdGl2
ZQB2YWN0aXZlAGhiYWNrLXBvcmNoAGhmcm9udC1wb3JjaABoc3luYy1sZW4AdmJhY2stcG9yY2gA
dmZyb250LXBvcmNoAHZzeW5jLWxlbgBoc3luYy1hY3RpdmUAdnN5bmMtYWN0aXZlAGludGVycnVw
dHMtbmFtZXMAb3AtbW9kZQB0ZG0tc2xvdHMAc2VyaWFsLWRpcgB0eC1udW0tZXZ0AHJ4LW51bS1l
dnQAdGksbW9kZWwAdGksYXVkaW8tY29kZWMAdGksbWNhc3AtY29udHJvbGxlcgB0aSxjb2RlYy1j
bG9jay1yYXRlAHRpLGF1ZGlvLXJvdXRpbmcAI2Nsb2NrLWNlbGxzAGJpdC1zaGlmdABiaXQtbWFz
awBpbmRleC1zdGFydHMtYXQtb25lAGNsb2NrLW11bHQAY2xvY2stZGl2AHNldC1yYXRlLXBhcmVu
dAB0YWJsZQBpbmRleC1wb3dlci1vZi10d28AbGFiZWwAZ3Bpb3MAZGVmYXVsdC1zdGF0ZQBsaW51
eCxkZWZhdWx0LXRyaWdnZXIAcHdtcwBicmlnaHRuZXNzLWxldmVscwBkZWZhdWx0LWJyaWdodG5l
c3MtbGV2ZWwA

--Q68bSM7Ycu6FN28Q--

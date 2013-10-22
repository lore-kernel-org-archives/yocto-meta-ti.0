Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E880E01746
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 16:47:52 -0700 (PDT)
Received: by mail-ea0-f171.google.com with SMTP id n15so21283ead.2
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 16:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eRiebfYhuQ1jxD5r4KWwFSI4i0ZsIYkn5x1kh2IZwZ0=;
	b=RBrrYSRGy/++BV4rMfuTwsBzSruX8r2rPr9WuNKgkTd468ZbwACtoVLR+c4Cqy/FLM
	wTB1xia4/UmjVrbrrUm5HtgMlL5ekYWFXDpDXrYYSgMNyhd0AGkYf97QNWUr5jdyxIhC
	RyJjG1wxmLTeU9qvCKTBHl0nhS+pJT6WwB5g4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=eRiebfYhuQ1jxD5r4KWwFSI4i0ZsIYkn5x1kh2IZwZ0=;
	b=m9ia1llXcSIXBLnDlKS2wc0o9MIXrMtB/n7VNYQ1+XAa/jPrUg6fBqkEhUHRau6X1K
	DgN59KcMUv8G7CIlCRXZ1SQIbG4lvx41b9hhUlBxlodbyjR3RTjV1ZbIlClYKhVj/w3N
	BcBU+pBjulCbnEySwbmrfeXIrV5x7uPGbkQHhc7uzPjDi797cYTec/wA/pFwN5+IvoOz
	lnk1CcSE1Smp/PzV49hNGdHyBZijRAH9vYzM0COBBqnSYiq2Y2Q8jtJb/E36ImsKc9z5
	CBurobWgUFV3pTCcXOB98t6CKiyT7S2owFNTi5ZkeqOfAlItRAOlzu1TaXSEp6YW2cZN
	tsqQ==
X-Gm-Message-State: ALoCoQkviOKSPLgoy4Y+1PEig7+0DQx+01v+ZwiYDe+I3wQXnfHLEaqGhSKtXin0IhmAGRlEQ3jc
MIME-Version: 1.0
X-Received: by 10.15.53.132 with SMTP id r4mr31572769eew.5.1382485671452; Tue,
	22 Oct 2013 16:47:51 -0700 (PDT)
Received: by 10.223.147.133 with HTTP; Tue, 22 Oct 2013 16:47:51 -0700 (PDT)
In-Reply-To: <20131022222813.GA9802@edge>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF752@USNYGRMBX4.raymondcorp.local>
	<20131022222813.GA9802@edge>
Date: Wed, 23 Oct 2013 00:47:51 +0100
Message-ID: <CA+gsK-oiA9pOpFrietcPdF-qLYH6Uzv0OHmYYyzXS0Lk9Yy7ZA@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
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
X-List-Received-Date: Tue, 22 Oct 2013 23:47:53 -0000
Content-Type: multipart/alternative; boundary=001a11c38f105ab05a04e95d079b

--001a11c38f105ab05a04e95d079b
Content-Type: text/plain; charset=ISO-8859-1

Denys,

Sorry, yes, the board I have is a am335x_evmsk. I forgot to write it out
correctly in the subject line. it's a purple board. I have been using the
correct device tree file all along.

The board revision is 1.2B. The CPU is XAM3359ZCZ. On boot the kernel
reports:

[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7),
cr=10c53c7d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] Machine: am335xevm
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] AM335X ES1.0 (sgx neon )

Maybe that helps you to determine what CPU revision that is.

I built a 3.2.0 kernel with core-image-sato and it works just fine (after
enabling tmpdevfs support in the kernel).

It may will be a combination of that hardware with the newer kernel
versions. I just bought the board a couple of weeks ago from DigiKey. If it
is an older CPU revision then they are apparently selling older stock.

If the CPU revision not being supported by the newer kernel is indeed the
root cause of the issue then this may become frustrating for more users.
There is no way that a user can reasonably find out that the kernel does
not boot because of the CPU revision. I don't know what has changed between
the CPU revisions but I would think that the kernel should support all of
them.

Cheers,
Rudi




On Tue, Oct 22, 2013 at 11:28 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> Josh,
>
> Yes, in your case it was clear from the beginning you had a problem with SK
> and it is kind of known... In Rudi's case he was saying he had an actual
> EVM,
> which is known to boot fine at the moment, hence I was confirming with him.
>
> For your case, please try the DTB file attached. Thanks.
>
> --
> Denys
>
>
> On Tue, Oct 22, 2013 at 08:36:13PM +0000, Vanderpool Josh wrote:
> > It is a SK and the revision of silicon is 1.0 as it is a XAM3359ZCZ no A
> or
> > B after the AM335x.
> >
> > ________________________________________
> > From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org]
> on behalf of meta-ti-request@yoctoproject.org [
> meta-ti-request@yoctoproject.org]
> > Sent: Tuesday, October 22, 2013 4:17 PM
> > To: meta-ti@yoctoproject.org
> > Subject: meta-ti Digest, Vol 25, Issue 36
> >
> > Send meta-ti mailing list submissions to
> >         meta-ti@yoctoproject.org
> >
> > To subscribe or unsubscribe via the World Wide Web, visit
> >         https://lists.yoctoproject.org/listinfo/meta-ti
> > or, via email, send a message with subject or body 'help' to
> >         meta-ti-request@yoctoproject.org
> >
> > You can reach the person managing the list at
> >         meta-ti-owner@yoctoproject.org
> >
> > When replying, please edit your Subject line so it is more specific
> > than "Re: Contents of meta-ti digest..."
> >
> >
> > Today's Topics:
> >
> >    1. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)
> >    2. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)
> >    3. Re: AM335x-SK kernel panic with Poky(master), meta-ti(master)
> >       core-image-base (Vanderpool Josh)
> >    4. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)
> >
> >
> > ----------------------------------------------------------------------
> >
> > Message: 1
> > Date: Tue, 22 Oct 2013 15:36:21 -0400
> > From: Denys Dmytriyenko <denys@ti.com>
> > To: Rudolf Streif <rstreif@linuxfoundation.org>
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] AM335x EVM and core-image-sato
> > Message-ID: <20131022193620.GB9301@edge>
> > Content-Type: text/plain; charset="us-ascii"
> >
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
> > > On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko <denys@ti.com>
> wrote:
> > >
> > > > Now I'm just wondering what PG version of the board you've got, if it
> > > > fails in
> > > > the same way with our 3.8 kernel and a known good set of 3.12
> images...
> > > >
> > > >
> > > > On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > > > > Thanks, Denys.
> > > > >
> > > > > Interesting point about gcc. It's version 4.8.1 which is the
> default for
> > > > > poky master. Which is what I used all along.
> > > > >
> > > > > Thanks for sending your binaries. They fail too with the exact same
> > > > > problem. See attached log. I found [1] on gmane which exactly
> describes
> > > > the
> > > > > problem I am seeing.
> > > > >
> > > > > If that is the case then I was wondering why my earlier builds with
> > > > > 3.12-rc3 actually worked. And I tried them again and they are now
> failing
> > > > > too. Of course I don't know anything about the specifics of the
> gpio and
> > > > > the timers on the chip but it looks like a weird hardware
> initialization
> > > > > condition. And I don't know if the proposed patch in [1] was ever
> > > > > incorporated in your kernel tree.
> > > > >
> > > > > I don't think it's the hardware (or at least not alone) because
> the SD
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
> > > > > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <
> denis@denix.org>
> > > > wrote:
> > > > >
> > > > > > Rudi,
> > > > > >
> > > > > > As we discussed earlier today, let my send you my binaries for
> the
> > > > kernel
> > > > > > and
> > > > > > u-boot to try on your board. I just wanted to ask you about the
> > > > toolchain
> > > > > > that
> > > > > > you used to build yours. In our builds we use Linaro gcc-4.7
> hardfp
> > > > > > toolchain
> > > > > > and I vaguely remember hearing about some problems with the
> recent
> > > > gcc-4.8
> > > > > > toolchain from oe-core... I'm wondering if you are having the
> same
> > > > issue.
> > > > > >
> > > > > > --
> > > > > > Denys
> > > > > >
> > > > > >
> > > > > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > > > > > Since the 3.12-rc5 kernel does not work I decided to give the
> 3.8
> > > > kernel
> > > > > > a
> > > > > > > try. The issue with this one is that the
> linux-ti-staging_3.8.bbrecipe
> > > > > > > explicitly sets KERNEL_IMAGETYPE="uImage". However, the u-boot
> > > > > > environment
> > > > > > > has now moved on to using zImage which consequently means
> u-boot
> > > > will not
> > > > > > > find the kernel file.
> > > > > > >
> > > > > > > I do not know why KERNEL_IMAGETYPE = "uImage" was hacked into
> the
> > > > > > > linux-ti-staging_3.8.bb recipe but whoever did it did not
> think
> > > > about
> > > > > > > u-boot. Does zImage not work with 3.8? I did not try it but it
> should
> > > > > > > normally have no effect. Since there is no dependency of the
> u-boot
> > > > > > recipes
> > > > > > > on the kernel image types changes to the kernel image type for
> newer
> > > > > > > versions of the kernel then automatically means that it must be
> > > > changed
> > > > > > for
> > > > > > > the previous versions too.
> > > > > > >
> > > > > > > I mocked around with the u-boot environment and booted the 3.8
> uImage
> > > > > > > kernel. To my surprise the 3.8 kernel from the TI staging
> repository
> > > > > > fails
> > > > > > > with the exact same problem and stops booting with a kernel not
> > > > syncing
> > > > > > > message during the init calls. Apparently a patch must have
> been
> > > > applied
> > > > > > to
> > > > > > > the kernel repo that breaks it. It has nothing possibly to do
> with
> > > > the
> > > > > > > build system.
> > > > > > >
> > > > > > > I would appreciate any hints to get this kernel built and boot
> on the
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
> > > > > > > > I recompiled the 3.12-rc5 kernel again but it still stalls
> during
> > > > > > > > initialization. I attached the boot log. I don't know much
> about
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
> > > > > > > Linux Foundation Training Schedule:
> training.linuxfoundation.org
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
> >
> >
> > ------------------------------
> >
> > Message: 2
> > Date: Tue, 22 Oct 2013 15:37:32 -0400
> > From: Denys Dmytriyenko <denys@ti.com>
> > To: Rudolf Streif <rstreif@linuxfoundation.org>
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] AM335x EVM and core-image-sato
> > Message-ID: <20131022193732.GC9301@edge>
> > Content-Type: text/plain; charset="us-ascii"
> >
> > And just to double-check here as well - you did try all the binaries I
> sent
> > you, including MLO, u-boot, zImage and DTB, right?
> >
> > Denys
> >
> >
> > On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > > Thanks, Denys.
> > >
> > > Interesting point about gcc. It's version 4.8.1 which is the default
> for
> > > poky master. Which is what I used all along.
> > >
> > > Thanks for sending your binaries. They fail too with the exact same
> > > problem. See attached log. I found [1] on gmane which exactly
> describes the
> > > problem I am seeing.
> > >
> > > If that is the case then I was wondering why my earlier builds with
> > > 3.12-rc3 actually worked. And I tried them again and they are now
> failing
> > > too. Of course I don't know anything about the specifics of the gpio
> and
> > > the timers on the chip but it looks like a weird hardware
> initialization
> > > condition. And I don't know if the proposed patch in [1] was ever
> > > incorporated in your kernel tree.
> > >
> > > I don't think it's the hardware (or at least not alone) because the SD
> that
> > > ships with it with the 3.2 kernel works just fine.
> > >
> > > Cheers,
> > > Rudi
> > >
> > >
> > > [1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
> > >
> > >
> > > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> > >
> > > > Rudi,
> > > >
> > > > As we discussed earlier today, let my send you my binaries for the
> kernel
> > > > and
> > > > u-boot to try on your board. I just wanted to ask you about the
> toolchain
> > > > that
> > > > you used to build yours. In our builds we use Linaro gcc-4.7 hardfp
> > > > toolchain
> > > > and I vaguely remember hearing about some problems with the recent
> gcc-4.8
> > > > toolchain from oe-core... I'm wondering if you are having the same
> issue.
> > > >
> > > > --
> > > > Denys
> > > >
> > > >
> > > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > > > Since the 3.12-rc5 kernel does not work I decided to give the 3.8
> kernel
> > > > a
> > > > > try. The issue with this one is that the linux-ti-staging_3.8.bbrecipe
> > > > > explicitly sets KERNEL_IMAGETYPE="uImage". However, the u-boot
> > > > environment
> > > > > has now moved on to using zImage which consequently means u-boot
> will not
> > > > > find the kernel file.
> > > > >
> > > > > I do not know why KERNEL_IMAGETYPE = "uImage" was hacked into the
> > > > > linux-ti-staging_3.8.bb recipe but whoever did it did not think
> about
> > > > > u-boot. Does zImage not work with 3.8? I did not try it but it
> should
> > > > > normally have no effect. Since there is no dependency of the u-boot
> > > > recipes
> > > > > on the kernel image types changes to the kernel image type for
> newer
> > > > > versions of the kernel then automatically means that it must be
> changed
> > > > for
> > > > > the previous versions too.
> > > > >
> > > > > I mocked around with the u-boot environment and booted the 3.8
> uImage
> > > > > kernel. To my surprise the 3.8 kernel from the TI staging
> repository
> > > > fails
> > > > > with the exact same problem and stops booting with a kernel not
> syncing
> > > > > message during the init calls. Apparently a patch must have been
> applied
> > > > to
> > > > > the kernel repo that breaks it. It has nothing possibly to do with
> the
> > > > > build system.
> > > > >
> > > > > I would appreciate any hints to get this kernel built and boot on
> the
> > > > board.
> > > > >
> > > > > Thanks,
> > > > > Rudi
> > > > >
> > > > >
> > > > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > > > <rstreif@linuxfoundation.org>wrote:
> > > > >
> > > > > > Denys,
> > > > > >
> > > > > > I recompiled the 3.12-rc5 kernel again but it still stalls during
> > > > > > initialization. I attached the boot log. I don't know much about
> the
> > > > > > platform details but maybe that's an issue you know about.
> > > > > >
> > > > > > Thanks,
> > > > > > Rudi
> > > > > >
> > > > > >
> > > > > >
> > > > > >>
> > > > > >> [1]
> > > > > >> Build Configuration:
> > > > > >> BB_VERSION        = "1.21.0"
> > > > > >> BUILD_SYS         = "x86_64-linux"
> > > > > >> NATIVELSBSTRING   = "Fedora-18"
> > > > > >> TARGET_SYS        = "arm-poky-linux-gnueabi"
> > > > > >> MACHINE           = "am335x-evm"
> > > > > >> DISTRO            = "poky"
> > > > > >> DISTRO_VERSION    = "1.5+snapshot-20131019"
> > > > > >> TUNE_FEATURES     = "armv7a vfp neon"
> > > > > >> TARGET_FPU        = "vfp-neon"
> > > > > >> meta-yocto        =
> "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > >> meta-ti           =
> "master:c11504664990f007c3903d349e7cc135a904f8e2"
> > > > > >> meta-oe           =
> "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
> > > > > >> meta              =
> "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > >>
> > > > > >>
> > > > > >
> > > > > >
> > > > > >
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
> > > > > _______________________________________________
> > > > > meta-ti mailing list
> > > > > meta-ti@yoctoproject.org
> > > > > https://lists.yoctoproject.org/listinfo/meta-ti
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
> >
> >
> >
> >
> > ------------------------------
> >
> > Message: 3
> > Date: Tue, 22 Oct 2013 19:52:13 +0000
> > From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
> > To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
> > Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),
> >         meta-ti(master) core-image-base
> > Message-ID:
> >
> <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF6D7@USNYGRMBX4.raymondcorp.local>
> >
> > Content-Type: text/plain; charset="us-ascii"
> >
> > Thanks for the links Rudi, I looked for the file referenced in [2]
> "arch/arm/mach-omap2/cclock33xx_data.c" to see if the patch works but...
> >
> > There is no cclock33xx_data.c rather there is in
> tmp/work/am335x_evm-poky-linux-gnueabi/linux-ti-staging/3.11+3.12-rc5-r20a+gitrAUTOINC+eb765a394c/git/arch/arm/mach-omap2/cclock3xxx_data.c.
> >
> > however a search I found
> tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/linux-libc-headers/3.10-r0/linux-3.10/arch/arm/mach-omap2/cclock33xx_data.c
> >
> > So it appears there is mis-match as the patch is in the 3.10 files that
> re in the armv7a-vfp-neon-poky-linux-gnueabi directory?
> >
> > So is this something that is just lost from the 3.12-rc5 kernel and
> shouldn't the linux-linc-headers be the version being built?
> >
> > Unfortunately being inexperienced with the project I am at a loss at how
> to fix this but hope this help point someone to the solution.
> >
> > Regards,
> > Josh
> >
> > ________________________________________
> > From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org]
> on behalf of meta-ti-request@yoctoproject.org [
> meta-ti-request@yoctoproject.org]
> > Sent: Tuesday, October 22, 2013 3:00 PM
> > To: meta-ti@yoctoproject.org
> > Subject: meta-ti Digest, Vol 25, Issue 35
> >
> > Send meta-ti mailing list submissions to
> >         meta-ti@yoctoproject.org
> >
> > To subscribe or unsubscribe via the World Wide Web, visit
> >         https://lists.yoctoproject.org/listinfo/meta-ti
> > or, via email, send a message with subject or body 'help' to
> >         meta-ti-request@yoctoproject.org
> >
> > You can reach the person managing the list at
> >         meta-ti-owner@yoctoproject.org
> >
> > When replying, please edit your Subject line so it is more specific
> > than "Re: Contents of meta-ti digest..."
> >
> >
> > Today's Topics:
> >
> >    1. Re: AM335x-SK kernel panic with Poky(master), meta-ti(master)
> >       core-image-base (Rudolf Streif)
> >
> >
> > ----------------------------------------------------------------------
> >
> > Message: 1
> > Date: Tue, 22 Oct 2013 18:18:29 +0100
> > From: Rudolf Streif <rstreif@linuxfoundation.org>
> > To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
> > Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
> > Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),
> >         meta-ti(master) core-image-base
> > Message-ID:
> >         <
> CA+gsK-pNkDYCcecOftuopRu9XnxK3Xr9ZbSU23yekqQEczCYeg@mail.gmail.com>
> > Content-Type: text/plain; charset="iso-8859-1"
> >
> > Hi Josh,
> >
> > I am seeing the exact same problem with my am335x-evmsk and the latest
> > meta-ti with 3.12-rc5 kernel. I posted it on this mailing list [1].
> >
> > This problem looks like the one posted here [2].
> >
> > The bad news is I don't have a solution for it. The good news is that
> Denys
> > and I are attending the same conference and I keep harassing him about
> it.
> > :)
> >
> > Cheers,
> > Rudi
> >
> >
> > [1]
> >
> https://lists.yoctoproject.org/pipermail/meta-ti/2013-October/003519.html
> > [2] http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
> >
> >
> > On Tue, Oct 22, 2013 at 5:28 PM, Vanderpool Josh <
> > Joshua.Vanderpool@raymondcorp.com> wrote:
> >
> > > I am having a similar issue as Rudi.
> > > Attached is the bootLog.
> > >
> > >
> > > Build Configuration:
> > > BB_VERSION        = "1.21.0"
> > > BUILD_SYS         = "x86_64-linux"
> > > NATIVELSBSTRING   = "Ubuntu-12.04"
> > > TARGET_SYS        = "arm-poky-linux-gnueabi"
> > > MACHINE           = "am335x-evm"
> > > DISTRO            = "poky"
> > > DISTRO_VERSION    = "1.5+snapshot-20131022"
> > > TUNE_FEATURES     = "armv7a vfp neon"
> > > TARGET_FPU        = "vfp-neon"
> > > meta
> > > meta-yocto        = "master:505114c13d29799a25379f7ce720d632616d8776"
> > > meta-ti           = "master:c11504664990f007c3903d349e7cc135a904f8e2"
> > > meta-qt5          = "master:84cd4be2491895b0c3a0af64e4c83d58910d1f6c"
> > >
> > > Josh Vanderpool
> > > Electrical Engineer
> > > Control Systems
> > > The Raymond Corporation
> > > 20 South Canal Street
> > > Greene, New York 13778-0130
> > > Phone: 607-656-2617
> > > Fax: 607-656-4845
> > > joshua.vanderpool@raymondcorp.com
> > > http://www.raymondcorp.com
> > >
> > >
> > > Confidentiality Notice:
> > >
> > > The preceding e-mail message (including any attachments) contains
> > > information that may be confidential, protected by applicable legal
> > > privileges, or constitute non-public information. It is intended to be
> > > conveyed only to the designated recipient(s). If you are not an
> intended
> > > recipient of this message, please notify the sender by replying to this
> > > message and then delete it from your system. Use, dissemination,
> > > distribution or reproduction of this message by unintended recipients
> is
> > > not authorized and may be unlawful.
> > >
> > >
> > >
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > >
> > >
> > -------------- next part --------------
> > An HTML attachment was scrubbed...
> > URL: <
> http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20131022/34dc4b0c/attachment-0001.html
> >
> >
> > ------------------------------
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >
> > End of meta-ti Digest, Vol 25, Issue 35
> > ***************************************
> > Confidentiality Notice:
> >
> > The preceding e-mail message (including any attachments) contains
> information that may be confidential, protected by applicable legal
> privileges, or constitute non-public information. It is intended to be
> conveyed only to the designated recipient(s). If you are not an intended
> recipient of this message, please notify the sender by replying to this
> message and then delete it from your system. Use, dissemination,
> distribution or reproduction of this message by unintended recipients is
> > not authorized and may be unlawful.
> >
> >
> >
> >
> >
> > ------------------------------
> >
> > Message: 4
> > Date: Tue, 22 Oct 2013 16:16:52 -0400
> > From: Denys Dmytriyenko <denys@ti.com>
> > To: Rudolf Streif <rstreif@linuxfoundation.org>,
> >         meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] AM335x EVM and core-image-sato
> > Message-ID: <20131022201652.GB404@denix.org>
> > Content-Type: text/plain; charset=us-ascii
> >
> > Hey, Rudi,
> >
> > Just one more quick check about your board - are you sure yours is an
> EVM? Or
> > is it an SK-EVM i.e. a "Starter Kit"? Basically, what color is the PCB
> of your
> > board - is it green (EVM) or purple (SK)?
> >
> > For example, here's the EVM:
> > https://plus.google.com/u/0/110579591067038943673/posts/SLB35o1JgBu
> >
> > --
> > Denys
> >
> >
> >
> > On Tue, Oct 22, 2013 at 03:36:21PM -0400, Denys Dmytriyenko wrote:
> > > Huh, I'm wondering if 1.2 is still supported... There were 2.0 and 2.1
> > > versions of the silicon and I believe those are the latest ones. Need
> to
> > > double-check that.
> > >
> > > Denys
> > >
> > >
> > > On Tue, Oct 22, 2013 at 08:57:51AM +0100, Rudolf Streif wrote:
> > > > Where do I find the PG version of the board? The barcode sticker on
> the
> > > > board says rev 1.2.
> > > >
> > > >
> > > > On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko <denys@ti.com>
> wrote:
> > > >
> > > > > Now I'm just wondering what PG version of the board you've got, if
> it
> > > > > fails in
> > > > > the same way with our 3.8 kernel and a known good set of 3.12
> images...
> > > > >
> > > > >
> > > > > On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > > > > > Thanks, Denys.
> > > > > >
> > > > > > Interesting point about gcc. It's version 4.8.1 which is the
> default for
> > > > > > poky master. Which is what I used all along.
> > > > > >
> > > > > > Thanks for sending your binaries. They fail too with the exact
> same
> > > > > > problem. See attached log. I found [1] on gmane which exactly
> describes
> > > > > the
> > > > > > problem I am seeing.
> > > > > >
> > > > > > If that is the case then I was wondering why my earlier builds
> with
> > > > > > 3.12-rc3 actually worked. And I tried them again and they are
> now failing
> > > > > > too. Of course I don't know anything about the specifics of the
> gpio and
> > > > > > the timers on the chip but it looks like a weird hardware
> initialization
> > > > > > condition. And I don't know if the proposed patch in [1] was ever
> > > > > > incorporated in your kernel tree.
> > > > > >
> > > > > > I don't think it's the hardware (or at least not alone) because
> the SD
> > > > > that
> > > > > > ships with it with the 3.2 kernel works just fine.
> > > > > >
> > > > > > Cheers,
> > > > > > Rudi
> > > > > >
> > > > > >
> > > > > > [1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
> > > > > >
> > > > > >
> > > > > > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <
> denis@denix.org>
> > > > > wrote:
> > > > > >
> > > > > > > Rudi,
> > > > > > >
> > > > > > > As we discussed earlier today, let my send you my binaries for
> the
> > > > > kernel
> > > > > > > and
> > > > > > > u-boot to try on your board. I just wanted to ask you about the
> > > > > toolchain
> > > > > > > that
> > > > > > > you used to build yours. In our builds we use Linaro gcc-4.7
> hardfp
> > > > > > > toolchain
> > > > > > > and I vaguely remember hearing about some problems with the
> recent
> > > > > gcc-4.8
> > > > > > > toolchain from oe-core... I'm wondering if you are having the
> same
> > > > > issue.
> > > > > > >
> > > > > > > --
> > > > > > > Denys
> > > > > > >
> > > > > > >
> > > > > > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > > > > > > Since the 3.12-rc5 kernel does not work I decided to give
> the 3.8
> > > > > kernel
> > > > > > > a
> > > > > > > > try. The issue with this one is that the
> linux-ti-staging_3.8.bbrecipe
> > > > > > > > explicitly sets KERNEL_IMAGETYPE="uImage". However, the
> u-boot
> > > > > > > environment
> > > > > > > > has now moved on to using zImage which consequently means
> u-boot
> > > > > will not
> > > > > > > > find the kernel file.
> > > > > > > >
> > > > > > > > I do not know why KERNEL_IMAGETYPE = "uImage" was hacked
> into the
> > > > > > > > linux-ti-staging_3.8.bb recipe but whoever did it did not
> think
> > > > > about
> > > > > > > > u-boot. Does zImage not work with 3.8? I did not try it but
> it should
> > > > > > > > normally have no effect. Since there is no dependency of the
> u-boot
> > > > > > > recipes
> > > > > > > > on the kernel image types changes to the kernel image type
> for newer
> > > > > > > > versions of the kernel then automatically means that it must
> be
> > > > > changed
> > > > > > > for
> > > > > > > > the previous versions too.
> > > > > > > >
> > > > > > > > I mocked around with the u-boot environment and booted the
> 3.8 uImage
> > > > > > > > kernel. To my surprise the 3.8 kernel from the TI staging
> repository
> > > > > > > fails
> > > > > > > > with the exact same problem and stops booting with a kernel
> not
> > > > > syncing
> > > > > > > > message during the init calls. Apparently a patch must have
> been
> > > > > applied
> > > > > > > to
> > > > > > > > the kernel repo that breaks it. It has nothing possibly to
> do with
> > > > > the
> > > > > > > > build system.
> > > > > > > >
> > > > > > > > I would appreciate any hints to get this kernel built and
> boot on the
> > > > > > > board.
> > > > > > > >
> > > > > > > > Thanks,
> > > > > > > > Rudi
> > > > > > > >
> > > > > > > >
> > > > > > > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > > > > > > <rstreif@linuxfoundation.org>wrote:
> > > > > > > >
> > > > > > > > > Denys,
> > > > > > > > >
> > > > > > > > > I recompiled the 3.12-rc5 kernel again but it still stalls
> during
> > > > > > > > > initialization. I attached the boot log. I don't know much
> about
> > > > > the
> > > > > > > > > platform details but maybe that's an issue you know about.
> > > > > > > > >
> > > > > > > > > Thanks,
> > > > > > > > > Rudi
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >>
> > > > > > > > >> [1]
> > > > > > > > >> Build Configuration:
> > > > > > > > >> BB_VERSION        = "1.21.0"
> > > > > > > > >> BUILD_SYS         = "x86_64-linux"
> > > > > > > > >> NATIVELSBSTRING   = "Fedora-18"
> > > > > > > > >> TARGET_SYS        = "arm-poky-linux-gnueabi"
> > > > > > > > >> MACHINE           = "am335x-evm"
> > > > > > > > >> DISTRO            = "poky"
> > > > > > > > >> DISTRO_VERSION    = "1.5+snapshot-20131019"
> > > > > > > > >> TUNE_FEATURES     = "armv7a vfp neon"
> > > > > > > > >> TARGET_FPU        = "vfp-neon"
> > > > > > > > >> meta-yocto        =
> > > > > "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > > > > >> meta-ti           =
> > > > > "master:c11504664990f007c3903d349e7cc135a904f8e2"
> > > > > > > > >> meta-oe           =
> > > > > "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
> > > > > > > > >> meta              =
> > > > > "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > > > > > >>
> > > > > > > > >>
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > > --
> > > > > > > > *Rudolf J. Streif*
> > > > > > > > Director of Embedded Solutions
> > > > > > > > The Linux Foundation
> > > > > > > >
> > > > > > > > rudolf.streif@linux.com
> > > > > > > > Phone: +1.619.537.6646
> > > > > > > > Skype: rudolfstreif
> > > > > > > > PGP: RSA 2048/2048 D6E7D28B
> > > > > > > >
> > > > > > > > Linux Foundation Events Schedule:
> events.linuxfoundation.org
> > > > > > > > Linux Foundation Training Schedule:
> training.linuxfoundation.org
> > > > > > >
> > > > > > > > _______________________________________________
> > > > > > > > meta-ti mailing list
> > > > > > > > meta-ti@yoctoproject.org
> > > > > > > > https://lists.yoctoproject.org/listinfo/meta-ti
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
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > >
> >
> >
> > ------------------------------
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >
> > End of meta-ti Digest, Vol 25, Issue 36
> > ***************************************
> > Confidentiality Notice:
> >
> > The preceding e-mail message (including any attachments) contains
> information that may be confidential, protected by applicable legal
> privileges, or constitute non-public information. It is intended to be
> conveyed only to the designated recipient(s). If you are not an intended
> recipient of this message, please notify the sender by replying to this
> message and then delete it from your system. Use, dissemination,
> distribution or reproduction of this message by unintended recipients is
> > not authorized and may be unlawful.
> >
> >
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--001a11c38f105ab05a04e95d079b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Denys,<div><br></div><div>Sorry, yes, the board I have is =
a am335x_evmsk. I forgot to write it out correctly in the subject line. it&=
#39;s a purple board. I have been using the correct device tree file all al=
ong.</div>
<div><br></div><div>The board revision is 1.2B. The CPU is XAM3359ZCZ. On b=
oot the kernel reports:</div><div><br></div><div><div>[ =A0 =A00.000000] CP=
U: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=3D10c53c7d</div><div>[=
 =A0 =A00.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing in=
struction cache</div>
<div>[ =A0 =A00.000000] Machine: am335xevm</div><div>[ =A0 =A00.000000] Mem=
ory policy: ECC disabled, Data cache writeback</div><div>[ =A0 =A00.000000]=
 AM335X ES1.0 (sgx neon )</div><div><br></div></div><div>Maybe that helps y=
ou to determine what CPU revision that is.</div>
<div><br></div><div>I built a 3.2.0 kernel with core-image-sato and it work=
s just fine (after enabling tmpdevfs support in the kernel).</div><div><br>=
</div><div>It may will be a combination of that hardware with the newer ker=
nel versions. I just bought the board a couple of weeks ago from DigiKey. I=
f it is an older CPU revision then they are apparently selling older stock.=
</div>
<div><br></div><div>If the CPU revision not being supported by the newer ke=
rnel is indeed the root cause of the issue then this may become frustrating=
 for more users. There is no way that a user can reasonably find out that t=
he kernel does not boot because of the CPU revision. I don&#39;t know what =
has changed between the CPU revisions but I would think that the kernel sho=
uld support all of them.</div>
<div><br></div><div>Cheers,</div><div>Rudi</div><div><br></div><div><br></d=
iv><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, Oc=
t 22, 2013 at 11:28 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"=
mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<b=
r>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Josh,<br>
<br>
Yes, in your case it was clear from the beginning you had a problem with SK=
<br>
and it is kind of known... In Rudi&#39;s case he was saying he had an actua=
l EVM,<br>
which is known to boot fine at the moment, hence I was confirming with him.=
<br>
<br>
For your case, please try the DTB file attached. Thanks.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On Tue, Oct 22, 2013 at 08:36:13PM +0000, Vanderpool Josh wrote:<br>
&gt; It is a SK and the revision of silicon is 1.0 as it is a XAM3359ZCZ no=
 A or<br>
&gt; B after the AM335x.<br>
&gt;<br>
&gt; ________________________________________<br>
&gt; From: <a href=3D"mailto:meta-ti-bounces@yoctoproject.org">meta-ti-boun=
ces@yoctoproject.org</a> [<a href=3D"mailto:meta-ti-bounces@yoctoproject.or=
g">meta-ti-bounces@yoctoproject.org</a>] on behalf of <a href=3D"mailto:met=
a-ti-request@yoctoproject.org">meta-ti-request@yoctoproject.org</a> [<a hre=
f=3D"mailto:meta-ti-request@yoctoproject.org">meta-ti-request@yoctoproject.=
org</a>]<br>

&gt; Sent: Tuesday, October 22, 2013 4:17 PM<br>
&gt; To: <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a><br>
&gt; Subject: meta-ti Digest, Vol 25, Issue 36<br>
&gt;<br>
&gt; Send meta-ti mailing list submissions to<br>
&gt; =A0 =A0 =A0 =A0 <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yo=
ctoproject.org</a><br>
&gt;<br>
&gt; To subscribe or unsubscribe via the World Wide Web, visit<br>
&gt; =A0 =A0 =A0 =A0 <a href=3D"https://lists.yoctoproject.org/listinfo/met=
a-ti" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a>=
<br>
&gt; or, via email, send a message with subject or body &#39;help&#39; to<b=
r>
&gt; =A0 =A0 =A0 =A0 <a href=3D"mailto:meta-ti-request@yoctoproject.org">me=
ta-ti-request@yoctoproject.org</a><br>
&gt;<br>
&gt; You can reach the person managing the list at<br>
&gt; =A0 =A0 =A0 =A0 <a href=3D"mailto:meta-ti-owner@yoctoproject.org">meta=
-ti-owner@yoctoproject.org</a><br>
&gt;<br>
&gt; When replying, please edit your Subject line so it is more specific<br=
>
&gt; than &quot;Re: Contents of meta-ti digest...&quot;<br>
&gt;<br>
&gt;<br>
&gt; Today&#39;s Topics:<br>
&gt;<br>
&gt; =A0 =A01. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)<br>
&gt; =A0 =A02. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)<br>
&gt; =A0 =A03. Re: AM335x-SK kernel panic with Poky(master), meta-ti(master=
)<br>
&gt; =A0 =A0 =A0 core-image-base (Vanderpool Josh)<br>
&gt; =A0 =A04. Re: AM335x EVM and core-image-sato (Denys Dmytriyenko)<br>
&gt;<br>
&gt;<br>
&gt; ----------------------------------------------------------------------=
<br>
&gt;<br>
&gt; Message: 1<br>
&gt; Date: Tue, 22 Oct 2013 15:36:21 -0400<br>
&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.c=
om</a>&gt;<br>
&gt; To: Rudolf Streif &lt;<a href=3D"mailto:rstreif@linuxfoundation.org">r=
streif@linuxfoundation.org</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a><br>
&gt; Subject: Re: [meta-ti] AM335x EVM and core-image-sato<br>
&gt; Message-ID: &lt;20131022193620.GB9301@edge&gt;<br>
&gt; Content-Type: text/plain; charset=3D&quot;us-ascii&quot;<br>
&gt;<br>
&gt; Huh, I&#39;m wondering if 1.2 is still supported... There were 2.0 and=
 2.1<br>
&gt; versions of the silicon and I believe those are the latest ones. Need =
to<br>
&gt; double-check that.<br>
&gt;<br>
&gt; Denys<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Oct 22, 2013 at 08:57:51AM +0100, Rudolf Streif wrote:<br>
&gt; &gt; Where do I find the PG version of the board? The barcode sticker =
on the<br>
&gt; &gt; board says rev 1.2.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko &lt;<a href=
=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; Now I&#39;m just wondering what PG version of the board you&=
#39;ve got, if it<br>
&gt; &gt; &gt; fails in<br>
&gt; &gt; &gt; the same way with our 3.8 kernel and a known good set of 3.1=
2 images...<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrot=
e:<br>
&gt; &gt; &gt; &gt; Thanks, Denys.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Interesting point about gcc. It&#39;s version 4.8.1 whi=
ch is the default for<br>
&gt; &gt; &gt; &gt; poky master. Which is what I used all along.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks for sending your binaries. They fail too with th=
e exact same<br>
&gt; &gt; &gt; &gt; problem. See attached log. I found [1] on gmane which e=
xactly describes<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; problem I am seeing.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; If that is the case then I was wondering why my earlier=
 builds with<br>
&gt; &gt; &gt; &gt; 3.12-rc3 actually worked. And I tried them again and th=
ey are now failing<br>
&gt; &gt; &gt; &gt; too. Of course I don&#39;t know anything about the spec=
ifics of the gpio and<br>
&gt; &gt; &gt; &gt; the timers on the chip but it looks like a weird hardwa=
re initialization<br>
&gt; &gt; &gt; &gt; condition. And I don&#39;t know if the proposed patch i=
n [1] was ever<br>
&gt; &gt; &gt; &gt; incorporated in your kernel tree.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I don&#39;t think it&#39;s the hardware (or at least no=
t alone) because the SD<br>
&gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; ships with it with the 3.2 kernel works just fine.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; [1] =A0<a href=3D"http://permalink.gmane.org/gmane.linu=
x.ports.arm.omap/96044" target=3D"_blank">http://permalink.gmane.org/gmane.=
linux.ports.arm.omap/96044</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko &lt=
;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Rudi,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; As we discussed earlier today, let my send you my =
binaries for the<br>
&gt; &gt; &gt; kernel<br>
&gt; &gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; u-boot to try on your board. I just wanted to ask =
you about the<br>
&gt; &gt; &gt; toolchain<br>
&gt; &gt; &gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; &gt; you used to build yours. In our builds we use Lina=
ro gcc-4.7 hardfp<br>
&gt; &gt; &gt; &gt; &gt; toolchain<br>
&gt; &gt; &gt; &gt; &gt; and I vaguely remember hearing about some problems=
 with the recent<br>
&gt; &gt; &gt; gcc-4.8<br>
&gt; &gt; &gt; &gt; &gt; toolchain from oe-core... I&#39;m wondering if you=
 are having the same<br>
&gt; &gt; &gt; issue.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; Denys<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf S=
treif wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; Since the 3.12-rc5 kernel does not work I dec=
ided to give the 3.8<br>
&gt; &gt; &gt; kernel<br>
&gt; &gt; &gt; &gt; &gt; a<br>
&gt; &gt; &gt; &gt; &gt; &gt; try. The issue with this one is that the linu=
x-ti-staging_3.8.bbrecipe<br>
&gt; &gt; &gt; &gt; &gt; &gt; explicitly sets KERNEL_IMAGETYPE=3D&quot;uIma=
ge&quot;. However, the u-boot<br>
&gt; &gt; &gt; &gt; &gt; environment<br>
&gt; &gt; &gt; &gt; &gt; &gt; has now moved on to using zImage which conseq=
uently means u-boot<br>
&gt; &gt; &gt; will not<br>
&gt; &gt; &gt; &gt; &gt; &gt; find the kernel file.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I do not know why KERNEL_IMAGETYPE =3D &quot;=
uImage&quot; was hacked into the<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"http://linux-ti-staging_3.8.bb" ta=
rget=3D"_blank">linux-ti-staging_3.8.bb</a> recipe but whoever did it did n=
ot think<br>
&gt; &gt; &gt; about<br>
&gt; &gt; &gt; &gt; &gt; &gt; u-boot. Does zImage not work with 3.8? I did =
not try it but it should<br>
&gt; &gt; &gt; &gt; &gt; &gt; normally have no effect. Since there is no de=
pendency of the u-boot<br>
&gt; &gt; &gt; &gt; &gt; recipes<br>
&gt; &gt; &gt; &gt; &gt; &gt; on the kernel image types changes to the kern=
el image type for newer<br>
&gt; &gt; &gt; &gt; &gt; &gt; versions of the kernel then automatically mea=
ns that it must be<br>
&gt; &gt; &gt; changed<br>
&gt; &gt; &gt; &gt; &gt; for<br>
&gt; &gt; &gt; &gt; &gt; &gt; the previous versions too.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I mocked around with the u-boot environment a=
nd booted the 3.8 uImage<br>
&gt; &gt; &gt; &gt; &gt; &gt; kernel. To my surprise the 3.8 kernel from th=
e TI staging repository<br>
&gt; &gt; &gt; &gt; &gt; fails<br>
&gt; &gt; &gt; &gt; &gt; &gt; with the exact same problem and stops booting=
 with a kernel not<br>
&gt; &gt; &gt; syncing<br>
&gt; &gt; &gt; &gt; &gt; &gt; message during the init calls. Apparently a p=
atch must have been<br>
&gt; &gt; &gt; applied<br>
&gt; &gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; the kernel repo that breaks it. It has nothin=
g possibly to do with<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; build system.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I would appreciate any hints to get this kern=
el built and boot on the<br>
&gt; &gt; &gt; &gt; &gt; board.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Strei=
f<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:rstreif@linuxfoundation=
.org">rstreif@linuxfoundation.org</a>&gt;wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Denys,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; I recompiled the 3.12-rc5 kernel again b=
ut it still stalls during<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; initialization. I attached the boot log.=
 I don&#39;t know much about<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; platform details but maybe that&#39;s an=
 issue you know about.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; [1]<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Build Configuration:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; BB_VERSION =A0 =A0 =A0 =A0=3D &quot;=
1.21.0&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; BUILD_SYS =A0 =A0 =A0 =A0 =3D &quot;=
x86_64-linux&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; NATIVELSBSTRING =A0 =3D &quot;Fedora=
-18&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; TARGET_SYS =A0 =A0 =A0 =A0=3D &quot;=
arm-poky-linux-gnueabi&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quo=
t;am335x-evm&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D &q=
uot;poky&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; DISTRO_VERSION =A0 =A0=3D &quot;1.5+=
snapshot-20131019&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; TUNE_FEATURES =A0 =A0 =3D &quot;armv=
7a vfp neon&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; TARGET_FPU =A0 =A0 =A0 =A0=3D &quot;=
vfp-neon&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta-yocto =A0 =A0 =A0 =A0=3D<br>
&gt; &gt; &gt; &quot;master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&quot;<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta-ti =A0 =A0 =A0 =A0 =A0 =3D<br>
&gt; &gt; &gt; &quot;master:c11504664990f007c3903d349e7cc135a904f8e2&quot;<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta-oe =A0 =A0 =A0 =A0 =A0 =3D<br>
&gt; &gt; &gt; &quot;master:f8903f53db717294d63a8d79b5ef7ca34b3c189e&quot;<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D<=
br>
&gt; &gt; &gt; &quot;master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&quot;<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; &gt; &gt; &gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; &gt; &gt; &gt; &gt; The Linux Foundation<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:rudolf.streif@linux.com">ru=
dolf.streif@linux.com</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; Phone: <a href=3D"tel:%2B1.619.537.6646" valu=
e=3D"+16195376646">+1.619.537.6646</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; &gt; &gt; &gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Linux Foundation Events Schedule: =A0<a href=
=3D"http://events.linuxfoundation.org" target=3D"_blank">events.linuxfounda=
tion.org</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; Linux Foundation Training Schedule: <a href=
=3D"http://training.linuxfoundation.org" target=3D"_blank">training.linuxfo=
undation.org</a><br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; _____________________________________________=
__<br>
&gt; &gt; &gt; &gt; &gt; &gt; meta-ti mailing list<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org">m=
eta-ti@yoctoproject.org</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.org/lis=
tinfo/meta-ti" target=3D"_blank">https://lists.yoctoproject.org/listinfo/me=
ta-ti</a><br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; &gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; &gt; &gt; The Linux Foundation<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:rudolf.streif@linux.com">rudolf.strei=
f@linux.com</a><br>
&gt; &gt; &gt; &gt; Phone: <a href=3D"tel:%2B1.619.537.6646" value=3D"+1619=
5376646">+1.619.537.6646</a><br>
&gt; &gt; &gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; &gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Linux Foundation Events Schedule: =A0<a href=3D"http://=
events.linuxfoundation.org" target=3D"_blank">events.linuxfoundation.org</a=
><br>
&gt; &gt; &gt; &gt; Linux Foundation Training Schedule: <a href=3D"http://t=
raining.linuxfoundation.org" target=3D"_blank">training.linuxfoundation.org=
</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; --<br>
&gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; The Linux Foundation<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"mailto:rudolf.streif@linux.com">rudolf.streif@linux.co=
m</a><br>
&gt; &gt; Phone: <a href=3D"tel:%2B1.619.537.6646" value=3D"+16195376646">+=
1.619.537.6646</a><br>
&gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt;<br>
&gt; &gt; Linux Foundation Events Schedule: =A0<a href=3D"http://events.lin=
uxfoundation.org" target=3D"_blank">events.linuxfoundation.org</a><br>
&gt; &gt; Linux Foundation Training Schedule: <a href=3D"http://training.li=
nuxfoundation.org" target=3D"_blank">training.linuxfoundation.org</a><br>
&gt;<br>
&gt;<br>
&gt; ------------------------------<br>
&gt;<br>
&gt; Message: 2<br>
&gt; Date: Tue, 22 Oct 2013 15:37:32 -0400<br>
&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.c=
om</a>&gt;<br>
&gt; To: Rudolf Streif &lt;<a href=3D"mailto:rstreif@linuxfoundation.org">r=
streif@linuxfoundation.org</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a><br>
&gt; Subject: Re: [meta-ti] AM335x EVM and core-image-sato<br>
&gt; Message-ID: &lt;20131022193732.GC9301@edge&gt;<br>
&gt; Content-Type: text/plain; charset=3D&quot;us-ascii&quot;<br>
&gt;<br>
&gt; And just to double-check here as well - you did try all the binaries I=
 sent<br>
&gt; you, including MLO, u-boot, zImage and DTB, right?<br>
&gt;<br>
&gt; Denys<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:<br>
&gt; &gt; Thanks, Denys.<br>
&gt; &gt;<br>
&gt; &gt; Interesting point about gcc. It&#39;s version 4.8.1 which is the =
default for<br>
&gt; &gt; poky master. Which is what I used all along.<br>
&gt; &gt;<br>
&gt; &gt; Thanks for sending your binaries. They fail too with the exact sa=
me<br>
&gt; &gt; problem. See attached log. I found [1] on gmane which exactly des=
cribes the<br>
&gt; &gt; problem I am seeing.<br>
&gt; &gt;<br>
&gt; &gt; If that is the case then I was wondering why my earlier builds wi=
th<br>
&gt; &gt; 3.12-rc3 actually worked. And I tried them again and they are now=
 failing<br>
&gt; &gt; too. Of course I don&#39;t know anything about the specifics of t=
he gpio and<br>
&gt; &gt; the timers on the chip but it looks like a weird hardware initial=
ization<br>
&gt; &gt; condition. And I don&#39;t know if the proposed patch in [1] was =
ever<br>
&gt; &gt; incorporated in your kernel tree.<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t think it&#39;s the hardware (or at least not alone) b=
ecause the SD that<br>
&gt; &gt; ships with it with the 3.2 kernel works just fine.<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt; Rudi<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; [1] =A0<a href=3D"http://permalink.gmane.org/gmane.linux.ports.ar=
m.omap/96044" target=3D"_blank">http://permalink.gmane.org/gmane.linux.port=
s.arm.omap/96044</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko &lt;<a href=
=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; Rudi,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; As we discussed earlier today, let my send you my binaries f=
or the kernel<br>
&gt; &gt; &gt; and<br>
&gt; &gt; &gt; u-boot to try on your board. I just wanted to ask you about =
the toolchain<br>
&gt; &gt; &gt; that<br>
&gt; &gt; &gt; you used to build yours. In our builds we use Linaro gcc-4.7=
 hardfp<br>
&gt; &gt; &gt; toolchain<br>
&gt; &gt; &gt; and I vaguely remember hearing about some problems with the =
recent gcc-4.8<br>
&gt; &gt; &gt; toolchain from oe-core... I&#39;m wondering if you are havin=
g the same issue.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; Denys<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrot=
e:<br>
&gt; &gt; &gt; &gt; Since the 3.12-rc5 kernel does not work I decided to gi=
ve the 3.8 kernel<br>
&gt; &gt; &gt; a<br>
&gt; &gt; &gt; &gt; try. The issue with this one is that the <a href=3D"htt=
p://linux-ti-staging_3.8.bb" target=3D"_blank">linux-ti-staging_3.8.bb</a> =
recipe<br>
&gt; &gt; &gt; &gt; explicitly sets KERNEL_IMAGETYPE=3D&quot;uImage&quot;. =
However, the u-boot<br>
&gt; &gt; &gt; environment<br>
&gt; &gt; &gt; &gt; has now moved on to using zImage which consequently mea=
ns u-boot will not<br>
&gt; &gt; &gt; &gt; find the kernel file.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I do not know why KERNEL_IMAGETYPE =3D &quot;uImage&quo=
t; was hacked into the<br>
&gt; &gt; &gt; &gt; <a href=3D"http://linux-ti-staging_3.8.bb" target=3D"_b=
lank">linux-ti-staging_3.8.bb</a> recipe but whoever did it did not think a=
bout<br>
&gt; &gt; &gt; &gt; u-boot. Does zImage not work with 3.8? I did not try it=
 but it should<br>
&gt; &gt; &gt; &gt; normally have no effect. Since there is no dependency o=
f the u-boot<br>
&gt; &gt; &gt; recipes<br>
&gt; &gt; &gt; &gt; on the kernel image types changes to the kernel image t=
ype for newer<br>
&gt; &gt; &gt; &gt; versions of the kernel then automatically means that it=
 must be changed<br>
&gt; &gt; &gt; for<br>
&gt; &gt; &gt; &gt; the previous versions too.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I mocked around with the u-boot environment and booted =
the 3.8 uImage<br>
&gt; &gt; &gt; &gt; kernel. To my surprise the 3.8 kernel from the TI stagi=
ng repository<br>
&gt; &gt; &gt; fails<br>
&gt; &gt; &gt; &gt; with the exact same problem and stops booting with a ke=
rnel not syncing<br>
&gt; &gt; &gt; &gt; message during the init calls. Apparently a patch must =
have been applied<br>
&gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; the kernel repo that breaks it. It has nothing possibly=
 to do with the<br>
&gt; &gt; &gt; &gt; build system.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I would appreciate any hints to get this kernel built a=
nd boot on the<br>
&gt; &gt; &gt; board.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:rstreif@linuxfoundation.org">rstr=
eif@linuxfoundation.org</a>&gt;wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Denys,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I recompiled the 3.12-rc5 kernel again but it stil=
l stalls during<br>
&gt; &gt; &gt; &gt; &gt; initialization. I attached the boot log. I don&#39=
;t know much about the<br>
&gt; &gt; &gt; &gt; &gt; platform details but maybe that&#39;s an issue you=
 know about.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; [1]<br>
&gt; &gt; &gt; &gt; &gt;&gt; Build Configuration:<br>
&gt; &gt; &gt; &gt; &gt;&gt; BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.21.0&quo=
t;<br>
&gt; &gt; &gt; &gt; &gt;&gt; BUILD_SYS =A0 =A0 =A0 =A0 =3D &quot;x86_64-lin=
ux&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; NATIVELSBSTRING =A0 =3D &quot;Fedora-18&quot;<=
br>
&gt; &gt; &gt; &gt; &gt;&gt; TARGET_SYS =A0 =A0 =A0 =A0=3D &quot;arm-poky-l=
inux-gnueabi&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;am335x-e=
vm&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;poky&q=
uot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; DISTRO_VERSION =A0 =A0=3D &quot;1.5+snapshot-2=
0131019&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; TUNE_FEATURES =A0 =A0 =3D &quot;armv7a vfp neo=
n&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; TARGET_FPU =A0 =A0 =A0 =A0=3D &quot;vfp-neon&q=
uot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; meta-yocto =A0 =A0 =A0 =A0=3D &quot;master:9a1=
dce10bdc9254bb38e0e54199f23ae55e209a4&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; meta-ti =A0 =A0 =A0 =A0 =A0 =3D &quot;master:c=
11504664990f007c3903d349e7cc135a904f8e2&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; meta-oe =A0 =A0 =A0 =A0 =A0 =3D &quot;master:f=
8903f53db717294d63a8d79b5ef7ca34b3c189e&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; meta =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;mast=
er:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; &gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; &gt; &gt; The Linux Foundation<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:rudolf.streif@linux.com">rudolf.strei=
f@linux.com</a><br>
&gt; &gt; &gt; &gt; Phone: <a href=3D"tel:%2B1.619.537.6646" value=3D"+1619=
5376646">+1.619.537.6646</a><br>
&gt; &gt; &gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; &gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Linux Foundation Events Schedule: =A0<a href=3D"http://=
events.linuxfoundation.org" target=3D"_blank">events.linuxfoundation.org</a=
><br>
&gt; &gt; &gt; &gt; Linux Foundation Training Schedule: <a href=3D"http://t=
raining.linuxfoundation.org" target=3D"_blank">training.linuxfoundation.org=
</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; &gt; meta-ti mailing list<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoc=
toproject.org</a><br>
&gt; &gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta=
-ti" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; --<br>
&gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; The Linux Foundation<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"mailto:rudolf.streif@linux.com">rudolf.streif@linux.co=
m</a><br>
&gt; &gt; Phone: <a href=3D"tel:%2B1.619.537.6646" value=3D"+16195376646">+=
1.619.537.6646</a><br>
&gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt;<br>
&gt; &gt; Linux Foundation Events Schedule: =A0<a href=3D"http://events.lin=
uxfoundation.org" target=3D"_blank">events.linuxfoundation.org</a><br>
&gt; &gt; Linux Foundation Training Schedule: <a href=3D"http://training.li=
nuxfoundation.org" target=3D"_blank">training.linuxfoundation.org</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; ------------------------------<br>
&gt;<br>
&gt; Message: 3<br>
&gt; Date: Tue, 22 Oct 2013 19:52:13 +0000<br>
&gt; From: Vanderpool Josh &lt;<a href=3D"mailto:Joshua.Vanderpool@raymondc=
orp.com">Joshua.Vanderpool@raymondcorp.com</a>&gt;<br>
&gt; To: &quot;<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctopro=
ject.org</a>&quot; &lt;<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@=
yoctoproject.org</a>&gt;<br>
&gt; Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),<br>
&gt; =A0 =A0 =A0 =A0 meta-ti(master) core-image-base<br>
&gt; Message-ID:<br>
&gt; =A0 =A0 =A0 =A0 &lt;7D1F292BE8E4CC4F93079C1A7A58D5622B9FF6D7@USNYGRMBX=
4.raymondcorp.local&gt;<br>
&gt;<br>
&gt; Content-Type: text/plain; charset=3D&quot;us-ascii&quot;<br>
&gt;<br>
&gt; Thanks for the links Rudi, I looked for the file referenced in [2] &qu=
ot;arch/arm/mach-omap2/cclock33xx_data.c&quot; to see if the patch works bu=
t...<br>
&gt;<br>
&gt; There is no cclock33xx_data.c rather there is in tmp/work/am335x_evm-p=
oky-linux-gnueabi/linux-ti-staging/3.11+3.12-rc5-r20a+gitrAUTOINC+eb765a394=
c/git/arch/arm/mach-omap2/cclock3xxx_data.c.<br>
&gt;<br>
&gt; however a search I found tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/l=
inux-libc-headers/3.10-r0/linux-3.10/arch/arm/mach-omap2/cclock33xx_data.c<=
br>
&gt;<br>
&gt; So it appears there is mis-match as the patch is in the 3.10 files tha=
t re in the armv7a-vfp-neon-poky-linux-gnueabi directory?<br>
&gt;<br>
&gt; So is this something that is just lost from the 3.12-rc5 kernel and sh=
ouldn&#39;t the linux-linc-headers be the version being built?<br>
&gt;<br>
&gt; Unfortunately being inexperienced with the project I am at a loss at h=
ow to fix this but hope this help point someone to the solution.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Josh<br>
&gt;<br>
&gt; ________________________________________<br>
&gt; From: <a href=3D"mailto:meta-ti-bounces@yoctoproject.org">meta-ti-boun=
ces@yoctoproject.org</a> [<a href=3D"mailto:meta-ti-bounces@yoctoproject.or=
g">meta-ti-bounces@yoctoproject.org</a>] on behalf of <a href=3D"mailto:met=
a-ti-request@yoctoproject.org">meta-ti-request@yoctoproject.org</a> [<a hre=
f=3D"mailto:meta-ti-request@yoctoproject.org">meta-ti-request@yoctoproject.=
org</a>]<br>

&gt; Sent: Tuesday, October 22, 2013 3:00 PM<br>
&gt; To: <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a><br>
&gt; Subject: meta-ti Digest, Vol 25, Issue 35<br>
&gt;<br>
&gt; Send meta-ti mailing list submissions to<br>
&gt; =A0 =A0 =A0 =A0 <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yo=
ctoproject.org</a><br>
&gt;<br>
&gt; To subscribe or unsubscribe via the World Wide Web, visit<br>
&gt; =A0 =A0 =A0 =A0 <a href=3D"https://lists.yoctoproject.org/listinfo/met=
a-ti" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a>=
<br>
&gt; or, via email, send a message with subject or body &#39;help&#39; to<b=
r>
&gt; =A0 =A0 =A0 =A0 <a href=3D"mailto:meta-ti-request@yoctoproject.org">me=
ta-ti-request@yoctoproject.org</a><br>
&gt;<br>
&gt; You can reach the person managing the list at<br>
&gt; =A0 =A0 =A0 =A0 <a href=3D"mailto:meta-ti-owner@yoctoproject.org">meta=
-ti-owner@yoctoproject.org</a><br>
&gt;<br>
&gt; When replying, please edit your Subject line so it is more specific<br=
>
&gt; than &quot;Re: Contents of meta-ti digest...&quot;<br>
&gt;<br>
&gt;<br>
&gt; Today&#39;s Topics:<br>
&gt;<br>
&gt; =A0 =A01. Re: AM335x-SK kernel panic with Poky(master), meta-ti(master=
)<br>
&gt; =A0 =A0 =A0 core-image-base (Rudolf Streif)<br>
&gt;<br>
&gt;<br>
&gt; ----------------------------------------------------------------------=
<br>
&gt;<br>
&gt; Message: 1<br>
&gt; Date: Tue, 22 Oct 2013 18:18:29 +0100<br>
&gt; From: Rudolf Streif &lt;<a href=3D"mailto:rstreif@linuxfoundation.org"=
>rstreif@linuxfoundation.org</a>&gt;<br>
&gt; To: Vanderpool Josh &lt;<a href=3D"mailto:Joshua.Vanderpool@raymondcor=
p.com">Joshua.Vanderpool@raymondcorp.com</a>&gt;<br>
&gt; Cc: &quot;<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctopro=
ject.org</a>&quot; &lt;<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@=
yoctoproject.org</a>&gt;<br>
&gt; Subject: Re: [meta-ti] AM335x-SK kernel panic with Poky(master),<br>
&gt; =A0 =A0 =A0 =A0 meta-ti(master) core-image-base<br>
&gt; Message-ID:<br>
&gt; =A0 =A0 =A0 =A0 &lt;<a href=3D"mailto:CA%2BgsK-pNkDYCcecOftuopRu9XnxK3=
Xr9ZbSU23yekqQEczCYeg@mail.gmail.com">CA+gsK-pNkDYCcecOftuopRu9XnxK3Xr9ZbSU=
23yekqQEczCYeg@mail.gmail.com</a>&gt;<br>
&gt; Content-Type: text/plain; charset=3D&quot;iso-8859-1&quot;<br>
&gt;<br>
&gt; Hi Josh,<br>
&gt;<br>
&gt; I am seeing the exact same problem with my am335x-evmsk and the latest=
<br>
&gt; meta-ti with 3.12-rc5 kernel. I posted it on this mailing list [1].<br=
>
&gt;<br>
&gt; This problem looks like the one posted here [2].<br>
&gt;<br>
&gt; The bad news is I don&#39;t have a solution for it. The good news is t=
hat Denys<br>
&gt; and I are attending the same conference and I keep harassing him about=
 it.<br>
&gt; :)<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Rudi<br>
&gt;<br>
&gt;<br>
&gt; [1]<br>
&gt; <a href=3D"https://lists.yoctoproject.org/pipermail/meta-ti/2013-Octob=
er/003519.html" target=3D"_blank">https://lists.yoctoproject.org/pipermail/=
meta-ti/2013-October/003519.html</a><br>
&gt; [2] <a href=3D"http://permalink.gmane.org/gmane.linux.ports.arm.omap/9=
6044" target=3D"_blank">http://permalink.gmane.org/gmane.linux.ports.arm.om=
ap/96044</a><br>
&gt;<br>
&gt;<br>
&gt; On Tue, Oct 22, 2013 at 5:28 PM, Vanderpool Josh &lt;<br>
&gt; <a href=3D"mailto:Joshua.Vanderpool@raymondcorp.com">Joshua.Vanderpool=
@raymondcorp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; I am having a similar issue as Rudi.<br>
&gt; &gt; Attached is the bootLog.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Build Configuration:<br>
&gt; &gt; BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.21.0&quot;<br>
&gt; &gt; BUILD_SYS =A0 =A0 =A0 =A0 =3D &quot;x86_64-linux&quot;<br>
&gt; &gt; NATIVELSBSTRING =A0 =3D &quot;Ubuntu-12.04&quot;<br>
&gt; &gt; TARGET_SYS =A0 =A0 =A0 =A0=3D &quot;arm-poky-linux-gnueabi&quot;<=
br>
&gt; &gt; MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;am335x-evm&quot;<br>
&gt; &gt; DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;poky&quot;<br>
&gt; &gt; DISTRO_VERSION =A0 =A0=3D &quot;1.5+snapshot-20131022&quot;<br>
&gt; &gt; TUNE_FEATURES =A0 =A0 =3D &quot;armv7a vfp neon&quot;<br>
&gt; &gt; TARGET_FPU =A0 =A0 =A0 =A0=3D &quot;vfp-neon&quot;<br>
&gt; &gt; meta<br>
&gt; &gt; meta-yocto =A0 =A0 =A0 =A0=3D &quot;master:505114c13d29799a25379f=
7ce720d632616d8776&quot;<br>
&gt; &gt; meta-ti =A0 =A0 =A0 =A0 =A0 =3D &quot;master:c11504664990f007c390=
3d349e7cc135a904f8e2&quot;<br>
&gt; &gt; meta-qt5 =A0 =A0 =A0 =A0 =A0=3D &quot;master:84cd4be2491895b0c3a0=
af64e4c83d58910d1f6c&quot;<br>
&gt; &gt;<br>
&gt; &gt; Josh Vanderpool<br>
&gt; &gt; Electrical Engineer<br>
&gt; &gt; Control Systems<br>
&gt; &gt; The Raymond Corporation<br>
&gt; &gt; 20 South Canal Street<br>
&gt; &gt; Greene, New York 13778-0130<br>
&gt; &gt; Phone: 607-656-2617<br>
&gt; &gt; Fax: 607-656-4845<br>
&gt; &gt; <a href=3D"mailto:joshua.vanderpool@raymondcorp.com">joshua.vande=
rpool@raymondcorp.com</a><br>
&gt; &gt; <a href=3D"http://www.raymondcorp.com" target=3D"_blank">http://w=
ww.raymondcorp.com</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Confidentiality Notice:<br>
&gt; &gt;<br>
&gt; &gt; The preceding e-mail message (including any attachments) contains=
<br>
&gt; &gt; information that may be confidential, protected by applicable leg=
al<br>
&gt; &gt; privileges, or constitute non-public information. It is intended =
to be<br>
&gt; &gt; conveyed only to the designated recipient(s). If you are not an i=
ntended<br>
&gt; &gt; recipient of this message, please notify the sender by replying t=
o this<br>
&gt; &gt; message and then delete it from your system. Use, dissemination,<=
br>
&gt; &gt; distribution or reproduction of this message by unintended recipi=
ents is<br>
&gt; &gt; not authorized and may be unlawful.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; meta-ti mailing list<br>
&gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.=
org</a><br>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" targe=
t=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; -------------- next part --------------<br>
&gt; An HTML attachment was scrubbed...<br>
&gt; URL: &lt;<a href=3D"http://lists.yoctoproject.org/pipermail/meta-ti/at=
tachments/20131022/34dc4b0c/attachment-0001.html" target=3D"_blank">http://=
lists.yoctoproject.org/pipermail/meta-ti/attachments/20131022/34dc4b0c/atta=
chment-0001.html</a>&gt;<br>

&gt;<br>
&gt; ------------------------------<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt;<br>
&gt;<br>
&gt; End of meta-ti Digest, Vol 25, Issue 35<br>
&gt; ***************************************<br>
&gt; Confidentiality Notice:<br>
&gt;<br>
&gt; The preceding e-mail message (including any attachments) contains info=
rmation that may be confidential, protected by applicable legal privileges,=
 or constitute non-public information. It is intended to be conveyed only t=
o the designated recipient(s). If you are not an intended recipient of this=
 message, please notify the sender by replying to this message and then del=
ete it from your system. Use, dissemination, distribution or reproduction o=
f this message by unintended recipients is<br>

&gt; not authorized and may be unlawful.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; ------------------------------<br>
&gt;<br>
&gt; Message: 4<br>
&gt; Date: Tue, 22 Oct 2013 16:16:52 -0400<br>
&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.c=
om</a>&gt;<br>
&gt; To: Rudolf Streif &lt;<a href=3D"mailto:rstreif@linuxfoundation.org">r=
streif@linuxfoundation.org</a>&gt;,<br>
&gt; =A0 =A0 =A0 =A0 <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yo=
ctoproject.org</a><br>
&gt; Subject: Re: [meta-ti] AM335x EVM and core-image-sato<br>
&gt; Message-ID: &lt;<a href=3D"mailto:20131022201652.GB404@denix.org">2013=
1022201652.GB404@denix.org</a>&gt;<br>
&gt; Content-Type: text/plain; charset=3Dus-ascii<br>
&gt;<br>
&gt; Hey, Rudi,<br>
&gt;<br>
&gt; Just one more quick check about your board - are you sure yours is an =
EVM? Or<br>
&gt; is it an SK-EVM i.e. a &quot;Starter Kit&quot;? Basically, what color =
is the PCB of your<br>
&gt; board - is it green (EVM) or purple (SK)?<br>
&gt;<br>
&gt; For example, here&#39;s the EVM:<br>
&gt; <a href=3D"https://plus.google.com/u/0/110579591067038943673/posts/SLB=
35o1JgBu" target=3D"_blank">https://plus.google.com/u/0/1105795910670389436=
73/posts/SLB35o1JgBu</a><br>
&gt;<br>
&gt; --<br>
&gt; Denys<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Oct 22, 2013 at 03:36:21PM -0400, Denys Dmytriyenko wrote:<br>
&gt; &gt; Huh, I&#39;m wondering if 1.2 is still supported... There were 2.=
0 and 2.1<br>
&gt; &gt; versions of the silicon and I believe those are the latest ones. =
Need to<br>
&gt; &gt; double-check that.<br>
&gt; &gt;<br>
&gt; &gt; Denys<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Oct 22, 2013 at 08:57:51AM +0100, Rudolf Streif wrote:<br=
>
&gt; &gt; &gt; Where do I find the PG version of the board? The barcode sti=
cker on the<br>
&gt; &gt; &gt; board says rev 1.2.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko &lt;<a h=
ref=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Now I&#39;m just wondering what PG version of the board=
 you&#39;ve got, if it<br>
&gt; &gt; &gt; &gt; fails in<br>
&gt; &gt; &gt; &gt; the same way with our 3.8 kernel and a known good set o=
f 3.12 images...<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; Thanks, Denys.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Interesting point about gcc. It&#39;s version 4.8.=
1 which is the default for<br>
&gt; &gt; &gt; &gt; &gt; poky master. Which is what I used all along.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Thanks for sending your binaries. They fail too wi=
th the exact same<br>
&gt; &gt; &gt; &gt; &gt; problem. See attached log. I found [1] on gmane wh=
ich exactly describes<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; problem I am seeing.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; If that is the case then I was wondering why my ea=
rlier builds with<br>
&gt; &gt; &gt; &gt; &gt; 3.12-rc3 actually worked. And I tried them again a=
nd they are now failing<br>
&gt; &gt; &gt; &gt; &gt; too. Of course I don&#39;t know anything about the=
 specifics of the gpio and<br>
&gt; &gt; &gt; &gt; &gt; the timers on the chip but it looks like a weird h=
ardware initialization<br>
&gt; &gt; &gt; &gt; &gt; condition. And I don&#39;t know if the proposed pa=
tch in [1] was ever<br>
&gt; &gt; &gt; &gt; &gt; incorporated in your kernel tree.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I don&#39;t think it&#39;s the hardware (or at lea=
st not alone) because the SD<br>
&gt; &gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; &gt; ships with it with the 3.2 kernel works just fine.=
<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; [1] =A0<a href=3D"http://permalink.gmane.org/gmane=
.linux.ports.arm.omap/96044" target=3D"_blank">http://permalink.gmane.org/g=
mane.linux.ports.arm.omap/96044</a><br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenk=
o &lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt;<br>
&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Rudi,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; As we discussed earlier today, let my send yo=
u my binaries for the<br>
&gt; &gt; &gt; &gt; kernel<br>
&gt; &gt; &gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; &gt; u-boot to try on your board. I just wanted to=
 ask you about the<br>
&gt; &gt; &gt; &gt; toolchain<br>
&gt; &gt; &gt; &gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; &gt; &gt; you used to build yours. In our builds we use=
 Linaro gcc-4.7 hardfp<br>
&gt; &gt; &gt; &gt; &gt; &gt; toolchain<br>
&gt; &gt; &gt; &gt; &gt; &gt; and I vaguely remember hearing about some pro=
blems with the recent<br>
&gt; &gt; &gt; &gt; gcc-4.8<br>
&gt; &gt; &gt; &gt; &gt; &gt; toolchain from oe-core... I&#39;m wondering i=
f you are having the same<br>
&gt; &gt; &gt; &gt; issue.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; Denys<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rud=
olf Streif wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Since the 3.12-rc5 kernel does not work =
I decided to give the 3.8<br>
&gt; &gt; &gt; &gt; kernel<br>
&gt; &gt; &gt; &gt; &gt; &gt; a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; try. The issue with this one is that the=
 linux-ti-staging_3.8.bbrecipe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; explicitly sets KERNEL_IMAGETYPE=3D&quot=
;uImage&quot;. However, the u-boot<br>
&gt; &gt; &gt; &gt; &gt; &gt; environment<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; has now moved on to using zImage which c=
onsequently means u-boot<br>
&gt; &gt; &gt; &gt; will not<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; find the kernel file.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; I do not know why KERNEL_IMAGETYPE =3D &=
quot;uImage&quot; was hacked into the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"http://linux-ti-staging_3.8.b=
b" target=3D"_blank">linux-ti-staging_3.8.bb</a> recipe but whoever did it =
did not think<br>
&gt; &gt; &gt; &gt; about<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; u-boot. Does zImage not work with 3.8? I=
 did not try it but it should<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; normally have no effect. Since there is =
no dependency of the u-boot<br>
&gt; &gt; &gt; &gt; &gt; &gt; recipes<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; on the kernel image types changes to the=
 kernel image type for newer<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; versions of the kernel then automaticall=
y means that it must be<br>
&gt; &gt; &gt; &gt; changed<br>
&gt; &gt; &gt; &gt; &gt; &gt; for<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; the previous versions too.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; I mocked around with the u-boot environm=
ent and booted the 3.8 uImage<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; kernel. To my surprise the 3.8 kernel fr=
om the TI staging repository<br>
&gt; &gt; &gt; &gt; &gt; &gt; fails<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; with the exact same problem and stops bo=
oting with a kernel not<br>
&gt; &gt; &gt; &gt; syncing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; message during the init calls. Apparentl=
y a patch must have been<br>
&gt; &gt; &gt; &gt; applied<br>
&gt; &gt; &gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; the kernel repo that breaks it. It has n=
othing possibly to do with<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; build system.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; I would appreciate any hints to get this=
 kernel built and boot on the<br>
&gt; &gt; &gt; &gt; &gt; &gt; board.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Mon, Oct 21, 2013 at 1:16 AM, Rudolf =
Streif<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:rstreif@linuxfound=
ation.org">rstreif@linuxfoundation.org</a>&gt;wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Denys,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I recompiled the 3.12-rc5 kernel ag=
ain but it still stalls during<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; initialization. I attached the boot=
 log. I don&#39;t know much about<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; platform details but maybe that&#39=
;s an issue you know about.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; [1]<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Build Configuration:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; BB_VERSION =A0 =A0 =A0 =A0=3D &=
quot;1.21.0&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; BUILD_SYS =A0 =A0 =A0 =A0 =3D &=
quot;x86_64-linux&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; NATIVELSBSTRING =A0 =3D &quot;F=
edora-18&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; TARGET_SYS =A0 =A0 =A0 =A0=3D &=
quot;arm-poky-linux-gnueabi&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; MACHINE =A0 =A0 =A0 =A0 =A0 =3D=
 &quot;am335x-evm&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; DISTRO =A0 =A0 =A0 =A0 =A0 =A0=
=3D &quot;poky&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; DISTRO_VERSION =A0 =A0=3D &quot=
;1.5+snapshot-20131019&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; TUNE_FEATURES =A0 =A0 =3D &quot=
;armv7a vfp neon&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; TARGET_FPU =A0 =A0 =A0 =A0=3D &=
quot;vfp-neon&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta-yocto =A0 =A0 =A0 =A0=3D<b=
r>
&gt; &gt; &gt; &gt; &quot;master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&q=
uot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta-ti =A0 =A0 =A0 =A0 =A0 =3D=
<br>
&gt; &gt; &gt; &gt; &quot;master:c11504664990f007c3903d349e7cc135a904f8e2&q=
uot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta-oe =A0 =A0 =A0 =A0 =A0 =3D=
<br>
&gt; &gt; &gt; &gt; &quot;master:f8903f53db717294d63a8d79b5ef7ca34b3c189e&q=
uot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; meta =A0 =A0 =A0 =A0 =A0 =A0 =
=A0=3D<br>
&gt; &gt; &gt; &gt; &quot;master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&q=
uot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; The Linux Foundation<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:rudolf.streif@linux.co=
m">rudolf.streif@linux.com</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Phone: <a href=3D"tel:%2B1.619.537.6646"=
 value=3D"+16195376646">+1.619.537.6646</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Linux Foundation Events Schedule: =A0<a =
href=3D"http://events.linuxfoundation.org" target=3D"_blank">events.linuxfo=
undation.org</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Linux Foundation Training Schedule: <a h=
ref=3D"http://training.linuxfoundation.org" target=3D"_blank">training.linu=
xfoundation.org</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ________________________________________=
_______<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; meta-ti mailing list<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.o=
rg">meta-ti@yoctoproject.org</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.or=
g/listinfo/meta-ti" target=3D"_blank">https://lists.yoctoproject.org/listin=
fo/meta-ti</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; &gt; &gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; &gt; &gt; &gt; The Linux Foundation<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:rudolf.streif@linux.com">rudolf.=
streif@linux.com</a><br>
&gt; &gt; &gt; &gt; &gt; Phone: <a href=3D"tel:%2B1.619.537.6646" value=3D"=
+16195376646">+1.619.537.6646</a><br>
&gt; &gt; &gt; &gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; &gt; &gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Linux Foundation Events Schedule: =A0<a href=3D"ht=
tp://events.linuxfoundation.org" target=3D"_blank">events.linuxfoundation.o=
rg</a><br>
&gt; &gt; &gt; &gt; &gt; Linux Foundation Training Schedule: <a href=3D"htt=
p://training.linuxfoundation.org" target=3D"_blank">training.linuxfoundatio=
n.org</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; &gt; The Linux Foundation<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"mailto:rudolf.streif@linux.com">rudolf.streif@lin=
ux.com</a><br>
&gt; &gt; &gt; Phone: <a href=3D"tel:%2B1.619.537.6646" value=3D"+161953766=
46">+1.619.537.6646</a><br>
&gt; &gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Linux Foundation Events Schedule: =A0<a href=3D"http://event=
s.linuxfoundation.org" target=3D"_blank">events.linuxfoundation.org</a><br>
&gt; &gt; &gt; Linux Foundation Training Schedule: <a href=3D"http://traini=
ng.linuxfoundation.org" target=3D"_blank">training.linuxfoundation.org</a><=
br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; meta-ti mailing list<br>
&gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.=
org</a><br>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" targe=
t=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; ------------------------------<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt;<br>
&gt;<br>
&gt; End of meta-ti Digest, Vol 25, Issue 36<br>
&gt; ***************************************<br>
&gt; Confidentiality Notice:<br>
&gt;<br>
&gt; The preceding e-mail message (including any attachments) contains info=
rmation that may be confidential, protected by applicable legal privileges,=
 or constitute non-public information. It is intended to be conveyed only t=
o the designated recipient(s). If you are not an intended recipient of this=
 message, please notify the sender by replying to this message and then del=
ete it from your system. Use, dissemination, distribution or reproduction o=
f this message by unintended recipients is<br>

&gt; not authorized and may be unlawful.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</div></div><br>_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>
</div></div>

--001a11c38f105ab05a04e95d079b--

Return-Path: <tom.rini@gmail.com>
Received: from mail-qy0-f176.google.com (mail-qy0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B7A8E006DF
	for <meta-ti@yoctoproject.org>; Mon, 12 Dec 2011 16:59:17 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qcsc2 with SMTP id c2so5264682qcs.35
	for <meta-ti@yoctoproject.org>; Mon, 12 Dec 2011 16:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=7lN0EiKm+CjUI3KKw05oRQ6Bl7aJT/8oAXSpLXNC14I=;
	b=rwcgCpqcrdwbz36cnc36IDHdpLWNsQp9AlGI2727ZCgHwimRUORLwdLx+VsaifneMc
	zChN7X1M5kZBxCqhDS4n2j4TqIOsn2UtQxbgA6kvyJS7SnGbPFurVd1DaMi+hpkL1ulf
	0qi/jmVGgEDPS+jeWpJ9RvWGTc5PVMSFWs/1c=
MIME-Version: 1.0
Received: by 10.229.77.18 with SMTP id e18mr61901qck.78.1323737956415; Mon, 12
	Dec 2011 16:59:16 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Mon, 12 Dec 2011 16:59:16 -0800 (PST)
In-Reply-To: <201112130142.24576.schnitzeltony@gmx.de>
References: <1322406218-8831-1-git-send-email-koen@dominion.thruhere.net>
	<201112080213.11291.schnitzeltony@gmx.de>
	<CA+M6bXkfJwdux+UvDpKutADD5ObWLT836Lj1DZJAfpMtoq9hqg@mail.gmail.com>
	<201112130142.24576.schnitzeltony@gmx.de>
Date: Mon, 12 Dec 2011 17:59:16 -0700
Message-ID: <CA+M6bXm7w-JgO4XdVs+EYorTMU1AVFA37C5BKV72OundKA_g_w@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@gmx.de>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] u-boot 2011.09: convert beagleboard to SPL build
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
X-List-Received-Date: Tue, 13 Dec 2011 00:59:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2011 at 5:42 PM, Andreas M=FCller <schnitzeltony@gmx.de> wr=
ote:
> On Thursday, December 08, 2011 03:49:47 PM you wrote:
>> On Wed, Dec 7, 2011 at 6:13 PM, Andreas M=FCller <schnitzeltony@gmx.de> =
wrote:
>> > On Sunday, November 27, 2011 04:03:37 PM Koen Kooi wrote:
>> >> Runtime tested on an xM rev C
>> >>
>> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> >> ---
>> >> =A0...-probe-DDC-bus-for-expansionboard-EEPROMS.patch | =A0165 ------=
----
>> >> =A0...p3-mem-Comment-enable_gpmc_cs_config-more.patch | =A0 56 ++++
>> >> =A0...e-SDRC-dram_init-to-always-call-make_cs1_.patch | =A0 66 ++++
>> >> =A0...-a-helper-function-to-set-timings-in-SDRC.patch | =A0172 ++++++=
+++++
>> >> =A0...e-mem_ok-to-clear-again-after-reading-bac.patch | =A0 30 ++
>> >> =A0.../0005-OMAP3-Remove-get_mem_type-prototype.patch | =A0 28 ++
>> >> =A0.../0006-omap3-mem-Add-MCFG-helper-macro.patch =A0 =A0 | =A0 97 ++=
++++
>> >> =A0...d-optimal-SDRC-autorefresh-control-values.patch | =A0 59 ++++
>> >> =A0...x-all-Micron-memory-timing-parts-with-the.patch | =A0 55 ++++
>> >> =A0...ework-memory-initalization-and-devkit8000.patch | =A0174 ++++++=
+++++
>> >> =A0...OMAP3-SPL-Add-identify_nand_chip-function.patch | =A0142 ++++++=
+++
>> >> =A0...0011-OMAP3-Add-SPL-support-to-Beagleboard.patch | =A0315
>> >
>> > Is anybody working on SPL support for gumstix overo?
>>
>> No, but in mainline U-Boot it should be very easy to do so and I'd be
>> glad to help out with questions on the SPL specific side of things
>> (basically overo needs to provide a function that returns the correct
>> timings for the SDRC for the board rev in question).
> Got overo board revisions 0 & 1 booting fine from SDcard ( revision 2 mig=
ht need
> further alignment.. ) [1].
>
> To prevent modifying multiple locations I left
>
> CONFIG_SYS_TEXT_BASE =A0 =A0 =A0 =A0 =A0 0x80080000

This is part of your problem, actually.  You need to move it up to
0x8100'0000, but you can for everything (well, except for NOR, but
that's not SPL :)).

> To test NAND I did on u-boot console ( based on [2] )
>
> | nand erase.chip
> | mmc rescan 0
>
> | # write MLO
> | fatload mmc 0 $loadaddr MLO
> | nandecc hw
> | nand write $loadaddr 0 ${filesize}
>
> | # write u-boot
> | fatload mmc 0 ${loadaddr} u-boot.bin
> | nand write ${loadaddr} 80000 ${filesize}

Two problems, needs to be in 'nandecc hw' mode too and should be
u-boot.img to avoid the problem you get on "signature not found"

> | Boot SPL 2011.09-01172-gfdbe8b9-dirty (Dec 13 2011 - 00:58:36)
> | Texas Instruments Revision detection unimplemented
> Is it correct that this is only implemented for OMAP4/5 so for OMAP3 this
> message is OK?

So, this is omap_rev_parse, or so (check
arch/arm/cpu/armv7/omap-common/spl.c for the exact name) and it's a
weak function to be provided by boards.  On OMAP4/5/am33xx they can
tell at run-time (am33xx reads an i2c eeprom, dunno about omap4/5) but
on omap3 we have this per-board.

Oh, and FWIW feel free to bring this up on the u-boot ML if you want,
we're getting a little off-topic for meta-ti but that's OK :)

--=20
Tom


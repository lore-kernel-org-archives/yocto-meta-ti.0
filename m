Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D147E00950; Tue, 16 Oct 2018 12:20:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.160.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F5D5E006AF
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 12:20:38 -0700 (PDT)
Received: by mail-qt1-f193.google.com with SMTP id j46-v6so27141724qtc.9
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 12:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4D27hGttuellCh0XGNBz5RXh8CYUun694jHIEPNYeio=;
	b=aLENI8p76ANsKTL5nsFE36b5y2D/DLKTxmsA6jEg11hog4dkzrvLd6ssWGB9y1KrR3
	QLZ0wfdtvkXDCln26UH9HRaWMbUtXcPaEm6PJvfR/hM76F0mL7x9YfjneQLYEKvJID1v
	Cm66tQgN3ksLA5MbCj1BcNACVjuf+V4x4/F7FqraBi/tilHPgSeClh77QezNLwklKwTS
	CiviTsRchATltVwiheJSgYmYPnnA+7c5fiZ/FEn9/Q+zcDSza2Vp47luQCAv1iub1BqE
	VlIe3N36jdw0KAK0m3ZduOlxNdwAIh+R922n2crekoWIqzh3765ZEz5r1on/b+inqolR
	8O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4D27hGttuellCh0XGNBz5RXh8CYUun694jHIEPNYeio=;
	b=BbWLlyBrgIEIHPGajy5P6NGk8fv1a5842+kQQTvtrKPe4jRbaJjk67NSoA2NB0a8IB
	gDjTY3lM5u7VHczru0iQwQTE62qx9xibCctVS6hLdR3edbrogg24LMZc9vpASZPyeJaB
	9Q0kXyMIIkNG8duZGk3UuFFBMs8rv59tKQp4yUSG8+GMKVwZj0d0C56cmk8dCkIjUglb
	KPNBoQaCr8l0VI5dUeqCdDhMgUD0IMeo+GCl+lXORDS6+zEEDd6IjA6WJWkGFw61cYCg
	ifpX3YnO8YiFi679/qsO7tX/WKf+RZt5frGqyeYfcM82nBXiD/JmQQK0ZSPkmKKrWVcj
	SXug==
X-Gm-Message-State: ABuFfoif4tegy4d4yPR8jYmkW0Dd+Y+rGdfBOcG3CkkKX+24g1uAPUHu
	R392Lo0LxZpN1NjksBaGedWXP4xJw/RbVpR3dUA=
X-Google-Smtp-Source: ACcGV608EGD9lsK2NA5E9Wd9gOshpjqPETlM8cTBBldZ+JaI8Fc24H8dGInsBVCRcX3/eljIf9wZr6Hbj2yk2W2TFvc=
X-Received: by 2002:aed:3024:: with SMTP id
	33-v6mr17646029qte.29.1539717637621; 
	Tue, 16 Oct 2018 12:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <1539399036-6199-1-git-send-email-denys@ti.com>
	<CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
	<20181014192417.GB20670@beryl>
	<CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
	<20181016164210.GI1032@bill-the-cat>
	<CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
	<20181016182859.GI14250@beryl>
	<CAMKF1spHf5=JABw4D6Ue7AGRAxuW=56rLbJC74V=kJoGfkucrA@mail.gmail.com>
	<20181016190045.GL14250@beryl>
In-Reply-To: <20181016190045.GL14250@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Oct 2018 12:20:11 -0700
Message-ID: <CAMKF1sokGGToJ0Gmoi1gGgWatd6Bium+dgCu0jU8C2hUt1gptg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org, Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH] beaglebone.conf: temporarily use generic am335x_evm_config for U-boot
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
X-List-Received-Date: Tue, 16 Oct 2018 19:20:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 16, 2018 at 12:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Tue, Oct 16, 2018 at 11:50:36AM -0700, Khem Raj wrote:
> > On Tue, Oct 16, 2018 at 11:29 AM Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > On Tue, Oct 16, 2018 at 11:11:36AM -0700, Khem Raj wrote:
> > > > On Tue, Oct 16, 2018 at 9:42 AM Tom Rini <trini@konsulko.com> wrote:
> > > > >
> > > > > On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj wrote:
> > > > > > On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > > > >
> > > > > > > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> > > > > > > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > > > > > >
> > > > > > > > > There have been reports recently that am335x_beaglebone_config generates bad SPL.
> > > > > > > > > Until that is debugged and fixed, use generic am335x_evm_config that covers all
> > > > > > > > > AM335x platforms, including BeagleBone variants.
> > > > > > > > >
> > > > > > > >
> > > > > > > > it fails to link
> > > > > > > >
> > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
> > > > > > > > fit in region `.sram'
> > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> > > > > > > > | make[2]: *** [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-staging/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
> > > > > > > > spl/u-boot-spl] Error 1
> > > > > > >
> > > > > > > FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from oe-core, as well as
> > > > > > > Linaro gcc7 - no problems.
> > > > > >
> > > > > > My distro inherits poky policies, and on master it now inherits
> > > > > > hardening policies ( security flags) by defaults
> > > > > > do you happen to test poky ?
> > > > >
> > > > > I think we want to take a look at which of the security flags really
> > > > > make sense to use in this context.  Thanks!
> > > > >
> > > >
> > > > there could be more to it, since the distro uses thumb2 ISA by
> > > > default, I am not sure
> > > > if u-boot overrides that and builds using arm mode ISA always but
> > > > something to consider, I saw several reports about u-boot overflowing
> > > > sram sections and most of
> > > > the solutions were "oh it works for me" or at the best your toolchain
> > > > is different then mine. here is mine use it and move on.
> > >
> > > Khem,
> > >
> > > Well, FWIW, Tom and I are very familiar with this issue. As a matter of fact,
> > > I first encountered it almost 2 years ago and had to prove there's such an
> > > issue, because everyone was saying it works for them, something must be wrong
> > > with my OE builds... :)
> > >
> > > While .sram region is very limited, the issue is exacerbated by the fact that
> > > all debug symbols from macros like __FILE__ are ended up in that section as
> > > well. So, the longer your build path, the larger the section becomes. Once I
> > > had instructions to reproduce the failure here internally with a series of
> > > long-named nested directories like aaaaaa and bbbbbb, Nishanth started this
> > > thread on U-boot mailing list:
> > > https://lists.denx.de/pipermail/u-boot/2017-March/285031.html
> > >
> > > We've had the corresponding bug open internally all this time, while adding
> > > workarounds to limit .sram section size by other means, like disabling some
> > > options to reduce the code size. Your patch is one of those workarounds...
> > >
> > > But we've been patiently waiting for the following feature to come into gcc to
> > > fix the issue properly:
> > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70268
> > >
> > > Since it's now part of gcc8, we should be able to use it. Not sure how to keep
> > > gcc7 backward compatibility though...
> >
> > dumping absolute file name strings into SPL seems a waste of space to
> > me, but I will leave that out for now. Moreover it exposes build paths
> > into binaries that user may not be interested to share
> >
> > -ffile-prefix-map has been in OE toolchains since gcc6 and I think we
> > are already using it for kernel builds. We can probably enhance uboot
> > recipes in OE-Core to
> > use this option if compiler supports it. That solves my problem.
>
> Yeah, extending that from kernel to u-boot would be nice.
> Unfortunately, our products use Linaro gcc7 on rocko for now. Planning to
> migrate to gcc8 on thud soon...

we can check for the option before using it so atleast it will not
break older toolchains more than what they are already broken.


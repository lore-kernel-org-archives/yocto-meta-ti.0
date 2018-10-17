Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56796E00B9F; Tue, 16 Oct 2018 18:42:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.222.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42D2DE0095C
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 18:42:37 -0700 (PDT)
Received: by mail-qk1-f195.google.com with SMTP id x8-v6so15506225qka.4
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 18:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K1T1SU0UytcrCFgvVx3iXK4dAcMtSHMfbCnFtvqCm5I=;
	b=YLkfA0w2+9ENZ8csxqHnhhnZ2H7yNXckxLQ4owCA+lUtVo0b1KcWTwq0/c4djv+UaG
	DZVVaj92fX9/AelsuHix615DqcFAxCY5yjKMlsiciL0ch5h1v8lK3s9ottxe/wp3HeoF
	CcVxHXdRNObZzC9a4rAVstSzsthBZKxa+QbW1s+1kokzHWs0/eE46GBOM/SGrBiKrjsQ
	WkT/BRsENSuLZAgEs0sCSZ2qez0smOR8v38cdR13oBmgpKe4kKmRfcGaiGUMMr4kxloS
	eQYCvU8yXHS1LljnLL9E1Spya4AlLcfaaJqdHefgyraMeqZw2MzqTlE2eOyea49eiNiu
	7b/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K1T1SU0UytcrCFgvVx3iXK4dAcMtSHMfbCnFtvqCm5I=;
	b=sSdgQPnyLMl+Ni3up0SDNNU+gld1Ws5I4hbNlSN986JwBRgy60ZnGgdge35dya1LKT
	Zuj9Tyhu/lEbKNCyeD3myhC1oPi4ND1V09yx/CU97clNWpUI/peig42VFNxKEaZ47fQP
	yWhF6rotxlM1hbYylXYrtkJUs/EinrGW7K2l5KPBDD2KMxYYf/5rRvs/17k1hG/LLafJ
	uvE9EGPDhflQOfcZ+JoVRqEztYivjZe3UAT0ik43Vk7+gz0CmMsmhdoX+oqajU2k9O+k
	+HziTKBySgvKH8bqgzZSX/+mS35fb3r3f8Yofr2lY+A5zarb+UuUYGK6eLyfheM6myIj
	d+Ug==
X-Gm-Message-State: ABuFfoiQoyj/bO8nEaKBsqAJ9xIgl7LG4p9O+Ym3HfMGciO1Wff9iTXe
	AgKfEORNy1PslMFHZm1qLHo8G9/XE//xHHWgOHo=
X-Google-Smtp-Source: ACcGV63BKar8PH7o6g1T/x2T3O1lEGn0JMAfBBch5eawM7bOoNxcyeNX4pukklerew4JmCQC49oBzNcd2xrsZlui+Io=
X-Received: by 2002:a37:5003:: with SMTP id
	e3-v6mr23351700qkb.102.1539740556391; 
	Tue, 16 Oct 2018 18:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20181014192417.GB20670@beryl>
	<CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
	<20181016164210.GI1032@bill-the-cat>
	<CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
	<20181016182859.GI14250@beryl>
	<CAMKF1spHf5=JABw4D6Ue7AGRAxuW=56rLbJC74V=kJoGfkucrA@mail.gmail.com>
	<20181016190045.GL14250@beryl>
	<CAMKF1sokGGToJ0Gmoi1gGgWatd6Bium+dgCu0jU8C2hUt1gptg@mail.gmail.com>
	<CAMKF1srDGr=7fwK8-cD2vfJgbzYDVgcgWU-GUDEeh2A8BHJ0WA@mail.gmail.com>
	<20181017002645.GO14250@beryl> <20181017003752.GP14250@beryl>
In-Reply-To: <20181017003752.GP14250@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Oct 2018 18:42:10 -0700
Message-ID: <CAMKF1spCxg6=13aWx26QqU4eA6Xj-cjwNh7uctOkKUXQhTHoCg@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Oct 2018 01:42:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 16, 2018 at 5:37 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Tue, Oct 16, 2018 at 08:26:45PM -0400, Denys Dmytriyenko wrote:
> > On Tue, Oct 16, 2018 at 02:19:36PM -0700, Khem Raj wrote:
> > > On Tue, Oct 16, 2018 at 12:20 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Tue, Oct 16, 2018 at 12:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > >
> > > > > On Tue, Oct 16, 2018 at 11:50:36AM -0700, Khem Raj wrote:
> > > > > > On Tue, Oct 16, 2018 at 11:29 AM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > > > >
> > > > > > > On Tue, Oct 16, 2018 at 11:11:36AM -0700, Khem Raj wrote:
> > > > > > > > On Tue, Oct 16, 2018 at 9:42 AM Tom Rini <trini@konsulko.com> wrote:
> > > > > > > > >
> > > > > > > > > On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj wrote:
> > > > > > > > > > On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> > > > > > > > > > > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > There have been reports recently that am335x_beaglebone_config generates bad SPL.
> > > > > > > > > > > > > Until that is debugged and fixed, use generic am335x_evm_config that covers all
> > > > > > > > > > > > > AM335x platforms, including BeagleBone variants.
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > it fails to link
> > > > > > > > > > > >
> > > > > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
> > > > > > > > > > > > fit in region `.sram'
> > > > > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> > > > > > > > > > > > | make[2]: *** [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-staging/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
> > > > > > > > > > > > spl/u-boot-spl] Error 1
> > > > > > > > > > >
> > > > > > > > > > > FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from oe-core, as well as
> > > > > > > > > > > Linaro gcc7 - no problems.
> > > > > > > > > >
> > > > > > > > > > My distro inherits poky policies, and on master it now inherits
> > > > > > > > > > hardening policies ( security flags) by defaults
> > > > > > > > > > do you happen to test poky ?
> > > > > > > > >
> > > > > > > > > I think we want to take a look at which of the security flags really
> > > > > > > > > make sense to use in this context.  Thanks!
> > > > > > > > >
> > > > > > > >
> > > > > > > > there could be more to it, since the distro uses thumb2 ISA by
> > > > > > > > default, I am not sure
> > > > > > > > if u-boot overrides that and builds using arm mode ISA always but
> > > > > > > > something to consider, I saw several reports about u-boot overflowing
> > > > > > > > sram sections and most of
> > > > > > > > the solutions were "oh it works for me" or at the best your toolchain
> > > > > > > > is different then mine. here is mine use it and move on.
> > > > > > >
> > > > > > > Khem,
> > > > > > >
> > > > > > > Well, FWIW, Tom and I are very familiar with this issue. As a matter of fact,
> > > > > > > I first encountered it almost 2 years ago and had to prove there's such an
> > > > > > > issue, because everyone was saying it works for them, something must be wrong
> > > > > > > with my OE builds... :)
> > > > > > >
> > > > > > > While .sram region is very limited, the issue is exacerbated by the fact that
> > > > > > > all debug symbols from macros like __FILE__ are ended up in that section as
> > > > > > > well. So, the longer your build path, the larger the section becomes. Once I
> > > > > > > had instructions to reproduce the failure here internally with a series of
> > > > > > > long-named nested directories like aaaaaa and bbbbbb, Nishanth started this
> > > > > > > thread on U-boot mailing list:
> > > > > > > https://lists.denx.de/pipermail/u-boot/2017-March/285031.html
> > > > > > >
> > > > > > > We've had the corresponding bug open internally all this time, while adding
> > > > > > > workarounds to limit .sram section size by other means, like disabling some
> > > > > > > options to reduce the code size. Your patch is one of those workarounds...
> > > > > > >
> > > > > > > But we've been patiently waiting for the following feature to come into gcc to
> > > > > > > fix the issue properly:
> > > > > > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70268
> > > > > > >
> > > > > > > Since it's now part of gcc8, we should be able to use it. Not sure how to keep
> > > > > > > gcc7 backward compatibility though...
> > > > > >
> > > > > > dumping absolute file name strings into SPL seems a waste of space to
> > > > > > me, but I will leave that out for now. Moreover it exposes build paths
> > > > > > into binaries that user may not be interested to share
> > > > > >
> > > > > > -ffile-prefix-map has been in OE toolchains since gcc6 and I think we
> > > > > > are already using it for kernel builds. We can probably enhance uboot
> > > > > > recipes in OE-Core to
> > > > > > use this option if compiler supports it. That solves my problem.
> > > > >
> > > > > Yeah, extending that from kernel to u-boot would be nice.
> > > > > Unfortunately, our products use Linaro gcc7 on rocko for now. Planning to
> > > > > migrate to gcc8 on thud soon...
> > > >
> > > > we can check for the option before using it so atleast it will not
> > > > break older toolchains more than what they are already broken.
> > >
> > > I added -ffile-prefix-map locally just with this option added it did
> > > not fix the problem.
> >
> > So, I tried Poky and I do see it overflow by 5-6 KB, which is quite a lot.
> > Though disabling security flags just for u-boot didn't change it a bit.
> > Something else is going on. I'm now rebuilding Poky with security flags
> > disabled globally...
>
> Hmm, disabling security flags globally and rebuilding toolchain and then
> u-boot "fixes" it. Wonder what would cause the same code to change by 6KB.

security flags also enable PIE in gcc by default. secondly it also
enable ssp can you try setting

SECURITY_LDFLAGS = ""
SECURITY_STACK_PROTECTOR = ""

in uboot recipe and see if that helps.

If it does not then add

SECURITY_CFLAGS = "${SECURITY_NOPIE_CFLAGS}"

and see if that helps


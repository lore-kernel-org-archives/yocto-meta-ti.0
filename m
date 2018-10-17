Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45AE2E00BBF; Tue, 16 Oct 2018 17:37:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DEEAE0095C
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 17:37:57 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9H0buLp072049;
	Tue, 16 Oct 2018 19:37:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539736676;
	bh=KFaoE31Yk9sJ+ct9fz7111peoGvO5hUEK/yI+glm64A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=L6M4heSZk3qUs5Ht+THHaOXHfRWisRPGq8oOGspAUsBOf7tPAyE/DHZYaSWMG4wUa
	3o/zHBPZ0QhNlQLGk3TbRmzd++5ozuipU4VuBeoOTnaSUywmFqzD5PyoB5yN6jTbmG
	z1qL1OOh7DQVqNrvLiJrdes49ZDO1XrP9hjBN5uQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9H0busR017675;
	Tue, 16 Oct 2018 19:37:56 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 16 Oct 2018 19:37:56 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 16 Oct 2018 19:37:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9H0bscC029124;
	Tue, 16 Oct 2018 19:37:55 -0500
Date: Tue, 16 Oct 2018 20:37:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181017003752.GP14250@beryl>
References: <20181014192417.GB20670@beryl>
	<CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
	<20181016164210.GI1032@bill-the-cat>
	<CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
	<20181016182859.GI14250@beryl>
	<CAMKF1spHf5=JABw4D6Ue7AGRAxuW=56rLbJC74V=kJoGfkucrA@mail.gmail.com>
	<20181016190045.GL14250@beryl>
	<CAMKF1sokGGToJ0Gmoi1gGgWatd6Bium+dgCu0jU8C2hUt1gptg@mail.gmail.com>
	<CAMKF1srDGr=7fwK8-cD2vfJgbzYDVgcgWU-GUDEeh2A8BHJ0WA@mail.gmail.com>
	<20181017002645.GO14250@beryl>
MIME-Version: 1.0
In-Reply-To: <20181017002645.GO14250@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Wed, 17 Oct 2018 00:37:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 16, 2018 at 08:26:45PM -0400, Denys Dmytriyenko wrote:
> On Tue, Oct 16, 2018 at 02:19:36PM -0700, Khem Raj wrote:
> > On Tue, Oct 16, 2018 at 12:20 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Tue, Oct 16, 2018 at 12:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > >
> > > > On Tue, Oct 16, 2018 at 11:50:36AM -0700, Khem Raj wrote:
> > > > > On Tue, Oct 16, 2018 at 11:29 AM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > > >
> > > > > > On Tue, Oct 16, 2018 at 11:11:36AM -0700, Khem Raj wrote:
> > > > > > > On Tue, Oct 16, 2018 at 9:42 AM Tom Rini <trini@konsulko.com> wrote:
> > > > > > > >
> > > > > > > > On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj wrote:
> > > > > > > > > On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> > > > > > > > > > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > There have been reports recently that am335x_beaglebone_config generates bad SPL.
> > > > > > > > > > > > Until that is debugged and fixed, use generic am335x_evm_config that covers all
> > > > > > > > > > > > AM335x platforms, including BeagleBone variants.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > it fails to link
> > > > > > > > > > >
> > > > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
> > > > > > > > > > > fit in region `.sram'
> > > > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> > > > > > > > > > > | make[2]: *** [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-staging/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
> > > > > > > > > > > spl/u-boot-spl] Error 1
> > > > > > > > > >
> > > > > > > > > > FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from oe-core, as well as
> > > > > > > > > > Linaro gcc7 - no problems.
> > > > > > > > >
> > > > > > > > > My distro inherits poky policies, and on master it now inherits
> > > > > > > > > hardening policies ( security flags) by defaults
> > > > > > > > > do you happen to test poky ?
> > > > > > > >
> > > > > > > > I think we want to take a look at which of the security flags really
> > > > > > > > make sense to use in this context.  Thanks!
> > > > > > > >
> > > > > > >
> > > > > > > there could be more to it, since the distro uses thumb2 ISA by
> > > > > > > default, I am not sure
> > > > > > > if u-boot overrides that and builds using arm mode ISA always but
> > > > > > > something to consider, I saw several reports about u-boot overflowing
> > > > > > > sram sections and most of
> > > > > > > the solutions were "oh it works for me" or at the best your toolchain
> > > > > > > is different then mine. here is mine use it and move on.
> > > > > >
> > > > > > Khem,
> > > > > >
> > > > > > Well, FWIW, Tom and I are very familiar with this issue. As a matter of fact,
> > > > > > I first encountered it almost 2 years ago and had to prove there's such an
> > > > > > issue, because everyone was saying it works for them, something must be wrong
> > > > > > with my OE builds... :)
> > > > > >
> > > > > > While .sram region is very limited, the issue is exacerbated by the fact that
> > > > > > all debug symbols from macros like __FILE__ are ended up in that section as
> > > > > > well. So, the longer your build path, the larger the section becomes. Once I
> > > > > > had instructions to reproduce the failure here internally with a series of
> > > > > > long-named nested directories like aaaaaa and bbbbbb, Nishanth started this
> > > > > > thread on U-boot mailing list:
> > > > > > https://lists.denx.de/pipermail/u-boot/2017-March/285031.html
> > > > > >
> > > > > > We've had the corresponding bug open internally all this time, while adding
> > > > > > workarounds to limit .sram section size by other means, like disabling some
> > > > > > options to reduce the code size. Your patch is one of those workarounds...
> > > > > >
> > > > > > But we've been patiently waiting for the following feature to come into gcc to
> > > > > > fix the issue properly:
> > > > > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70268
> > > > > >
> > > > > > Since it's now part of gcc8, we should be able to use it. Not sure how to keep
> > > > > > gcc7 backward compatibility though...
> > > > >
> > > > > dumping absolute file name strings into SPL seems a waste of space to
> > > > > me, but I will leave that out for now. Moreover it exposes build paths
> > > > > into binaries that user may not be interested to share
> > > > >
> > > > > -ffile-prefix-map has been in OE toolchains since gcc6 and I think we
> > > > > are already using it for kernel builds. We can probably enhance uboot
> > > > > recipes in OE-Core to
> > > > > use this option if compiler supports it. That solves my problem.
> > > >
> > > > Yeah, extending that from kernel to u-boot would be nice.
> > > > Unfortunately, our products use Linaro gcc7 on rocko for now. Planning to
> > > > migrate to gcc8 on thud soon...
> > >
> > > we can check for the option before using it so atleast it will not
> > > break older toolchains more than what they are already broken.
> > 
> > I added -ffile-prefix-map locally just with this option added it did
> > not fix the problem.
> 
> So, I tried Poky and I do see it overflow by 5-6 KB, which is quite a lot. 
> Though disabling security flags just for u-boot didn't change it a bit. 
> Something else is going on. I'm now rebuilding Poky with security flags 
> disabled globally...

Hmm, disabling security flags globally and rebuilding toolchain and then 
u-boot "fixes" it. Wonder what would cause the same code to change by 6KB.


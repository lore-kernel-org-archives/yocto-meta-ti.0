Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0DE2E00950; Tue, 16 Oct 2018 11:38:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90B38E006AF
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 11:38:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9GIcT6l091261;
	Tue, 16 Oct 2018 13:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539715109;
	bh=p6gLUqMRQ00WiSOVBiXuwPtY+iXFoZrLfzjfKe2t+CQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dCMdZQv9bmjVqB5tZhmfNZrmQ+MCoeBdVZVvh0r9VeC6RXeD70aYq3vbt8CKviiqG
	JeHK4+Lim5sxkxc07Ie4a8c2arbrPMdyXem9EXEpuMGlgpb868a1RI3/BMP/tUqv4/
	riwRiKOZnEIDIXfn/+pzPk46fxDyUljesxdpUAog=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9GIcT1k032115;
	Tue, 16 Oct 2018 13:38:29 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 16 Oct 2018 13:38:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 16 Oct 2018 13:38:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9GIcT6e010896;
	Tue, 16 Oct 2018 13:38:29 -0500
Date: Tue, 16 Oct 2018 14:38:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181016183828.GK14250@beryl>
References: <1539399036-6199-1-git-send-email-denys@ti.com>
	<CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
	<20181014192417.GB20670@beryl>
	<CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
	<20181016164210.GI1032@bill-the-cat>
	<CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
	<20181016182859.GI14250@beryl>
MIME-Version: 1.0
In-Reply-To: <20181016182859.GI14250@beryl>
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
X-List-Received-Date: Tue, 16 Oct 2018 18:38:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 16, 2018 at 02:29:00PM -0400, Denys Dmytriyenko wrote:
> On Tue, Oct 16, 2018 at 11:11:36AM -0700, Khem Raj wrote:
> > On Tue, Oct 16, 2018 at 9:42 AM Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj wrote:
> > > > On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > >
> > > > > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> > > > > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > > > >
> > > > > > > There have been reports recently that am335x_beaglebone_config generates bad SPL.
> > > > > > > Until that is debugged and fixed, use generic am335x_evm_config that covers all
> > > > > > > AM335x platforms, including BeagleBone variants.
> > > > > > >
> > > > > >
> > > > > > it fails to link
> > > > > >
> > > > > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
> > > > > > fit in region `.sram'
> > > > > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> > > > > > | make[2]: *** [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-staging/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
> > > > > > spl/u-boot-spl] Error 1
> > > > >
> > > > > FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from oe-core, as well as
> > > > > Linaro gcc7 - no problems.
> > > >
> > > > My distro inherits poky policies, and on master it now inherits
> > > > hardening policies ( security flags) by defaults
> > > > do you happen to test poky ?
> > >
> > > I think we want to take a look at which of the security flags really
> > > make sense to use in this context.  Thanks!
> > >
> > 
> > there could be more to it, since the distro uses thumb2 ISA by
> > default, I am not sure
> > if u-boot overrides that and builds using arm mode ISA always but
> > something to consider, I saw several reports about u-boot overflowing
> > sram sections and most of
> > the solutions were "oh it works for me" or at the best your toolchain
> > is different then mine. here is mine use it and move on.
> 
> Khem,
> 
> Well, FWIW, Tom and I are very familiar with this issue. As a matter of fact, 
> I first encountered it almost 2 years ago and had to prove there's such an 
> issue, because everyone was saying it works for them, something must be wrong 
> with my OE builds... :)
> 
> While .sram region is very limited, the issue is exacerbated by the fact that 
> all debug symbols from macros like __FILE__ are ended up in that section as 
> well. So, the longer your build path, the larger the section becomes. Once I 
> had instructions to reproduce the failure here internally with a series of 
> long-named nested directories like aaaaaa and bbbbbb, Nishanth started this 
> thread on U-boot mailing list:
> https://lists.denx.de/pipermail/u-boot/2017-March/285031.html
> 
> We've had the corresponding bug open internally all this time, while adding 
> workarounds to limit .sram section size by other means, like disabling some 
> options to reduce the code size. Your patch is one of those workarounds...
> 
> But we've been patiently waiting for the following feature to come into gcc to 
> fix the issue properly:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70268
> 
> Since it's now part of gcc8, we should be able to use it. Not sure how to keep 
> gcc7 backward compatibility though...

BTW, there were few attempts to "fix" it in U-boot as well, such as [1], but I 
don't believe they got accepted. Tom?

[1] https://patchwork.ozlabs.org/cover/825356/

-- 
Denys


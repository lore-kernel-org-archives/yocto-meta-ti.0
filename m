Return-Path: <trini@konsulko.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3EA29E00BC4; Tue, 16 Oct 2018 19:55:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B593E00B9F
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 19:55:21 -0700 (PDT)
Received: by mail-qt1-f194.google.com with SMTP id o17-v6so28425487qtr.1
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 19:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=XvZqAGe0yJZj5HyDIfZ4Q6RizQP1tltsUZrh4TVjMTY=;
	b=KEr3oeVPc7eCP139FUBlRU785Wjvl8RzaDdzAEibbHTctiPk9jtqGDf8eNpQtELv/A
	z8VKpngcXsllwVL4VlXguioU9uVnu5ku4g1z6N0r6w5bLpZFoSzYKsk3ZZ16qIlgJsV6
	LCcDe7FrF9CYYC9IRbW1v4P42rjyKL+c2r+vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=XvZqAGe0yJZj5HyDIfZ4Q6RizQP1tltsUZrh4TVjMTY=;
	b=fn31DTExNW8cy/yQX1x9iuyXtXcf61Wl7WK55TdjUwCvHEd1KppUJD7XZHbVqVTK5o
	OnEmM3e7XKislK80ex/XJeyXA7e58TQ30nA9HzwpqEzLifgrxM3Woq6Iy6V6zseVxUZU
	VLyD7cALe+91dRjpYiOdwFc/w8WLn9uMRk+tf8YTWbCbDN09g2LsgOnenIygH9Bbal9k
	3+NLyQcCSAgMaljWftnS0iVZaMcMwls9oH1zRMhIPSaKMSw3cBg+kUJMqLcF6vI2MQDL
	BwCbgAhUEu1zA1as3tbRK0Q3FR9eCK6gWYSuWbS+W/+Q58jtcO0nGcn7SHSTAP+epOfL
	fhRQ==
X-Gm-Message-State: ABuFfog+Tm+v7d2AwuzWOCGo/t5u7AojT+nfiL/YdPPnhY2avXyZziYE
	yUWziCknh7nEl/gLO/zy+Mhq4g==
X-Google-Smtp-Source: ACcGV62yquy2pF1PhDWJsB19Jn1vswPNHrs55dxPiGmQkpRDgvWTZ7wS6cLq4hPq8LKAxDIBqwAMBQ==
X-Received: by 2002:ac8:83a:: with SMTP id
	u55-v6mr22968533qth.48.1539744920394; 
	Tue, 16 Oct 2018 19:55:20 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
	by smtp.gmail.com with ESMTPSA id
	c43-v6sm11624389qte.12.2018.10.16.19.55.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 19:55:19 -0700 (PDT)
Date: Tue, 16 Oct 2018 22:55:17 -0400
From: Tom Rini <trini@konsulko.com>
To: yamada.masahiro@socionext.com
Message-ID: <20181017025517.GR1032@bill-the-cat>
References: <1539399036-6199-1-git-send-email-denys@ti.com>
	<CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
	<20181014192417.GB20670@beryl>
	<CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
	<20181016164210.GI1032@bill-the-cat>
	<CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
	<20181016182859.GI14250@beryl> <20181016183828.GK14250@beryl>
	<20181016185925.GO1032@bill-the-cat>
	<9e7016817d464dd8bfb1210b8e9e6cf5@SOC-EX01V.e01.socionext.com>
MIME-Version: 1.0
In-Reply-To: <9e7016817d464dd8bfb1210b8e9e6cf5@SOC-EX01V.e01.socionext.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Wed, 17 Oct 2018 02:55:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 17, 2018 at 02:39:15AM +0000, yamada.masahiro@socionext.com wrote:

> Hi.
> 
> > -----Original Message-----
> > From: Tom Rini [mailto:trini@konsulko.com]
> > Sent: Wednesday, October 17, 2018 3:59 AM
> > To: Denys Dmytriyenko <denys@ti.com>; Yamada, Masahiro/山田 真弘
> > <yamada.masahiro@socionext.com>
> > Cc: Khem Raj <raj.khem@gmail.com>; meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] beaglebone.conf: temporarily use generic
> > am335x_evm_config for U-boot
> > 
> > On Tue, Oct 16, 2018 at 02:38:28PM -0400, Denys Dmytriyenko wrote:
> > > On Tue, Oct 16, 2018 at 02:29:00PM -0400, Denys Dmytriyenko wrote:
> > > > On Tue, Oct 16, 2018 at 11:11:36AM -0700, Khem Raj wrote:
> > > > > On Tue, Oct 16, 2018 at 9:42 AM Tom Rini <trini@konsulko.com> wrote:
> > > > > >
> > > > > > On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj wrote:
> > > > > > > On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <denys@ti.com>
> > wrote:
> > > > > > > >
> > > > > > > > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> > > > > > > > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <denys@ti.com>
> > wrote:
> > > > > > > > > >
> > > > > > > > > > There have been reports recently that am335x_beaglebone_config
> > generates bad SPL.
> > > > > > > > > > Until that is debugged and fixed, use generic am335x_evm_config
> > that covers all
> > > > > > > > > > AM335x platforms, including BeagleBone variants.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > it fails to link
> > > > > > > > >
> > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata'
> > will not
> > > > > > > > > fit in region `.sram'
> > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed
> > by 5772 bytes
> > > > > > > > > | make[2]: ***
> > [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-stag
> > ing/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
> > > > > > > > > spl/u-boot-spl] Error 1
> > > > > > > >
> > > > > > > > FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from oe-core,
> > as well as
> > > > > > > > Linaro gcc7 - no problems.
> > > > > > >
> > > > > > > My distro inherits poky policies, and on master it now inherits
> > > > > > > hardening policies ( security flags) by defaults
> > > > > > > do you happen to test poky ?
> > > > > >
> > > > > > I think we want to take a look at which of the security flags really
> > > > > > make sense to use in this context.  Thanks!
> > > > > >
> > > > >
> > > > > there could be more to it, since the distro uses thumb2 ISA by
> > > > > default, I am not sure
> > > > > if u-boot overrides that and builds using arm mode ISA always but
> > > > > something to consider, I saw several reports about u-boot overflowing
> > > > > sram sections and most of
> > > > > the solutions were "oh it works for me" or at the best your toolchain
> > > > > is different then mine. here is mine use it and move on.
> > > >
> > > > Khem,
> > > >
> > > > Well, FWIW, Tom and I are very familiar with this issue. As a matter
> > of fact,
> > > > I first encountered it almost 2 years ago and had to prove there's such
> > an
> > > > issue, because everyone was saying it works for them, something must
> > be wrong
> > > > with my OE builds... :)
> > > >
> > > > While .sram region is very limited, the issue is exacerbated by the
> > fact that
> > > > all debug symbols from macros like __FILE__ are ended up in that section
> > as
> > > > well. So, the longer your build path, the larger the section becomes.
> > Once I
> > > > had instructions to reproduce the failure here internally with a series
> > of
> > > > long-named nested directories like aaaaaa and bbbbbb, Nishanth started
> > this
> > > > thread on U-boot mailing list:
> > > > https://lists.denx.de/pipermail/u-boot/2017-March/285031.html
> > > >
> > > > We've had the corresponding bug open internally all this time, while
> > adding
> > > > workarounds to limit .sram section size by other means, like disabling
> > some
> > > > options to reduce the code size. Your patch is one of those workarounds...
> > > >
> > > > But we've been patiently waiting for the following feature to come into
> > gcc to
> > > > fix the issue properly:
> > > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70268
> > > >
> > > > Since it's now part of gcc8, we should be able to use it. Not sure how
> > to keep
> > > > gcc7 backward compatibility though...
> > >
> > > BTW, there were few attempts to "fix" it in U-boot as well, such as [1],
> > but I
> > > don't believe they got accepted. Tom?
> > >
> > > [1] https://patchwork.ozlabs.org/cover/825356/
> > 
> > I think the end result was waiting on the kernel community to agree on a
> > path forward for Kbuild and then bring that back.
> 
> 
> 
> U-Boot now supports -fmacro-prefix-map, so GCC 8 is OK.
> (see commit 1eb2e71ed)
> 
> For GCC 7 or older, sorry, I have no idea what to do.
> My patch set [1] was an ugly hack,
> and wrong in the first place.
> 
> What I can suggest is, please use GCC 8.

Ah yes, thanks!

-- 
Tom


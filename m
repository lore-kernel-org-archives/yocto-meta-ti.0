Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D06DE00950; Tue, 16 Oct 2018 11:11:53 -0700 (PDT)
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
	*      [209.85.160.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB5D5E006AF
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 11:11:52 -0700 (PDT)
Received: by mail-qt1-f193.google.com with SMTP id j46-v6so26858149qtc.9
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 11:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6wMxngDK2hWjMCtV+aOFifBZqtrn2mDqiWFKAnKItFE=;
	b=uyAcdOHEpEWNhhEgyNYsv9jVqay8XKDGK/Ef7jzmujJ7fuoSXISK4r8wRJqY7+ngmD
	77o0B2ZpPinvNuuul5wt9GkQoCLNujuUc50qW49gIOsYlmg4L+IkoGcw86LoS0kdW7Rk
	0CmceQjJxyqj8138BDx+agcPGXioiRFS6QBrKnzbvctAcctfHlcIgiaTVHtohBL5zfIj
	WLWnj7COjcZcaaIfAICR3ILynsxSuVBJAl2i/0KbcmdoL5cb5KO60aiVfwmTb4RomKIf
	oi3wHgaL6FKYUrTDO3JIhLnDX+BOh+E99ZGVEOMgl/XG+wxasNOm6wjBSUbu4IlG4M2P
	pnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6wMxngDK2hWjMCtV+aOFifBZqtrn2mDqiWFKAnKItFE=;
	b=murRdav028NlfpyGgsBaax0ExPk9xhLThilEwF4N2wWnEosyn6YyOskeIvLfToIgeL
	SV+r4Gi5oJiHq9pqsQGi6oPhHUAnBok5C1SisbBL4LLFEchB29nG506YuHcrXUJ0dhk4
	7Imu1ilMuQOLcEm/Y95OKI1wuWvo/Ute1aL+InkvJGuj+cF9lQ/6d5lE6NB1rPGDIjPj
	XhZuzTcQ06rCcWLa/OEVPHZMxRm5/fz2wT/T9/NROAI+TxWc7u+hOaRfqfD7TtxduhGN
	8skxrYq0jfGvv1Xa04IB2CGsF8kgeEwrqWRXdeabnOrdICZMsUQRLX8AAJ+DDf/why+1
	vRwA==
X-Gm-Message-State: ABuFfojtnwxCslT7eiG1F1tkJsKUgv9wxt/RAC2W9texHqfC5XqsVrYg
	GuB2Nt+brYp5f/VEHhz5bPxjFd28La79eIw0mjE=
X-Google-Smtp-Source: ACcGV63c0MUTmOsdQ+RMLsh7I1fJ9pqsgE8S0l5SBKA0lrVCX7FT8Y5S1qLNBhDNQe+2JYDeIsgKF/vycwUO7XUNv8Y=
X-Received: by 2002:ac8:689a:: with SMTP id
	m26-v6mr21091066qtq.254.1539713511791; 
	Tue, 16 Oct 2018 11:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <1539399036-6199-1-git-send-email-denys@ti.com>
	<CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
	<20181014192417.GB20670@beryl>
	<CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
	<20181016164210.GI1032@bill-the-cat>
In-Reply-To: <20181016164210.GI1032@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Oct 2018 11:11:36 -0700
Message-ID: <CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
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
X-List-Received-Date: Tue, 16 Oct 2018 18:11:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 16, 2018 at 9:42 AM Tom Rini <trini@konsulko.com> wrote:
>
> On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj wrote:
> > On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> > > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > >
> > > > > There have been reports recently that am335x_beaglebone_config generates bad SPL.
> > > > > Until that is debugged and fixed, use generic am335x_evm_config that covers all
> > > > > AM335x platforms, including BeagleBone variants.
> > > > >
> > > >
> > > > it fails to link
> > > >
> > > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
> > > > fit in region `.sram'
> > > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> > > > | make[2]: *** [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-staging/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
> > > > spl/u-boot-spl] Error 1
> > >
> > > FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from oe-core, as well as
> > > Linaro gcc7 - no problems.
> >
> > My distro inherits poky policies, and on master it now inherits
> > hardening policies ( security flags) by defaults
> > do you happen to test poky ?
>
> I think we want to take a look at which of the security flags really
> make sense to use in this context.  Thanks!
>

there could be more to it, since the distro uses thumb2 ISA by
default, I am not sure
if u-boot overrides that and builds using arm mode ISA always but
something to consider, I saw several reports about u-boot overflowing
sram sections and most of
the solutions were "oh it works for me" or at the best your toolchain
is different then mine. here is mine use it and move on.

> --
> Tom


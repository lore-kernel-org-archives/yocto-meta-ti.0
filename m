Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28C1BE00B45; Tue, 16 Oct 2018 00:51:24 -0700 (PDT)
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
	*      [209.85.222.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2158E00AC5
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 00:51:22 -0700 (PDT)
Received: by mail-qk1-f193.google.com with SMTP id x8-v6so13537789qka.4
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 00:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZfVq2IV+esSh6K78YLihsv8Pz9IjysYWV4hvYw+PPJs=;
	b=lMNb4qxa0P/8k7Pu+nJ6rgCHSKrCVy8U0HxG2N6eyUrBGkjP0uV0k5VC6smkCaeLtt
	wH/p4YArV4Lm33nA0JTIoGpp5YZeC/2UENtL+QaoqQ400VqPc7u5jOJIh7WBDgC3pcGx
	XoJjJkwTEqkgyQDx5LmYsOdCHKiQTxXDNxtT95qUCh16EqRvn57YPX3nwRvpgbksLYX3
	HDpWzI8sBz+mdhSLWsAg5FgXgu3Qah5di8heaJiI5pcVTv0X0lKhkdn5jbP5iGazeQbC
	bboIXRaI99FRqvCy6HeQb6IUh92UCTnoKXKl7jmEhOS/+VB3gkkAyF+Y19OTiVdQ2K6F
	fCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZfVq2IV+esSh6K78YLihsv8Pz9IjysYWV4hvYw+PPJs=;
	b=jbE/qkrEiqrpbRKbekKrZhL2xhhUZvdA+E61R/zaSV2Chj4uYMQBKBfpZa/1nD6mUp
	F/HTH6T9c3MhReEIChWzxJTYFoVpcpPH+VP0V+dJb7dcEoX1kO6FFMUtJENR1mnoMstw
	vYHpYsHKvXRTr9kvk4BhoShprKEv2/AMUm/kXQeja8cZHHW/A4ht8Tk41z8oblSLQGON
	igJf6qwLbIYKrwRBWfhbd8ICYNqMgb71VyJU5+D8s9SI+Lx3t78DHzK31rmiNLCmdOvt
	CTCmVAadVPzrnDlivNU2AyycNigrYn5XAnVqbm2JhSEHY+pbj93j1Y5WmH5S73Z0T47B
	/eZw==
X-Gm-Message-State: ABuFfojI0r8wFqJwHsPgzBTS/RpxvpwierrpnmEO1sHi88w6blU3frGT
	7PK4WOVp1wP0RUXY8ilZPjGdc3B+JW10rGYR5NA=
X-Google-Smtp-Source: ACcGV626bDA8g0eRW/c1zqrp9rDsWNls1gBZVHn3MJZL/X5iAaOKRWom7ARuFy4byzLCED77Ce1QGqFrc3+k3fhNbhE=
X-Received: by 2002:a37:31cf:: with SMTP id
	x198-v6mr19085588qkx.206.1539676281589; 
	Tue, 16 Oct 2018 00:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <1539399036-6199-1-git-send-email-denys@ti.com>
	<CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
	<20181014192417.GB20670@beryl>
	<CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
In-Reply-To: <CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Oct 2018 00:50:55 -0700
Message-ID: <CAMKF1sqsnk98_qnR__jQVd97S+JR46f_aw5L2B29uUDZgJ6DtQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Tue, 16 Oct 2018 07:51:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 14, 2018 at 10:07 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > >
> > > > There have been reports recently that am335x_beaglebone_config generates bad SPL.
> > > > Until that is debugged and fixed, use generic am335x_evm_config that covers all
> > > > AM335x platforms, including BeagleBone variants.
> > > >
> > >
> > > it fails to link
> > >
> > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
> > > fit in region `.sram'
> > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> > > | make[2]: *** [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-staging/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
> > > spl/u-boot-spl] Error 1
> >
> > FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from oe-core, as well as
> > Linaro gcc7 - no problems.
>
> My distro inherits poky policies, and on master it now inherits
> hardening policies ( security flags) by defaults
> do you happen to test poky ?

It seems I am not alone, there has been other reports of similar
issues and some combos work some dont
I have ported this patch

http://e2e.ti.com/support/processors/f/791/t/733651?PROCESSOR-SDK-AM335X-MLO-and-U-boot-issues-u-boot-spl-section-rodata-will-not-fit-in-region-sram-

and now my build problems are gone,

Added couple of other patches on top for beaglebone, and now I can
boot bbb using meta-ti BSP


> >
> >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  conf/machine/beaglebone.conf | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> > > > index 49edfd6..2514792 100644
> > > > --- a/conf/machine/beaglebone.conf
> > > > +++ b/conf/machine/beaglebone.conf
> > > > @@ -13,7 +13,8 @@ MACHINE_GUI_CLASS = "bigscreen"
> > > >
> > > >  SERIAL_CONSOLE = "115200 ttyS0"
> > > >
> > > > -UBOOT_MACHINE = "am335x_boneblack_config"
> > > > +# fall back on generic am335x_evm_config for now
> > > > +#UBOOT_MACHINE = "am335x_boneblack_config"
> > > >
> > > >  WKS_FILE = "sdimage-bootpart.wks"
> > > >  IMAGE_BOOT_FILES = "MLO u-boot.img"
> > > > --
> > > > 2.7.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti


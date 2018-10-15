Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BADFAE008E3; Sun, 14 Oct 2018 22:08:12 -0700 (PDT)
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
	*      [209.85.160.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28D57E008D0
	for <meta-ti@yoctoproject.org>; Sun, 14 Oct 2018 22:08:12 -0700 (PDT)
Received: by mail-qt1-f194.google.com with SMTP id c56-v6so20132836qtd.11
	for <meta-ti@yoctoproject.org>; Sun, 14 Oct 2018 22:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PmUF3mvnphVrZZdckZIjb0vRysBMXYGxSOZGb+Zs5fQ=;
	b=eovO282Li4AKptusyAC1IdoE2g879FId7rNHT21tYATSYTs2m2QR0ybESSnZfJWdZ8
	LGe0fL3TGR2QrS8wFQjYVzFpCuLtiO1w0ndMVQJmvwseBY7u/IOj6XCXiEhy0vvx9BbE
	kHFU0TMUmOUGO4hBX0lLDvewwjQ3nWxifbdcLxDd7Ub1zN2VQ4adHSA8/iuh9aJwdyzN
	7dqpbGQw+T1+9VUDBpMeAbV85j5b2IkBPemb9jEE4Qsz+WyI0d1Bu698AxerqTvhOsgJ
	UAhQJ0N20yQ1pSI/HEDAiV6nyxXPfp0o322B/+Tfu6MbzK1nP2xQ0zYe8zjpIyLnX/Di
	sLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PmUF3mvnphVrZZdckZIjb0vRysBMXYGxSOZGb+Zs5fQ=;
	b=mO5GeSMypr+pnAJAIbf05RZl9G5Hw5T/PfWCZx+lBWSrKhWbb6hpAcqqBAUA2sY/Xh
	fwqTmHwxnIPhXnvg43blnGCxaiCw/4F3DuhD/+iAE//r0mSWZIYqHRBsKFkZPOy3swF1
	LxwFw6r6zKY4DdRywVowai/OHgl1khsuzCAdKMrDZOnifA6nhDC0sQSJLrhuWvz9FlAr
	ImzxRWSfUbAvb4Ml1Ko+9jYGUrnbFg40nBjVBRYheMTiVWrua3/ZNa1xYzgYfb1GJwmD
	SpUDu5i/EaDL/URm7524Rz/w9CE6L8HoCbWClzDIB8saKN3uUSJH6+vwVqgeBWU8fDD5
	Nm7g==
X-Gm-Message-State: ABuFfogdVC+L/y28QeLu+JLrsf47qAzgDNwFF5/ROu9qx0XNGTJvGatC
	iHyn0OAWi4j0K+4ABsddVLIwdG0qONtjZTZqlP4=
X-Google-Smtp-Source: ACcGV62ABK6yJEL4/r7i7YYM/+4vsrSKJ7bHO4aMfTzSoYHBqBUkNx2oGOuygzOOEcKMdW3KsG41eD7F8Ctj0XE/rf4=
X-Received: by 2002:aed:3eac:: with SMTP id
	n41-v6mr14585544qtf.196.1539580091289; 
	Sun, 14 Oct 2018 22:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <1539399036-6199-1-git-send-email-denys@ti.com>
	<CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
	<20181014192417.GB20670@beryl>
In-Reply-To: <20181014192417.GB20670@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Oct 2018 22:07:45 -0700
Message-ID: <CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
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
X-List-Received-Date: Mon, 15 Oct 2018 05:08:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > There have been reports recently that am335x_beaglebone_config generates bad SPL.
> > > Until that is debugged and fixed, use generic am335x_evm_config that covers all
> > > AM335x platforms, including BeagleBone variants.
> > >
> >
> > it fails to link
> >
> > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
> > fit in region `.sram'
> > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> > | make[2]: *** [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-staging/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
> > spl/u-boot-spl] Error 1
>
> FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from oe-core, as well as
> Linaro gcc7 - no problems.

My distro inherits poky policies, and on master it now inherits
hardening policies ( security flags) by defaults
do you happen to test poky ?
>
>
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  conf/machine/beaglebone.conf | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> > > index 49edfd6..2514792 100644
> > > --- a/conf/machine/beaglebone.conf
> > > +++ b/conf/machine/beaglebone.conf
> > > @@ -13,7 +13,8 @@ MACHINE_GUI_CLASS = "bigscreen"
> > >
> > >  SERIAL_CONSOLE = "115200 ttyS0"
> > >
> > > -UBOOT_MACHINE = "am335x_boneblack_config"
> > > +# fall back on generic am335x_evm_config for now
> > > +#UBOOT_MACHINE = "am335x_boneblack_config"
> > >
> > >  WKS_FILE = "sdimage-bootpart.wks"
> > >  IMAGE_BOOT_FILES = "MLO u-boot.img"
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti


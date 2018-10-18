Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 10A1BE00BD2; Wed, 17 Oct 2018 20:39:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38470E00B5E
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 20:39:19 -0700 (PDT)
Received: by mail-qk1-f193.google.com with SMTP id m142-v6so115306qke.3
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 20:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mowSiV5dMR3aCaxMa3dbKBwFJf9qmciCb/5NxlpMmgo=;
	b=mUVER7dU8UpBU0djDoTekCgE1sc+ZPXB6MZwwIRS2Mu+Gnawi6Fy4qyN7/Kt4tw0TH
	6Lk+xfha/J7VvQS1tDbxX4XHD0ksHg9RZFBSrHKEAYhxvNpaiATHNuSP8BGibh3t9Xim
	4AQxYRkENHRdyRkJuYTdrtPNMLQln7vaM5rDwDS1IaR+nzCyi4tq1WxhGsGf2OTTmToK
	PdBFvAmU0fLthZ266I2Wm1zup+u+Nv+jmpl0upgRud1tTrrm7dDyhjl2weY9/paQ94vG
	Q/x8Sl6kkiidlhx+Cr7rVJX/5cIRBECpTCLDRWqkmOCgs3cXuzKuF5zTcEACok0lOerF
	Q1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mowSiV5dMR3aCaxMa3dbKBwFJf9qmciCb/5NxlpMmgo=;
	b=poRrcosiM/2iVQAVEVl/5khbRcsLbfxzabxMxqPYD+olrzLtiFanD/6Tp1aT9aDGVC
	LKkVHXdyLAOyTJOuNuB+qSMxMDOMwuzMpH1vh3ErOM+KfnXOI8iPCYqRtaJVGY+NaUjV
	OA5p2GZHiEDw08ZEeQo6Md/ofo+9HFGXo0Y86OU+s0YLZVIaLQkzDekI4I8OECBB6pvz
	M/fLktVdfr3DBc7BYGgUaWiWkikWn4bfi7RmdbkjJbBf6uoX2Ujiqm4pmROocqjWO6nq
	/8klWiwUjsiHKH9uPQ8IZM4uSSUdlBbWXaAJcqWyXvdJJJqTDvB1eq3FQPynjRolQ2qa
	ASvA==
X-Gm-Message-State: ABuFfojdGh9ajdbxFV0iaX6LiGzw+tSFcBgOm3KOrqmY4SJn8vlxGn57
	GlTm2EYrWGk1rPypQ5+xSAAMyY4K4yGk0olLUv0=
X-Google-Smtp-Source: ACcGV62b99AbGJgasdEN1UfikQCKQsfkyvdrrH9EHdExsAB5Dwt+pgxIclszMdrXMlY7Dzgns7xrjLiYUHAUxM0Zxdw=
X-Received: by 2002:ae9:f408:: with SMTP id y8-v6mr28175407qkl.2.1539833958259;
	Wed, 17 Oct 2018 20:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <1539824658-36380-1-git-send-email-denys@ti.com>
	<CAMKF1sosj4dN63ZY=AkZ4xkETeCcfPZATpN3OGHPwifSwS0-Zw@mail.gmail.com>
	<20181018024506.GR4031@beryl>
In-Reply-To: <20181018024506.GR4031@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Oct 2018 20:38:52 -0700
Message-ID: <CAMKF1spkvi+SUqvO=LXhM3yk0x9qk0yq9ZCe0JpH_mB7puoAig@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [master][PATCH] ti-gc320-driver: workaround for gcc8 stringop-overflow error
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
X-List-Received-Date: Thu, 18 Oct 2018 03:39:20 -0000
Content-Type: text/plain; charset="UTF-8"

Ok, no problem. share errors may be I can help otherwise we do have workaround
On Wed, Oct 17, 2018 at 7:45 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Wed, Oct 17, 2018 at 06:53:50PM -0700, Khem Raj wrote:
> > On Wed, Oct 17, 2018 at 6:04 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  ...build-bypass-gcc8-stringop-overflow-error.patch | 26 ++++++++++++++++++++++
> > >  .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb     |  4 +++-
> > >  2 files changed, 29 insertions(+), 1 deletion(-)
> > >  create mode 100644 recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch
> > >
> > > diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch b/recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch
> > > new file mode 100644
> > > index 0000000..431afa7
> > > --- /dev/null
> > > +++ b/recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch
> > > @@ -0,0 +1,26 @@
> > > +From c93a4217425ffebae1fb2d5c6c7fc957eb8aa18c Mon Sep 17 00:00:00 2001
> > > +From: Denys Dmytriyenko <denys@ti.com>
> > > +Date: Tue, 16 Oct 2018 21:16:48 -0400
> > > +Subject: [PATCH] Kbuild: bypass gcc8 stringop-overflow error
> > > +
> > > +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > +---
> > > + src/Kbuild | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/src/Kbuild b/src/Kbuild
> > > +index 574a107..df4368d 100755
> > > +--- a/src/Kbuild
> > > ++++ b/src/Kbuild
> > > +@@ -87,7 +87,7 @@ MODULE_NAME ?= galcore
> > > + CUSTOMER_ALLOCATOR_OBJS    ?=
> > > + ALLOCATOR_ARRAY_H_LOCATION ?= $(OS_KERNEL_DIR)/allocator/default/
> > > +
> > > +-EXTRA_CFLAGS += -Werror
> > > ++EXTRA_CFLAGS += -Werror -Wno-stringop-overflow
> > > +
> >
> > while its clear you are marking it as workaround, but this may be one
> > time when you can also fix it and it might be showing you a latent
> > issue that went unoticed in past unless you ran static analysers on
> > this code. So are
> > there many errors ? then the workaround might be ok. Otherwise may be
> > fixing the underlying cause might be a good option.
>
> Yes, I realize that. I tried fixing it, but since I'm not really familiar
> with this code, I wasn't sure about one place and decided to leave to the
> corresponding team to fix properly. For now I just needed to unbreak it.
>
>
> > > + OBJS := $(OS_KERNEL_DIR)/gc_hal_kernel_device.o \
> > > +         $(OS_KERNEL_DIR)/gc_hal_kernel_linux.o \
> > > +--
> > > +2.7.4
> > > +
> > > diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > > index 94485b6..e49a41f 100644
> > > --- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > > +++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > > @@ -13,7 +13,9 @@ BRANCH = "ti-${PV}-k4.14"
> > >
> > >  SRCREV = "a36799d9329efcfff19e30e690156d5ebf7e0c55"
> > >
> > > -SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
> > > +SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH} \
> > > +       file://0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch;striplevel=2"
> > > +
> > >  S = "${WORKDIR}/git/src"
> > >
> > >  EXTRA_OEMAKE += "-f Kbuild AQROOT=${S} KERNEL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PATH=${TOOLCHAIN_PATH} CROSS_COMPILE=${TARGET_PREFIX} ARCH_TYPE=${TARGET_ARCH}"
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti


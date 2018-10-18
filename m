Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD3C5E00BD2; Wed, 17 Oct 2018 19:45:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82E08E00B5E
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 19:45:10 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9I2j9P6037478;
	Wed, 17 Oct 2018 21:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539830709;
	bh=4clyKSRwdPshPtNnD3oFeTJpxx57dZD2yqHyQBeMvrA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Nmq3Ai1NGAhmf5af1O0oHGozu3pjLgghZYSHzX8gjavMufBSfqB5zonzGzLeHOIHm
	a2IRfF+kCU5aHmGNULn0DxhBAE3dGzVKpP5iuaS9EpYLrQWtYMnu7lUvWb4Isyvhek
	rgpOlOin4lixtilBPr0tGWIdRr0+UY3Fot/ECIdY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9I2j97v003859;
	Wed, 17 Oct 2018 21:45:09 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 17 Oct 2018 21:45:07 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 17 Oct 2018 21:45:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9I2j7bV004539;
	Wed, 17 Oct 2018 21:45:07 -0500
Date: Wed, 17 Oct 2018 22:45:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181018024506.GR4031@beryl>
References: <1539824658-36380-1-git-send-email-denys@ti.com>
	<CAMKF1sosj4dN63ZY=AkZ4xkETeCcfPZATpN3OGHPwifSwS0-Zw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sosj4dN63ZY=AkZ4xkETeCcfPZATpN3OGHPwifSwS0-Zw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Thu, 18 Oct 2018 02:45:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 17, 2018 at 06:53:50PM -0700, Khem Raj wrote:
> On Wed, Oct 17, 2018 at 6:04 PM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  ...build-bypass-gcc8-stringop-overflow-error.patch | 26 ++++++++++++++++++++++
> >  .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb     |  4 +++-
> >  2 files changed, 29 insertions(+), 1 deletion(-)
> >  create mode 100644 recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch
> >
> > diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch b/recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch
> > new file mode 100644
> > index 0000000..431afa7
> > --- /dev/null
> > +++ b/recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch
> > @@ -0,0 +1,26 @@
> > +From c93a4217425ffebae1fb2d5c6c7fc957eb8aa18c Mon Sep 17 00:00:00 2001
> > +From: Denys Dmytriyenko <denys@ti.com>
> > +Date: Tue, 16 Oct 2018 21:16:48 -0400
> > +Subject: [PATCH] Kbuild: bypass gcc8 stringop-overflow error
> > +
> > +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > +---
> > + src/Kbuild | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/Kbuild b/src/Kbuild
> > +index 574a107..df4368d 100755
> > +--- a/src/Kbuild
> > ++++ b/src/Kbuild
> > +@@ -87,7 +87,7 @@ MODULE_NAME ?= galcore
> > + CUSTOMER_ALLOCATOR_OBJS    ?=
> > + ALLOCATOR_ARRAY_H_LOCATION ?= $(OS_KERNEL_DIR)/allocator/default/
> > +
> > +-EXTRA_CFLAGS += -Werror
> > ++EXTRA_CFLAGS += -Werror -Wno-stringop-overflow
> > +
> 
> while its clear you are marking it as workaround, but this may be one
> time when you can also fix it and it might be showing you a latent
> issue that went unoticed in past unless you ran static analysers on
> this code. So are
> there many errors ? then the workaround might be ok. Otherwise may be
> fixing the underlying cause might be a good option.

Yes, I realize that. I tried fixing it, but since I'm not really familiar 
with this code, I wasn't sure about one place and decided to leave to the 
corresponding team to fix properly. For now I just needed to unbreak it.


> > + OBJS := $(OS_KERNEL_DIR)/gc_hal_kernel_device.o \
> > +         $(OS_KERNEL_DIR)/gc_hal_kernel_linux.o \
> > +--
> > +2.7.4
> > +
> > diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > index 94485b6..e49a41f 100644
> > --- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > +++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > @@ -13,7 +13,9 @@ BRANCH = "ti-${PV}-k4.14"
> >
> >  SRCREV = "a36799d9329efcfff19e30e690156d5ebf7e0c55"
> >
> > -SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
> > +SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH} \
> > +       file://0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch;striplevel=2"
> > +
> >  S = "${WORKDIR}/git/src"
> >
> >  EXTRA_OEMAKE += "-f Kbuild AQROOT=${S} KERNEL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PATH=${TOOLCHAIN_PATH} CROSS_COMPILE=${TARGET_PREFIX} ARCH_TYPE=${TARGET_ARCH}"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


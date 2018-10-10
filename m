Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 480D2E00A94; Wed, 10 Oct 2018 12:57:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB8EAE003D9
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2018 12:57:17 -0700 (PDT)
Received: by mail-qt1-f194.google.com with SMTP id e22-v6so7195184qto.6
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2018 12:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3HyRUUX1tnAMzoVG02N3GvkiyhejCA486w+BXdQSdt8=;
	b=lfaaAeAWQJS1mGuP9qAZ4nfAqvMBzfqzK5i+99S4TMj95v9ksltx5mBtr+4CoDgpnt
	0qyPofwugg6W3SkjH5x+PZtZPDoA4U9WcBREvgOYYtgY3eGuhi/e4dQHZeP+UgS5yJfR
	mSJdLy+AUEw5WPio9vHOUKj55aBJUFKEavUgzGnChIaXDc5XWKAvb3aoSkANp6cMYDon
	2iNICOqoZBWF9gG1ViuEdrglhrh9XGNvzjmYO1KY7IYiUL1pHc4HR8cDmUPRCJDR2/P1
	FlL1CwTylkXxBhzJe/MQIBriUJUwPIGF0G7Pnjfe22zTRUWYnepjvLOz/plpvPWcqxqK
	fAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3HyRUUX1tnAMzoVG02N3GvkiyhejCA486w+BXdQSdt8=;
	b=VMVJ9cE9xUpqHNnSLGEU/a4U7BQGMv4WnzdQd+rqxMVxianwgXnFO3bZNw7tvdjoMF
	+xNzv/UysQ1C5bL1E8pUfkkjtRBLV50EHKisD5jGAQieRyzGi12TKDWaZMoDf7OOkuvX
	pBxtPRyb3ShamjFl8MGt7h4K+ReISplfwbXDnJWLJ+JOWA/AydPBSxdb3nnqpMhcjsAj
	iE8tAyCx+RqB8cEJKabc0jfwKhGVZRV5h4Tt6TzLYK920v89OFge+RJ5+v8IbwQ0O2fU
	gQTdhqD/Pif8D2cbR0DbBEbDg3UFDv1MTTJ730ZyHuumh/2vvdS5BLpSmwnC2zWFlq2Q
	K70w==
X-Gm-Message-State: ABuFfojwe+W85a5NnnGPj05qNxexE1nd6xEeD/o603lHZ6GJd62gq10B
	a1yhwNClH0cMDy/xIjiplyQ7tqKd30O6j3phglU=
X-Google-Smtp-Source: ACcGV63ha84DCshno1X34jj+x36vdwjjwpTwf2RO9mjnnlUSFiPDvZGiddBf6XjRijXUY25vzCmd7nY7YkuSyMpkhRo=
X-Received: by 2002:ac8:689a:: with SMTP id
	m26-v6mr28631759qtq.254.1539201436811; 
	Wed, 10 Oct 2018 12:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20181009204503.6089-1-raj.khem@gmail.com>
	<20181009204956.GE19188@beryl>
	<CAMKF1sohkFn3uvoGFTmHUEePd=O7GvogTJ=KpscRAVwwVyZF2Q@mail.gmail.com>
	<20181010193649.GJ19188@beryl>
In-Reply-To: <20181010193649.GJ19188@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Oct 2018 12:56:50 -0700
Message-ID: <CAMKF1spn2+JGG_HH=Od2ppf==mvFQoZmdg86a85ysvtgZJ873w@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] recipes: Limit ti specific recipes under ti-soc override
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
X-List-Received-Date: Wed, 10 Oct 2018 19:57:19 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Denys

On Wed, Oct 10, 2018 at 12:36 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Tue, Oct 09, 2018 at 03:40:40PM -0700, Khem Raj wrote:
> > No, it doesn't AFAICT
> >
> > On Tue, Oct 9, 2018 at 1:49 PM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > > Does this make packages machine-specific?
> > >
> > > On Tue, Oct 09, 2018 at 01:45:03PM -0700, Khem Raj wrote:
> > > > This helps in multi-BSP scenario, where other BSP layers are also
> > > > present in the layermix
>
> I'm not specifically against this patch, but want to understand better - are
> there any specific conflicts these packages have with other BSPs?
>

There are couple of things
We do world builds where they cause issues
Secondly, some of these force to pin providers and since BSP layers
appear before
other layers they become providers, its better to keep them limited to SOC there

we are putting an effort to make sure that we have a distro which can
build for various
SBCs from same sandbox.

See https://github.com/YoeDistro


>
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  recipes-bsp/cuia/cuia_1.0.0.13.bb                      | 3 +++
> > > >  recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 3 +++
> > > >  recipes-bsp/x-load/x-load_git.bb                       | 3 +++
> > > >  recipes-graphics/gbm/libgbm_10.0.0.bb                  | 3 +++
> > > >  recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb     | 3 +++
> > > >  recipes-graphics/omapfbplay/omapfbplay.inc             | 2 ++
> > > >  recipes-multimedia/libdce/libdce_3.00.14.00.bb         | 2 ++
> > > >  recipes-ti/bios/ti-biosutils_1.02.02.bb                | 3 +++
> > > >  recipes-ti/dmai/ti-dmai_svn.bb                         | 3 +++
> > > >  recipes-ti/dsplib/dsplib.inc                           | 2 ++
> > > >  recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb             | 2 ++
> > > >  recipes-ti/includes/ti-unpack.inc                      | 5 +++++
> > > >  recipes-ti/ipc/ti-ipc-common.inc                       | 2 ++
> > > >  recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb      | 3 +++
> > > >  recipes-ti/mathlib/mathlib.inc                         | 2 ++
> > > >  recipes-ti/ndk/ti-ndk_3.40.01.01.bb                    | 3 +++
> > > >  recipes-ti/swtools/swtools_git.bb                      | 2 ++
> > > >  17 files changed, 46 insertions(+)
> > > >
> > > > diff --git a/recipes-bsp/cuia/cuia_1.0.0.13.bb b/recipes-bsp/cuia/
> > > cuia_1.0.0.13.bb
> > > > index e048f6aa..a7caf504 100644
> > > > --- a/recipes-bsp/cuia/cuia_1.0.0.13.bb
> > > > +++ b/recipes-bsp/cuia/cuia_1.0.0.13.bb
> > > > @@ -23,3 +23,6 @@ do_install() {
> > > >       cd ${S}
> > > >       oe_runmake DESTDIR=${D} libdir=${libdir} includedir=${includedir}
> > > install
> > > >  }
> > > > +
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > > b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > > > index 94485b6a..d29b6496 100644
> > > > --- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > > > +++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > > > @@ -22,3 +22,6 @@ do_install() {
> > > >      install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> > > >      install -m 644 ${S}/galcore.ko
> > > ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> > > >  }
> > > > +
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > diff --git a/recipes-bsp/x-load/x-load_git.bb b/recipes-bsp/x-load/
> > > x-load_git.bb
> > > > index dd8bce2d..1ce1b0f0 100644
> > > > --- a/recipes-bsp/x-load/x-load_git.bb
> > > > +++ b/recipes-bsp/x-load/x-load_git.bb
> > > > @@ -17,3 +17,6 @@ CONFIG_HEADER_beagleboard = "1"
> > > >  XLOAD_MACHINE_omap3-touchbook = "omap3530beagle_config"
> > > >
> > > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > > +
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > diff --git a/recipes-graphics/gbm/libgbm_10.0.0.bb
> > > b/recipes-graphics/gbm/libgbm_10.0.0.bb
> > > > index 38715ccf..9e3c7ed0 100644
> > > > --- a/recipes-graphics/gbm/libgbm_10.0.0.bb
> > > > +++ b/recipes-graphics/gbm/libgbm_10.0.0.bb
> > > > @@ -16,3 +16,6 @@ SRC_URI = "git://
> > > git.ti.com/glsdk/libgbm.git;protocol=git;branch=${BRANCH}
> > > <http://git.ti.com/glsdk/libgbm.git;protocol=git;branch=$%7BBRANCH%7D> \
> > > >
> > > file://0001-gbm.c-include-sys-sysmacros.h-for-minor-major-in-new.patch"
> > > >
> > > >  S = "${WORKDIR}/git"
> > > > +
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > > b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > > > index dafaac1e..a2f8f192 100644
> > > > --- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > > > +++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > > > @@ -37,3 +37,6 @@ do_install() {
> > > >  }
> > > >
> > > >  INSANE_SKIP_${PN} += "ldflags"
> > > > +
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > diff --git a/recipes-graphics/omapfbplay/omapfbplay.inc
> > > b/recipes-graphics/omapfbplay/omapfbplay.inc
> > > > index df166dd3..744eb8f7 100644
> > > > --- a/recipes-graphics/omapfbplay/omapfbplay.inc
> > > > +++ b/recipes-graphics/omapfbplay/omapfbplay.inc
> > > > @@ -14,6 +14,8 @@ SRC_URI = "git://git.mansr.com/omapfbplay;protocol=git
> > > \
> > > >  S = "${WORKDIR}/git"
> > > >
> > > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > >
> > > >  # We want a kernel header for armv7a, but we don't want to make mplayer
> > > machine specific for that
> > > >  STAGING_KERNEL_DIR =
> > > "${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel"
> > > > diff --git a/recipes-multimedia/libdce/libdce_3.00.14.00.bb
> > > b/recipes-multimedia/libdce/libdce_3.00.14.00.bb
> > > > index 04c0b718..0deec7ab 100644
> > > > --- a/recipes-multimedia/libdce/libdce_3.00.14.00.bb
> > > > +++ b/recipes-multimedia/libdce/libdce_3.00.14.00.bb
> > > > @@ -13,3 +13,5 @@ PR = "r1"
> > > >
> > > >  S = "${WORKDIR}/git"
> > > >  EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > diff --git a/recipes-ti/bios/ti-biosutils_1.02.02.bb b/recipes-ti/bios/
> > > ti-biosutils_1.02.02.bb
> > > > index 5b6b4f43..01c070d7 100644
> > > > --- a/recipes-ti/bios/ti-biosutils_1.02.02.bb
> > > > +++ b/recipes-ti/bios/ti-biosutils_1.02.02.bb
> > > > @@ -7,3 +7,6 @@ SRC_URI[biosutilstarball.md5sum] =
> > > "0654e9e72b0a6fc7a6575829c0cd90c9"
> > > >  SRC_URI[biosutilstarball.sha256sum] =
> > > "df486500bdc8dbe3800fc7efe4241e6fa5b1827ba7c0dc17a71b41d42ef921e1"
> > > >
> > > >  INSANE_SKIP_${PN} = "installed-vs-shipped"
> > > > +
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/
> > > ti-dmai_svn.bb
> > > > index 4a91b9b9..3cc54b91 100644
> > > > --- a/recipes-ti/dmai/ti-dmai_svn.bb
> > > > +++ b/recipes-ti/dmai/ti-dmai_svn.bb
> > > > @@ -38,3 +38,6 @@ SRC_URI_append = "
> > > file://omap3530-r642-remove-include-videodev.diff;striplevel=
> > > >                   "
> > > >
> > > >  INSANE_SKIP_${PN} = "installed-vs-shipped"
> > > > +
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
> > > > index f3696795..a3953105 100644
> > > > --- a/recipes-ti/dsplib/dsplib.inc
> > > > +++ b/recipes-ti/dsplib/dsplib.inc
> > > > @@ -69,3 +69,5 @@ ALLOW_EMPTY_${PN} = "1"
> > > >  FILES_${PN}-dev += "${DSPLIB_INSTALL_DIR_RECIPE}"
> > > >
> > > >  INSANE_SKIP_${PN}-dev = "arch"
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > diff --git a/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
> > > b/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
> > > > index e3b1c56f..c2e7d268 100644
> > > > --- a/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
> > > > +++ b/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
> > > > @@ -4,3 +4,5 @@ SRC_URI[md5sum] = "6db908bef3b933dc8cea666564d5d4d8"
> > > >  SRC_URI[sha256sum] =
> > > "2caa9c859cfe348197e860f07d174a8ab7048d38d6d3a12ec576802122c9e91e"
> > > >
> > > >
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > diff --git a/recipes-ti/includes/ti-unpack.inc
> > > b/recipes-ti/includes/ti-unpack.inc
> > > > index a571fd5d..b520d6ab 100644
> > > > --- a/recipes-ti/includes/ti-unpack.inc
> > > > +++ b/recipes-ti/includes/ti-unpack.inc
> > > > @@ -79,3 +79,8 @@ python ti_bin_do_unpack() {
> > > >      # Return to the previous directory
> > > >      os.chdir(save_cwd)
> > > >  }
> > > > +
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > +COMPATIBLE_HOST_class-native = "(.*)"
> > > > +
> > > > diff --git a/recipes-ti/ipc/ti-ipc-common.inc
> > > b/recipes-ti/ipc/ti-ipc-common.inc
> > > > index dddb7344..aea9d278 100644
> > > > --- a/recipes-ti/ipc/ti-ipc-common.inc
> > > > +++ b/recipes-ti/ipc/ti-ipc-common.inc
> > > > @@ -2,6 +2,8 @@ PV = "3.50.02.02"
> > > >  INC_PR = "r0"
> > > >
> > > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > >
> > > >  PLATFORM = "UNKNOWN"
> > > >  PLATFORM_omap5-evm = "OMAP54XX"
> > > > diff --git a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
> > > b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
> > > > index 1a56d1da..113e6a69 100644
> > > > --- a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
> > > > +++ b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
> > > > @@ -12,3 +12,6 @@ SRC_URI[md5sum] = "70b4918bc35c1bcfef34d6ba3fbce0c8"
> > > >  SRC_URI[sha256sum] =
> > > "51266dd928f8d629cd417c869789a6c0d596612120f165619119cbaadfd66ee2"
> > > >
> > > >  INSANE_SKIP_${PN} = "installed-vs-shipped"
> > > > +
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > diff --git a/recipes-ti/mathlib/mathlib.inc
> > > b/recipes-ti/mathlib/mathlib.inc
> > > > index 6aea085a..61f198bc 100644
> > > > --- a/recipes-ti/mathlib/mathlib.inc
> > > > +++ b/recipes-ti/mathlib/mathlib.inc
> > > > @@ -68,3 +68,5 @@ ALLOW_EMPTY_${PN} = "1"
> > > >  FILES_${PN}-dev += "${MATHLIB_INSTALL_DIR_RECIPE}"
> > > >
> > > >  INSANE_SKIP_${PN}-dev = "arch"
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > diff --git a/recipes-ti/ndk/ti-ndk_3.40.01.01.bb b/recipes-ti/ndk/
> > > ti-ndk_3.40.01.01.bb
> > > > index 4a494b19..c6c18733 100644
> > > > --- a/recipes-ti/ndk/ti-ndk_3.40.01.01.bb
> > > > +++ b/recipes-ti/ndk/ti-ndk_3.40.01.01.bb
> > > > @@ -11,3 +11,6 @@ SRC_URI[ndkzip.sha256sum] =
> > > "e2e5c683c70dfad6f4372c5eeebaf0209b27abb0f77304f14f0
> > > >  INHIBIT_PACKAGE_STRIP = "1"
> > > >  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > > >  INHIBIT_SYSROOT_STRIP = "1"
> > > > +
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/
> > > swtools_git.bb
> > > > index 425a0690..168fe211 100644
> > > > --- a/recipes-ti/swtools/swtools_git.bb
> > > > +++ b/recipes-ti/swtools/swtools_git.bb
> > > > @@ -42,3 +42,5 @@ FILES_${PN}-dev += "${SWTOOLS_INSTALL_DIR_RECIPE}"
> > > >
> > > >  INSANE_SKIP_${PN}-dev = "arch staticdev"
> > > >  ALLOW_EMPTY_${PN} = "1"
> > > > +COMPATIBLE_HOST ?= "null"
> > > > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > > > --
> > > > 2.19.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > >


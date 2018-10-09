Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9383FE00994; Tue,  9 Oct 2018 15:40:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.222.174 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C83AE00971
	for <meta-ti@yoctoproject.org>; Tue,  9 Oct 2018 15:40:53 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id 84-v6so2048777qkf.0
	for <meta-ti@yoctoproject.org>; Tue, 09 Oct 2018 15:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OfGtd3AJH1FAIBkl+Iza2fIHqdMUFCUGyJmzrbaxlC0=;
	b=WLbFoc0suNYw8t4XP2cJkU+7wHRtnU83N4r+8u53w3oqwHUBNvVDKMpAYp2WZz9kp7
	qhjPBqiTMh5+nQEcAvTo4ZbjpzDFoa5+5uB5NImwyMjCNO0lZYNrZWi0FtuovkT02q62
	iWXJPTHnYWUlNOxOMq2TXoVUcfRte9I9dOe9MlTJjvAEmePyXE1TJ5QcAIYIPfKh32vL
	Szew4wiY3YvSZNhfRotD1kCr4NSzdTuDWajiYPf3GNhfvLeB+e61emCsvbuQTjlQoVBE
	ZivFvvOSeJv4EaLAgb/DSy+fxceY96Sav4dcD/tM9ZKl7RFiDaQjBhQDhdtq1izcOer1
	xYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OfGtd3AJH1FAIBkl+Iza2fIHqdMUFCUGyJmzrbaxlC0=;
	b=LByQgNSwgSstuDJrOBBv/4vkWSGkY6SHNDD/eRal7CRxFPZA8Ll8/PZ0XMcKU6TI2b
	C6QdbYgil236ZqUvyxFrjOoUNaq4xcrsvJIc0f8SKuecaBHzIjAZu6m8c14DLpbVjywr
	AK1ZiqzZbUYvf0WNYy5wW3ZrlvaNsyFKU40MjAk7kSzpo2WFUNyC4DeBQViwe7VkDfWG
	SL9KN1hpBDUmSo0932QFRMzGjxHhw774UOP/xj3XWJ6PJUI8wzn4hqcGMv+qW8yCAUFX
	8ssCM4G3PvBnv/PjIkAyD3izo4BPUsi55J7UmFaR919kfZFfpvwsp76wv2DlgU4jCfkJ
	ghog==
X-Gm-Message-State: ABuFfoi24pQkT4zrftkhqJaReZOING8y3BZ7wkrLspU04uVswLNU1EON
	itTDZG/DjqP8DRb1MhCBqDYbG+SdnyHBDxLmoqaqhQ==
X-Google-Smtp-Source: ACcGV61mv98hdg97wXW8f9GtlY+pCUq90/9OAmLFr8rGmWZxKi8XEw/qylEQObnj4CmFZWsO/ccQcPFyfZbmarRMqvs=
X-Received: by 2002:a37:31cf:: with SMTP id
	x198-v6mr6415226qkx.206.1539124852379; 
	Tue, 09 Oct 2018 15:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20181009204503.6089-1-raj.khem@gmail.com>
	<20181009204956.GE19188@beryl>
In-Reply-To: <20181009204956.GE19188@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Oct 2018 15:40:40 -0700
Message-ID: <CAMKF1sohkFn3uvoGFTmHUEePd=O7GvogTJ=KpscRAVwwVyZF2Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 09 Oct 2018 22:40:55 -0000
Content-Type: multipart/alternative; boundary="0000000000001757900577d36e28"

--0000000000001757900577d36e28
Content-Type: text/plain; charset="UTF-8"

No, it doesn't AFAICT

On Tue, Oct 9, 2018 at 1:49 PM Denys Dmytriyenko <denys@ti.com> wrote:

> Does this make packages machine-specific?
>
> On Tue, Oct 09, 2018 at 01:45:03PM -0700, Khem Raj wrote:
> > This helps in multi-BSP scenario, where other BSP layers are also
> > present in the layermix
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  recipes-bsp/cuia/cuia_1.0.0.13.bb                      | 3 +++
> >  recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 3 +++
> >  recipes-bsp/x-load/x-load_git.bb                       | 3 +++
> >  recipes-graphics/gbm/libgbm_10.0.0.bb                  | 3 +++
> >  recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb     | 3 +++
> >  recipes-graphics/omapfbplay/omapfbplay.inc             | 2 ++
> >  recipes-multimedia/libdce/libdce_3.00.14.00.bb         | 2 ++
> >  recipes-ti/bios/ti-biosutils_1.02.02.bb                | 3 +++
> >  recipes-ti/dmai/ti-dmai_svn.bb                         | 3 +++
> >  recipes-ti/dsplib/dsplib.inc                           | 2 ++
> >  recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb             | 2 ++
> >  recipes-ti/includes/ti-unpack.inc                      | 5 +++++
> >  recipes-ti/ipc/ti-ipc-common.inc                       | 2 ++
> >  recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb      | 3 +++
> >  recipes-ti/mathlib/mathlib.inc                         | 2 ++
> >  recipes-ti/ndk/ti-ndk_3.40.01.01.bb                    | 3 +++
> >  recipes-ti/swtools/swtools_git.bb                      | 2 ++
> >  17 files changed, 46 insertions(+)
> >
> > diff --git a/recipes-bsp/cuia/cuia_1.0.0.13.bb b/recipes-bsp/cuia/
> cuia_1.0.0.13.bb
> > index e048f6aa..a7caf504 100644
> > --- a/recipes-bsp/cuia/cuia_1.0.0.13.bb
> > +++ b/recipes-bsp/cuia/cuia_1.0.0.13.bb
> > @@ -23,3 +23,6 @@ do_install() {
> >       cd ${S}
> >       oe_runmake DESTDIR=${D} libdir=${libdir} includedir=${includedir}
> install
> >  }
> > +
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > index 94485b6a..d29b6496 100644
> > --- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > +++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > @@ -22,3 +22,6 @@ do_install() {
> >      install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> >      install -m 644 ${S}/galcore.ko
> ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> >  }
> > +
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-bsp/x-load/x-load_git.bb b/recipes-bsp/x-load/
> x-load_git.bb
> > index dd8bce2d..1ce1b0f0 100644
> > --- a/recipes-bsp/x-load/x-load_git.bb
> > +++ b/recipes-bsp/x-load/x-load_git.bb
> > @@ -17,3 +17,6 @@ CONFIG_HEADER_beagleboard = "1"
> >  XLOAD_MACHINE_omap3-touchbook = "omap3530beagle_config"
> >
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-graphics/gbm/libgbm_10.0.0.bb
> b/recipes-graphics/gbm/libgbm_10.0.0.bb
> > index 38715ccf..9e3c7ed0 100644
> > --- a/recipes-graphics/gbm/libgbm_10.0.0.bb
> > +++ b/recipes-graphics/gbm/libgbm_10.0.0.bb
> > @@ -16,3 +16,6 @@ SRC_URI = "git://
> git.ti.com/glsdk/libgbm.git;protocol=git;branch=${BRANCH}
> <http://git.ti.com/glsdk/libgbm.git;protocol=git;branch=$%7BBRANCH%7D> \
> >
> file://0001-gbm.c-include-sys-sysmacros.h-for-minor-major-in-new.patch"
> >
> >  S = "${WORKDIR}/git"
> > +
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > index dafaac1e..a2f8f192 100644
> > --- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > +++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > @@ -37,3 +37,6 @@ do_install() {
> >  }
> >
> >  INSANE_SKIP_${PN} += "ldflags"
> > +
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-graphics/omapfbplay/omapfbplay.inc
> b/recipes-graphics/omapfbplay/omapfbplay.inc
> > index df166dd3..744eb8f7 100644
> > --- a/recipes-graphics/omapfbplay/omapfbplay.inc
> > +++ b/recipes-graphics/omapfbplay/omapfbplay.inc
> > @@ -14,6 +14,8 @@ SRC_URI = "git://git.mansr.com/omapfbplay;protocol=git
> \
> >  S = "${WORKDIR}/git"
> >
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> >
> >  # We want a kernel header for armv7a, but we don't want to make mplayer
> machine specific for that
> >  STAGING_KERNEL_DIR =
> "${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel"
> > diff --git a/recipes-multimedia/libdce/libdce_3.00.14.00.bb
> b/recipes-multimedia/libdce/libdce_3.00.14.00.bb
> > index 04c0b718..0deec7ab 100644
> > --- a/recipes-multimedia/libdce/libdce_3.00.14.00.bb
> > +++ b/recipes-multimedia/libdce/libdce_3.00.14.00.bb
> > @@ -13,3 +13,5 @@ PR = "r1"
> >
> >  S = "${WORKDIR}/git"
> >  EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-ti/bios/ti-biosutils_1.02.02.bb b/recipes-ti/bios/
> ti-biosutils_1.02.02.bb
> > index 5b6b4f43..01c070d7 100644
> > --- a/recipes-ti/bios/ti-biosutils_1.02.02.bb
> > +++ b/recipes-ti/bios/ti-biosutils_1.02.02.bb
> > @@ -7,3 +7,6 @@ SRC_URI[biosutilstarball.md5sum] =
> "0654e9e72b0a6fc7a6575829c0cd90c9"
> >  SRC_URI[biosutilstarball.sha256sum] =
> "df486500bdc8dbe3800fc7efe4241e6fa5b1827ba7c0dc17a71b41d42ef921e1"
> >
> >  INSANE_SKIP_${PN} = "installed-vs-shipped"
> > +
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/
> ti-dmai_svn.bb
> > index 4a91b9b9..3cc54b91 100644
> > --- a/recipes-ti/dmai/ti-dmai_svn.bb
> > +++ b/recipes-ti/dmai/ti-dmai_svn.bb
> > @@ -38,3 +38,6 @@ SRC_URI_append = "
> file://omap3530-r642-remove-include-videodev.diff;striplevel=
> >                   "
> >
> >  INSANE_SKIP_${PN} = "installed-vs-shipped"
> > +
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
> > index f3696795..a3953105 100644
> > --- a/recipes-ti/dsplib/dsplib.inc
> > +++ b/recipes-ti/dsplib/dsplib.inc
> > @@ -69,3 +69,5 @@ ALLOW_EMPTY_${PN} = "1"
> >  FILES_${PN}-dev += "${DSPLIB_INSTALL_DIR_RECIPE}"
> >
> >  INSANE_SKIP_${PN}-dev = "arch"
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
> b/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
> > index e3b1c56f..c2e7d268 100644
> > --- a/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
> > +++ b/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
> > @@ -4,3 +4,5 @@ SRC_URI[md5sum] = "6db908bef3b933dc8cea666564d5d4d8"
> >  SRC_URI[sha256sum] =
> "2caa9c859cfe348197e860f07d174a8ab7048d38d6d3a12ec576802122c9e91e"
> >
> >
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-ti/includes/ti-unpack.inc
> b/recipes-ti/includes/ti-unpack.inc
> > index a571fd5d..b520d6ab 100644
> > --- a/recipes-ti/includes/ti-unpack.inc
> > +++ b/recipes-ti/includes/ti-unpack.inc
> > @@ -79,3 +79,8 @@ python ti_bin_do_unpack() {
> >      # Return to the previous directory
> >      os.chdir(save_cwd)
> >  }
> > +
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > +COMPATIBLE_HOST_class-native = "(.*)"
> > +
> > diff --git a/recipes-ti/ipc/ti-ipc-common.inc
> b/recipes-ti/ipc/ti-ipc-common.inc
> > index dddb7344..aea9d278 100644
> > --- a/recipes-ti/ipc/ti-ipc-common.inc
> > +++ b/recipes-ti/ipc/ti-ipc-common.inc
> > @@ -2,6 +2,8 @@ PV = "3.50.02.02"
> >  INC_PR = "r0"
> >
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> >
> >  PLATFORM = "UNKNOWN"
> >  PLATFORM_omap5-evm = "OMAP54XX"
> > diff --git a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
> b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
> > index 1a56d1da..113e6a69 100644
> > --- a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
> > +++ b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
> > @@ -12,3 +12,6 @@ SRC_URI[md5sum] = "70b4918bc35c1bcfef34d6ba3fbce0c8"
> >  SRC_URI[sha256sum] =
> "51266dd928f8d629cd417c869789a6c0d596612120f165619119cbaadfd66ee2"
> >
> >  INSANE_SKIP_${PN} = "installed-vs-shipped"
> > +
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-ti/mathlib/mathlib.inc
> b/recipes-ti/mathlib/mathlib.inc
> > index 6aea085a..61f198bc 100644
> > --- a/recipes-ti/mathlib/mathlib.inc
> > +++ b/recipes-ti/mathlib/mathlib.inc
> > @@ -68,3 +68,5 @@ ALLOW_EMPTY_${PN} = "1"
> >  FILES_${PN}-dev += "${MATHLIB_INSTALL_DIR_RECIPE}"
> >
> >  INSANE_SKIP_${PN}-dev = "arch"
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-ti/ndk/ti-ndk_3.40.01.01.bb b/recipes-ti/ndk/
> ti-ndk_3.40.01.01.bb
> > index 4a494b19..c6c18733 100644
> > --- a/recipes-ti/ndk/ti-ndk_3.40.01.01.bb
> > +++ b/recipes-ti/ndk/ti-ndk_3.40.01.01.bb
> > @@ -11,3 +11,6 @@ SRC_URI[ndkzip.sha256sum] =
> "e2e5c683c70dfad6f4372c5eeebaf0209b27abb0f77304f14f0
> >  INHIBIT_PACKAGE_STRIP = "1"
> >  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >  INHIBIT_SYSROOT_STRIP = "1"
> > +
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/
> swtools_git.bb
> > index 425a0690..168fe211 100644
> > --- a/recipes-ti/swtools/swtools_git.bb
> > +++ b/recipes-ti/swtools/swtools_git.bb
> > @@ -42,3 +42,5 @@ FILES_${PN}-dev += "${SWTOOLS_INSTALL_DIR_RECIPE}"
> >
> >  INSANE_SKIP_${PN}-dev = "arch staticdev"
> >  ALLOW_EMPTY_${PN} = "1"
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>

--0000000000001757900577d36e28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">No, it doesn&#39;t AFAICT</div></div><div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Tue, Oct 9, 2018 at 1:49 PM Denys =
Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Does this make packages machine-sp=
ecific?<br>
<br>
On Tue, Oct 09, 2018 at 01:45:03PM -0700, Khem Raj wrote:<br>
&gt; This helps in multi-BSP scenario, where other BSP layers are also<br>
&gt; present in the layermix<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-bsp/cuia/<a href=3D"http://cuia_1.0.0.13.bb" rel=3D"nore=
ferrer" target=3D"_blank">cuia_1.0.0.13.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
&gt;=C2=A0 recipes-bsp/gc320-drivers/<a href=3D"http://ti-gc320-driver_5.0.=
11.p7.bb" rel=3D"noreferrer" target=3D"_blank">ti-gc320-driver_5.0.11.p7.bb=
</a> | 3 +++<br>
&gt;=C2=A0 recipes-bsp/x-load/<a href=3D"http://x-load_git.bb" rel=3D"noref=
errer" target=3D"_blank">x-load_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +++<br>
&gt;=C2=A0 recipes-graphics/gbm/<a href=3D"http://libgbm_10.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">libgbm_10.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
&gt;=C2=A0 recipes-graphics/libgal/<a href=3D"http://ti-gc320-libs_5.0.11.p=
7.bb" rel=3D"noreferrer" target=3D"_blank">ti-gc320-libs_5.0.11.p7.bb</a>=
=C2=A0 =C2=A0 =C2=A0| 3 +++<br>
&gt;=C2=A0 recipes-graphics/omapfbplay/omapfbplay.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 recipes-multimedia/libdce/<a href=3D"http://libdce_3.00.14.00.bb=
" rel=3D"noreferrer" target=3D"_blank">libdce_3.00.14.00.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 recipes-ti/bios/<a href=3D"http://ti-biosutils_1.02.02.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-biosutils_1.02.02.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
&gt;=C2=A0 recipes-ti/dmai/<a href=3D"http://ti-dmai_svn.bb" rel=3D"norefer=
rer" target=3D"_blank">ti-dmai_svn.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +++<br>
&gt;=C2=A0 recipes-ti/dsplib/dsplib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 recipes-ti/hdvpss/<a href=3D"http://ti-hdvpss_01.00.01.27.bb" re=
l=3D"noreferrer" target=3D"_blank">ti-hdvpss_01.00.01.27.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 recipes-ti/includes/ti-unpack.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
&gt;=C2=A0 recipes-ti/ipc/ti-ipc-common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 recipes-ti/linuxutils/<a href=3D"http://ti-linuxutils_2.26.01.02=
.bb" rel=3D"noreferrer" target=3D"_blank">ti-linuxutils_2.26.01.02.bb</a>=
=C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
&gt;=C2=A0 recipes-ti/mathlib/mathlib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 recipes-ti/ndk/<a href=3D"http://ti-ndk_3.40.01.01.bb" rel=3D"no=
referrer" target=3D"_blank">ti-ndk_3.40.01.01.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
&gt;=C2=A0 recipes-ti/swtools/<a href=3D"http://swtools_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">swtools_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 17 files changed, 46 insertions(+)<br>
&gt; <br>
&gt; diff --git a/recipes-bsp/cuia/<a href=3D"http://cuia_1.0.0.13.bb" rel=
=3D"noreferrer" target=3D"_blank">cuia_1.0.0.13.bb</a> b/recipes-bsp/cuia/<=
a href=3D"http://cuia_1.0.0.13.bb" rel=3D"noreferrer" target=3D"_blank">cui=
a_1.0.0.13.bb</a><br>
&gt; index e048f6aa..a7caf504 100644<br>
&gt; --- a/recipes-bsp/cuia/<a href=3D"http://cuia_1.0.0.13.bb" rel=3D"nore=
ferrer" target=3D"_blank">cuia_1.0.0.13.bb</a><br>
&gt; +++ b/recipes-bsp/cuia/<a href=3D"http://cuia_1.0.0.13.bb" rel=3D"nore=
ferrer" target=3D"_blank">cuia_1.0.0.13.bb</a><br>
&gt; @@ -23,3 +23,6 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DESTDIR=3D${D} libdir=3D${libdir}=
 includedir=3D${includedir} install<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-bsp/gc320-drivers/<a href=3D"http://ti-gc320-driv=
er_5.0.11.p7.bb" rel=3D"noreferrer" target=3D"_blank">ti-gc320-driver_5.0.1=
1.p7.bb</a> b/recipes-bsp/gc320-drivers/<a href=3D"http://ti-gc320-driver_5=
.0.11.p7.bb" rel=3D"noreferrer" target=3D"_blank">ti-gc320-driver_5.0.11.p7=
.bb</a><br>
&gt; index 94485b6a..d29b6496 100644<br>
&gt; --- a/recipes-bsp/gc320-drivers/<a href=3D"http://ti-gc320-driver_5.0.=
11.p7.bb" rel=3D"noreferrer" target=3D"_blank">ti-gc320-driver_5.0.11.p7.bb=
</a><br>
&gt; +++ b/recipes-bsp/gc320-drivers/<a href=3D"http://ti-gc320-driver_5.0.=
11.p7.bb" rel=3D"noreferrer" target=3D"_blank">ti-gc320-driver_5.0.11.p7.bb=
</a><br>
&gt; @@ -22,3 +22,6 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -d ${D}/${base_libdir}/modules/${KERNEL_VE=
RSION}/extra<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 644 ${S}/galcore.ko ${D}/${base_libdir}=
/modules/${KERNEL_VERSION}/extra<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-bsp/x-load/<a href=3D"http://x-load_git.bb" rel=
=3D"noreferrer" target=3D"_blank">x-load_git.bb</a> b/recipes-bsp/x-load/<a=
 href=3D"http://x-load_git.bb" rel=3D"noreferrer" target=3D"_blank">x-load_=
git.bb</a><br>
&gt; index dd8bce2d..1ce1b0f0 100644<br>
&gt; --- a/recipes-bsp/x-load/<a href=3D"http://x-load_git.bb" rel=3D"noref=
errer" target=3D"_blank">x-load_git.bb</a><br>
&gt; +++ b/recipes-bsp/x-load/<a href=3D"http://x-load_git.bb" rel=3D"noref=
errer" target=3D"_blank">x-load_git.bb</a><br>
&gt; @@ -17,3 +17,6 @@ CONFIG_HEADER_beagleboard =3D &quot;1&quot;<br>
&gt;=C2=A0 XLOAD_MACHINE_omap3-touchbook =3D &quot;omap3530beagle_config&qu=
ot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-graphics/gbm/<a href=3D"http://libgbm_10.0.0.bb" =
rel=3D"noreferrer" target=3D"_blank">libgbm_10.0.0.bb</a> b/recipes-graphic=
s/gbm/<a href=3D"http://libgbm_10.0.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">libgbm_10.0.0.bb</a><br>
&gt; index 38715ccf..9e3c7ed0 100644<br>
&gt; --- a/recipes-graphics/gbm/<a href=3D"http://libgbm_10.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">libgbm_10.0.0.bb</a><br>
&gt; +++ b/recipes-graphics/gbm/<a href=3D"http://libgbm_10.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">libgbm_10.0.0.bb</a><br>
&gt; @@ -16,3 +16,6 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.ti.com=
/glsdk/libgbm.git;protocol=3Dgit;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer"=
 target=3D"_blank">git.ti.com/glsdk/libgbm.git;protocol=3Dgit;branch=3D${BR=
ANCH}</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-gbm.c-incl=
ude-sys-sysmacros.h-for-minor-major-in-new.patch&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-graphics/libgal/<a href=3D"http://ti-gc320-libs_5=
.0.11.p7.bb" rel=3D"noreferrer" target=3D"_blank">ti-gc320-libs_5.0.11.p7.b=
b</a> b/recipes-graphics/libgal/<a href=3D"http://ti-gc320-libs_5.0.11.p7.b=
b" rel=3D"noreferrer" target=3D"_blank">ti-gc320-libs_5.0.11.p7.bb</a><br>
&gt; index dafaac1e..a2f8f192 100644<br>
&gt; --- a/recipes-graphics/libgal/<a href=3D"http://ti-gc320-libs_5.0.11.p=
7.bb" rel=3D"noreferrer" target=3D"_blank">ti-gc320-libs_5.0.11.p7.bb</a><b=
r>
&gt; +++ b/recipes-graphics/libgal/<a href=3D"http://ti-gc320-libs_5.0.11.p=
7.bb" rel=3D"noreferrer" target=3D"_blank">ti-gc320-libs_5.0.11.p7.bb</a><b=
r>
&gt; @@ -37,3 +37,6 @@ do_install() {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 INSANE_SKIP_${PN} +=3D &quot;ldflags&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-graphics/omapfbplay/omapfbplay.inc b/recipes-grap=
hics/omapfbplay/omapfbplay.inc<br>
&gt; index df166dd3..744eb8f7 100644<br>
&gt; --- a/recipes-graphics/omapfbplay/omapfbplay.inc<br>
&gt; +++ b/recipes-graphics/omapfbplay/omapfbplay.inc<br>
&gt; @@ -14,6 +14,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.mansr.=
com/omapfbplay;protocol=3Dgit" rel=3D"noreferrer" target=3D"_blank">git.man=
sr.com/omapfbplay;protocol=3Dgit</a> \<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # We want a kernel header for armv7a, but we don&#39;t want to m=
ake mplayer machine specific for that<br>
&gt;=C2=A0 STAGING_KERNEL_DIR =3D &quot;${STAGING_DIR}/${MACHINE_ARCH}${TAR=
GET_VENDOR}-${TARGET_OS}/kernel&quot;<br>
&gt; diff --git a/recipes-multimedia/libdce/<a href=3D"http://libdce_3.00.1=
4.00.bb" rel=3D"noreferrer" target=3D"_blank">libdce_3.00.14.00.bb</a> b/re=
cipes-multimedia/libdce/<a href=3D"http://libdce_3.00.14.00.bb" rel=3D"nore=
ferrer" target=3D"_blank">libdce_3.00.14.00.bb</a><br>
&gt; index 04c0b718..0deec7ab 100644<br>
&gt; --- a/recipes-multimedia/libdce/<a href=3D"http://libdce_3.00.14.00.bb=
" rel=3D"noreferrer" target=3D"_blank">libdce_3.00.14.00.bb</a><br>
&gt; +++ b/recipes-multimedia/libdce/<a href=3D"http://libdce_3.00.14.00.bb=
" rel=3D"noreferrer" target=3D"_blank">libdce_3.00.14.00.bb</a><br>
&gt; @@ -13,3 +13,5 @@ PR =3D &quot;r1&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 EXTRA_OECONF +=3D &quot;IPC_HEADERS=3D${STAGING_INCDIR}/ti/ipc/m=
m&quot;<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-ti/bios/<a href=3D"http://ti-biosutils_1.02.02.bb=
" rel=3D"noreferrer" target=3D"_blank">ti-biosutils_1.02.02.bb</a> b/recipe=
s-ti/bios/<a href=3D"http://ti-biosutils_1.02.02.bb" rel=3D"noreferrer" tar=
get=3D"_blank">ti-biosutils_1.02.02.bb</a><br>
&gt; index 5b6b4f43..01c070d7 100644<br>
&gt; --- a/recipes-ti/bios/<a href=3D"http://ti-biosutils_1.02.02.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-biosutils_1.02.02.bb</a><br>
&gt; +++ b/recipes-ti/bios/<a href=3D"http://ti-biosutils_1.02.02.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-biosutils_1.02.02.bb</a><br>
&gt; @@ -7,3 +7,6 @@ SRC_URI[biosutilstarball.md5sum] =3D &quot;0654e9e72b0=
a6fc7a6575829c0cd90c9&quot;<br>
&gt;=C2=A0 SRC_URI[biosutilstarball.sha256sum] =3D &quot;df486500bdc8dbe380=
0fc7efe4241e6fa5b1827ba7c0dc17a71b41d42ef921e1&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 INSANE_SKIP_${PN} =3D &quot;installed-vs-shipped&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-ti/dmai/<a href=3D"http://ti-dmai_svn.bb" rel=3D"=
noreferrer" target=3D"_blank">ti-dmai_svn.bb</a> b/recipes-ti/dmai/<a href=
=3D"http://ti-dmai_svn.bb" rel=3D"noreferrer" target=3D"_blank">ti-dmai_svn=
.bb</a><br>
&gt; index 4a91b9b9..3cc54b91 100644<br>
&gt; --- a/recipes-ti/dmai/<a href=3D"http://ti-dmai_svn.bb" rel=3D"norefer=
rer" target=3D"_blank">ti-dmai_svn.bb</a><br>
&gt; +++ b/recipes-ti/dmai/<a href=3D"http://ti-dmai_svn.bb" rel=3D"norefer=
rer" target=3D"_blank">ti-dmai_svn.bb</a><br>
&gt; @@ -38,3 +38,6 @@ SRC_URI_append =3D &quot; file://omap3530-r642-remov=
e-include-videodev.diff;striplevel=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 INSANE_SKIP_${PN} =3D &quot;installed-vs-shipped&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.i=
nc<br>
&gt; index f3696795..a3953105 100644<br>
&gt; --- a/recipes-ti/dsplib/dsplib.inc<br>
&gt; +++ b/recipes-ti/dsplib/dsplib.inc<br>
&gt; @@ -69,3 +69,5 @@ ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&gt;=C2=A0 FILES_${PN}-dev +=3D &quot;${DSPLIB_INSTALL_DIR_RECIPE}&quot;<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 INSANE_SKIP_${PN}-dev =3D &quot;arch&quot;<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-ti/hdvpss/<a href=3D"http://ti-hdvpss_01.00.01.27=
.bb" rel=3D"noreferrer" target=3D"_blank">ti-hdvpss_01.00.01.27.bb</a> b/re=
cipes-ti/hdvpss/<a href=3D"http://ti-hdvpss_01.00.01.27.bb" rel=3D"noreferr=
er" target=3D"_blank">ti-hdvpss_01.00.01.27.bb</a><br>
&gt; index e3b1c56f..c2e7d268 100644<br>
&gt; --- a/recipes-ti/hdvpss/<a href=3D"http://ti-hdvpss_01.00.01.27.bb" re=
l=3D"noreferrer" target=3D"_blank">ti-hdvpss_01.00.01.27.bb</a><br>
&gt; +++ b/recipes-ti/hdvpss/<a href=3D"http://ti-hdvpss_01.00.01.27.bb" re=
l=3D"noreferrer" target=3D"_blank">ti-hdvpss_01.00.01.27.bb</a><br>
&gt; @@ -4,3 +4,5 @@ SRC_URI[md5sum] =3D &quot;6db908bef3b933dc8cea666564d5=
d4d8&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;2caa9c859cfe348197e860f07d174a8ab70=
48d38d6d3a12ec576802122c9e91e&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/t=
i-unpack.inc<br>
&gt; index a571fd5d..b520d6ab 100644<br>
&gt; --- a/recipes-ti/includes/ti-unpack.inc<br>
&gt; +++ b/recipes-ti/includes/ti-unpack.inc<br>
&gt; @@ -79,3 +79,8 @@ python ti_bin_do_unpack() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Return to the previous directory<br>
&gt;=C2=A0 =C2=A0 =C2=A0 os.chdir(save_cwd)<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; +COMPATIBLE_HOST_class-native =3D &quot;(.*)&quot;<br>
&gt; +<br>
&gt; diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-=
common.inc<br>
&gt; index dddb7344..aea9d278 100644<br>
&gt; --- a/recipes-ti/ipc/ti-ipc-common.inc<br>
&gt; +++ b/recipes-ti/ipc/ti-ipc-common.inc<br>
&gt; @@ -2,6 +2,8 @@ PV =3D &quot;3.50.02.02&quot;<br>
&gt;=C2=A0 INC_PR =3D &quot;r0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PLATFORM =3D &quot;UNKNOWN&quot;<br>
&gt;=C2=A0 PLATFORM_omap5-evm =3D &quot;OMAP54XX&quot;<br>
&gt; diff --git a/recipes-ti/linuxutils/<a href=3D"http://ti-linuxutils_2.2=
6.01.02.bb" rel=3D"noreferrer" target=3D"_blank">ti-linuxutils_2.26.01.02.b=
b</a> b/recipes-ti/linuxutils/<a href=3D"http://ti-linuxutils_2.26.01.02.bb=
" rel=3D"noreferrer" target=3D"_blank">ti-linuxutils_2.26.01.02.bb</a><br>
&gt; index 1a56d1da..113e6a69 100644<br>
&gt; --- a/recipes-ti/linuxutils/<a href=3D"http://ti-linuxutils_2.26.01.02=
.bb" rel=3D"noreferrer" target=3D"_blank">ti-linuxutils_2.26.01.02.bb</a><b=
r>
&gt; +++ b/recipes-ti/linuxutils/<a href=3D"http://ti-linuxutils_2.26.01.02=
.bb" rel=3D"noreferrer" target=3D"_blank">ti-linuxutils_2.26.01.02.bb</a><b=
r>
&gt; @@ -12,3 +12,6 @@ SRC_URI[md5sum] =3D &quot;70b4918bc35c1bcfef34d6ba3f=
bce0c8&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;51266dd928f8d629cd417c869789a6c0d59=
6612120f165619119cbaadfd66ee2&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 INSANE_SKIP_${PN} =3D &quot;installed-vs-shipped&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathl=
ib.inc<br>
&gt; index 6aea085a..61f198bc 100644<br>
&gt; --- a/recipes-ti/mathlib/mathlib.inc<br>
&gt; +++ b/recipes-ti/mathlib/mathlib.inc<br>
&gt; @@ -68,3 +68,5 @@ ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&gt;=C2=A0 FILES_${PN}-dev +=3D &quot;${MATHLIB_INSTALL_DIR_RECIPE}&quot;<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 INSANE_SKIP_${PN}-dev =3D &quot;arch&quot;<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-ti/ndk/<a href=3D"http://ti-ndk_3.40.01.01.bb" re=
l=3D"noreferrer" target=3D"_blank">ti-ndk_3.40.01.01.bb</a> b/recipes-ti/nd=
k/<a href=3D"http://ti-ndk_3.40.01.01.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ti-ndk_3.40.01.01.bb</a><br>
&gt; index 4a494b19..c6c18733 100644<br>
&gt; --- a/recipes-ti/ndk/<a href=3D"http://ti-ndk_3.40.01.01.bb" rel=3D"no=
referrer" target=3D"_blank">ti-ndk_3.40.01.01.bb</a><br>
&gt; +++ b/recipes-ti/ndk/<a href=3D"http://ti-ndk_3.40.01.01.bb" rel=3D"no=
referrer" target=3D"_blank">ti-ndk_3.40.01.01.bb</a><br>
&gt; @@ -11,3 +11,6 @@ SRC_URI[ndkzip.sha256sum] =3D &quot;e2e5c683c70dfad6=
f4372c5eeebaf0209b27abb0f77304f14f0<br>
&gt;=C2=A0 INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&gt;=C2=A0 INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&gt;=C2=A0 INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-ti/swtools/<a href=3D"http://swtools_git.bb" rel=
=3D"noreferrer" target=3D"_blank">swtools_git.bb</a> b/recipes-ti/swtools/<=
a href=3D"http://swtools_git.bb" rel=3D"noreferrer" target=3D"_blank">swtoo=
ls_git.bb</a><br>
&gt; index 425a0690..168fe211 100644<br>
&gt; --- a/recipes-ti/swtools/<a href=3D"http://swtools_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">swtools_git.bb</a><br>
&gt; +++ b/recipes-ti/swtools/<a href=3D"http://swtools_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">swtools_git.bb</a><br>
&gt; @@ -42,3 +42,5 @@ FILES_${PN}-dev +=3D &quot;${SWTOOLS_INSTALL_DIR_REC=
IPE}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 INSANE_SKIP_${PN}-dev =3D &quot;arch staticdev&quot;<br>
&gt;=C2=A0 ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; -- <br>
&gt; 2.19.1<br>
&gt; <br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@=
yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>
</blockquote></div></div>

--0000000000001757900577d36e28--

Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 465BAE00D85; Thu, 26 Sep 2019 09:24:44 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.222.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E88AE00CBC
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 09:24:43 -0700 (PDT)
Received: by mail-qk1-f194.google.com with SMTP id y144so2278191qkb.7
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 09:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5fEPt0AznQfuixpBhMT2x8CNLrpGvyV1N8SdbE9NKGA=;
	b=azKgaGCJ75XLXRKrUMXp2XrnYDWpp/PB73iNPkHM6WeBX/htbtWVS/9RZ0vtz4q5Mi
	etA7l3wi1R/u2WHlVufeQ/gtwAjvtPm6EYU55iVy0hkrMGvx7EMgHyBEO2qdjyOlidf/
	ErENlKpm8ORtxaAXiOnv2mxA1Wkyib4aqejPdCRC0TazphEhhYMpf6JBHRJtU9qfTB85
	Es1v1J8ZWKpQ51g/48rSQawPbHVPa6ps/L2bXAPmgid+cwmR/ZZs6EVNEulefPe6ZKho
	diuTzVFWUKLM/zqAdYYSlH8ZXSOMhG6k0DVsCztoobE98zQFPEs9IEw1xPuDK9OzVSua
	n26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5fEPt0AznQfuixpBhMT2x8CNLrpGvyV1N8SdbE9NKGA=;
	b=memqrppVqPGGs92Y8fQww3Dwx7aUOXayGHaK+0O5vWUplDvZD7rE026KdQgqJwxsDV
	1w9NJxQ3+854bE5DPA7RTLc4yHplGZ3uwhsOLvqRPrJewvx1HqR2H6/rShz0KOPs5h5R
	a/4Dgam1ttUA+2RKAFkCSYG0o4kLUNt62ZwYIwXnvgG03iE93nnHiHuwEwQ2nUgN6vQF
	y60qIbNDL2QsHdmCn1hlyuuWuAnZ6WeSyNWCkfqMD0tSCdSDRrd/RiCQFul2I62egqG2
	oi8uBLyT9w0kuUE/VolDL1pCrPArl+Dkfw1gQ1uCoMJZgQvHe3RdngPbusiYoSXlQgXw
	mJWQ==
X-Gm-Message-State: APjAAAUmkhgMjzyDi5rO1C1trZ1lF28IsSwOqXkgh1qyJ9nfmCa7Cq0i
	uhAZ7P/qO6XriYu8t11f/wEMsuTKtvL5Gc8VyG8=
X-Google-Smtp-Source: APXvYqzVOKBDzJ+HzgqprYsE9N4v6zs56k+oPeNzhfTSJG5+aijLnUzaZPXo87io6n4yI2QaH5d2RrVsRBI02Ihdh78=
X-Received: by 2002:a05:620a:653:: with SMTP id
	a19mr4109890qka.337.1569515082113; 
	Thu, 26 Sep 2019 09:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190926160150.2507778-1-raj.khem@gmail.com>
	<20190926161220.GA5386@beryl>
In-Reply-To: <20190926161220.GA5386@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Sep 2019 09:24:15 -0700
Message-ID: <CAMKF1spieioPofWjgkrz0eqW-8UWVnSFx+f8by9ACAimWZcqtQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] rwmem: Update to 2.0-rc2+
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
X-List-Received-Date: Thu, 26 Sep 2019 16:24:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 26, 2019 at 9:12 AM Denys Dmytriyenko <denys@ti.com> wrote:
>
> Thanks! It's been on my todo list lately...
>
> There's pybind11 recipe in meta-openembedded/meta-python that I originally
> submitted back in 2016, but unfortunately meta-ti does not depend on that
> layer and probably shouldn't for now.
>

yeah I think this recipe should actually move out to a common layer
since there seems
to be nothing SOC specific in it.

>
> On Thu, Sep 26, 2019 at 09:01:50AM -0700, Khem Raj wrote:
> > - New versions uses CMake and extra modules
> > - Correct detection of nm/ranlib/ar for LTO
> > - Fix build with clang/libc++
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...Make-provided-vars-for-ar-and-ranlib.patch | 34 +++++++++++++++++++
> >  ....h-Include-cerrno-for-errno-definiti.patch | 24 +++++++++++++
> >  recipes-bsp/rwmem/rwmem_1.1.bb                | 13 -------
> >  recipes-bsp/rwmem/rwmem_1.2.bb                | 27 +++++++++++++++
> >  4 files changed, 85 insertions(+), 13 deletions(-)
> >  create mode 100644 recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> >  create mode 100644 recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
> >  delete mode 100644 recipes-bsp/rwmem/rwmem_1.1.bb
> >  create mode 100644 recipes-bsp/rwmem/rwmem_1.2.bb
> >
> > diff --git a/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> > new file mode 100644
> > index 00000000..79968f32
> > --- /dev/null
> > +++ b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> > @@ -0,0 +1,34 @@
> > +From ee3bbdaae568118b4aad453c8fbb1ec648e8fbf2 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sat, 8 Dec 2018 22:48:23 -0800
> > +Subject: [PATCH] Use CMake provided vars for ar and ranlib
> > +
> > +hardcoding them means we may not be able to cross compile the package
> > +reliably as build host may or may not have gcc-ar and gcc-ranlib
> > +installed, using the cross tools is the correct thing to do here
> > +
> > +Upstream-Status: Submitted [https://github.com/tomba/rwmem/pull/5]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + CMakeLists.txt | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 5e7f327..e36fca0 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -50,8 +50,8 @@ if (NOT ${U_CMAKE_BUILD_TYPE} MATCHES DEBUG)
> > +     if (HAS_LTO_FLAG)
> > +             set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -flto")
> > +             set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
> > +-            set(CMAKE_AR gcc-ar)
> > +-            set(CMAKE_RANLIB gcc-ranlib)
> > ++            set(CMAKE_AR ${CMAKE_CXX_COMPILER_AR})
> > ++            set(CMAKE_RANLIB ${CMAKE_CXX_COMPILER_RANLIB})
> > +     endif()
> > + endif()
> > +
> > +--
> > +2.19.2
> > +
> > diff --git a/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch b/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
> > new file mode 100644
> > index 00000000..9f33fa5e
> > --- /dev/null
> > +++ b/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
> > @@ -0,0 +1,24 @@
> > +From 9f1d52590336caeab8038cdd015294df2e5d8c1f Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 1 Feb 2019 23:47:04 -0800
> > +Subject: [PATCH] librwmem/helpers.h: Include <cerrno> for errno definitions
> > +
> > +this is found with libc++
> > +
> > +Upstream-Status: Submitted [https://github.com/tomba/rwmem/pull/5]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + librwmem/helpers.h | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/librwmem/helpers.h b/librwmem/helpers.h
> > +index ccc6c9e..686943e 100644
> > +--- a/librwmem/helpers.h
> > ++++ b/librwmem/helpers.h
> > +@@ -1,5 +1,6 @@
> > + #pragma once
> > +
> > ++#include <cerrno>
> > + #include <string>
> > + #include <vector>
> > + #include <string.h>
> > diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
> > deleted file mode 100644
> > index 2848e1cd..00000000
> > --- a/recipes-bsp/rwmem/rwmem_1.1.bb
> > +++ /dev/null
> > @@ -1,13 +0,0 @@
> > -SUMMARY = "A small tool to read/write memory"
> > -LICENSE = "GPLv2+"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > -
> > -SRCREV = "54904b8873b265d8f1faf82617c2f04814c102c6"
> > -SRC_URI = "git://github.com/tomba/rwmem.git"
> > -
> > -S = "${WORKDIR}/git"
> > -
> > -do_install() {
> > -     install -d ${D}${bindir}
> > -     install -m 0755 rwmem ${D}${bindir}
> > -}
> > diff --git a/recipes-bsp/rwmem/rwmem_1.2.bb b/recipes-bsp/rwmem/rwmem_1.2.bb
> > new file mode 100644
> > index 00000000..c4d2bc49
> > --- /dev/null
> > +++ b/recipes-bsp/rwmem/rwmem_1.2.bb
> > @@ -0,0 +1,27 @@
> > +SUMMARY = "A small tool to read/write memory"
> > +LICENSE = "GPLv2+"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > +
> > +PV .= "+git${SRCPV}"
> > +
> > +SRCREV_rwmem = "7e5ca9802c1b8ff1f6407c19dfd0b9415501bb11"
> > +SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
> > +SRCREV_pybind11 = "9a19306fbf30642ca331d0ec88e7da54a96860f9"
> > +
> > +SRCREV_FORMAT = "rwmem_inih_pybind11"
> > +
> > +SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem \
> > +           git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
> > +           git://github.com/pybind/pybind11.git;protocol=https;name=pybind11;nobranch=1;destsuffix=git/ext/pybind11 \
> > +           file://0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch \
> > +           file://0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch \
> > +           "
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit cmake pkgconfig python3native
> > +
> > +do_install() {
> > +     install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
> > +     install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
> > +}
> > --
> > 2.23.0
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


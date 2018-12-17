Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9F97E00BB7; Mon, 17 Dec 2018 11:17:35 -0800 (PST)
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
	*      [209.85.222.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5BACE00B58
	for <meta-ti@yoctoproject.org>; Mon, 17 Dec 2018 11:17:34 -0800 (PST)
Received: by mail-qk1-f196.google.com with SMTP id q1so7990592qkf.13
	for <meta-ti@yoctoproject.org>; Mon, 17 Dec 2018 11:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5N9Gj6FiQVQoQvvuGIFXgTYV+ANdKl+jHEQYF2xXyxU=;
	b=QcFjvCAiw8avVlWIwun1+NlS8KdOGYnVNT96AzKbZCDbk2nzrXJxdjYjWeWq6N0lNX
	aGg6TE3wpKfmSdN1CoqDPOYUTutE2iKgtOnH/ZEVYTL28n5uY/9LRDIOF2m022VJDL4B
	nzyS39QnKRt+wSyPR2sL/PxlyK8/kSv2JWLsDS45YFSFLKqhDxm3Sm8Tx10rlKREbA9U
	soa0EOiI5Z7V8TgQfXAiIA3XHzCiwXz3bNYhGxhpcX4jYxNXYnlTQh1alzq8QK07XtTQ
	lRrJ8EL1PhgGhk32wpcV+pwtH5FdhWDspGXC4vRq9GXQGKgLlAR/u3idjXqK4/KaPIK5
	hcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5N9Gj6FiQVQoQvvuGIFXgTYV+ANdKl+jHEQYF2xXyxU=;
	b=R4TbEWW0YH1PV2CNWpsuYJCN952lYbspNa8H2ZPEmNdW3B5uIDDvNbd9DnO21JY/Aa
	20vGUU9w00VwXc1CZDc4LZf1tnK1P9fVMvMkibfZZD9j89Dbw14DtWphK/8UsbVKaCoj
	Y9Bl07jOEtuvu0/v5qWdprQioAktwsJgPW/zjMMRIYU5W5KSZjcJmTw4tjc6EogPWQG8
	Sz/om4/hFldrG3kRXXBhrGMz4lRoXVnFX0p7QN51KtaReUJIhJRtNY8O966WTu+UyrxH
	fC0/o3dgjscdnakZXnPXvMk5B33SHBdEyTdfxTVNNfhTA18JYF6M/gsgfr2rGUmMD/KO
	SjJg==
X-Gm-Message-State: AA+aEWZt23sWOv/Z95GcJExoulF07vEOUP0gveRqM+lVjpv32ff+6qbl
	PH02b44XQ/asG/Jb2qjggWPq6YC1shNh5LnJXtmMNEBq
X-Google-Smtp-Source: AFSGD/WRpgrxYwTsujqQl8O3KxA7FtY39uT86P3CTHrTawmdIA4fBaKkc3QN1JzhSmcBglU/D9arwJKGakzKQnMwxuk=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr13998698qke.2.1545074253561; 
	Mon, 17 Dec 2018 11:17:33 -0800 (PST)
MIME-Version: 1.0
References: <20181209075901.18421-1-raj.khem@gmail.com>
	<CAMKF1spD7Xkh1GDs4gG1YqvczzKcpeQbAYadSFMC-VpFZLAbDA@mail.gmail.com>
	<20181217190708.GA517@beryl>
In-Reply-To: <20181217190708.GA517@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Dec 2018 11:17:07 -0800
Message-ID: <CAMKF1soF8T0ZpiuRCvUFsdkBpbU7Jz+ujCWoHsoPs71fVBiuVw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH V2] rwmem: Update to latest
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
X-List-Received-Date: Mon, 17 Dec 2018 19:17:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 17, 2018 at 11:07 AM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Mon, Dec 17, 2018 at 10:58:47AM -0800, Khem Raj wrote:
> > ping^1
>
> Yeah, I've been meaning to reply, just didn't have time.
>
> Mostly I'm fine with the update. But I don't like hidden submodules instead of
> direct dependencies. I already made pybind11 recipe for Tomi's kms++ some time
> ago (though upstreaming it to oe-core didn't work and I didn't find time to
> follow up). I haven't looked at "inih" module yet, but maybe should be a
> separate recipe as well?

thats ok but usually if they are doing static linking its better to keep
the gitsubmods or maybe at best use multiple SRC_URIs for each
component, I think its just inviting more work to keep different
recipes in sync otherwise. These new recipes may interfere with other
packages
etc.

>
> BTW, should it DEPENDS on python3 or inherit python3native?
>

its needed during runtime.

> Denys
>
>
> > On Sat, Dec 8, 2018 at 11:59 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > New versions use CMake
> > > Correct detection of nm/ranlib/ar for LTO
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > v2: Fix nm/ar/ranlib detection needed for LTO
> > >
> > >  ...Make-provided-vars-for-ar-and-ranlib.patch | 34 +++++++++++++++++++
> > >  recipes-bsp/rwmem/rwmem_1.1.bb                | 14 +++++---
> > >  2 files changed, 44 insertions(+), 4 deletions(-)
> > >  create mode 100644 recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> > >
> > > diff --git a/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> > > new file mode 100644
> > > index 00000000..d72f427d
> > > --- /dev/null
> > > +++ b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> > > @@ -0,0 +1,34 @@
> > > +From ee3bbdaae568118b4aad453c8fbb1ec648e8fbf2 Mon Sep 17 00:00:00 2001
> > > +From: Khem Raj <raj.khem@gmail.com>
> > > +Date: Sat, 8 Dec 2018 22:48:23 -0800
> > > +Subject: [PATCH] Use CMake provided vars for ar and ranlib
> > > +
> > > +hardcoding them means we may not be able to cross compile the package
> > > +reliably as build host may or may not have gcc-ar and gcc-ranlib
> > > +installed, using the cross tools is the correct thing to do here
> > > +
> > > +Upstream-Status: Pending
> > > +
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +---
> > > + CMakeLists.txt | 4 ++--
> > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > +
> > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > +index 5e7f327..e36fca0 100644
> > > +--- a/CMakeLists.txt
> > > ++++ b/CMakeLists.txt
> > > +@@ -50,8 +50,8 @@ if (NOT ${U_CMAKE_BUILD_TYPE} MATCHES DEBUG)
> > > +       if (HAS_LTO_FLAG)
> > > +               set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -flto")
> > > +               set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
> > > +-              set(CMAKE_AR gcc-ar)
> > > +-              set(CMAKE_RANLIB gcc-ranlib)
> > > ++              set(CMAKE_AR ${CMAKE_CXX_COMPILER_AR})
> > > ++              set(CMAKE_RANLIB ${CMAKE_CXX_COMPILER_RANLIB})
> > > +       endif()
> > > + endif()
> > > +
> > > +--
> > > +2.19.2
> > > +
> > > diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
> > > index 2848e1cd..62c33a3b 100644
> > > --- a/recipes-bsp/rwmem/rwmem_1.1.bb
> > > +++ b/recipes-bsp/rwmem/rwmem_1.1.bb
> > > @@ -2,12 +2,18 @@ SUMMARY = "A small tool to read/write memory"
> > >  LICENSE = "GPLv2+"
> > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > >
> > > -SRCREV = "54904b8873b265d8f1faf82617c2f04814c102c6"
> > > -SRC_URI = "git://github.com/tomba/rwmem.git"
> > > +SRCREV = "ad00619005654f9cde5c2ea2ed2277d1d3ad2f26"
> > > +SRC_URI = "gitsm://github.com/tomba/rwmem.git \
> > > +           file://0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch \
> > > +          "
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > > +inherit cmake pkgconfig
> > > +
> > > +DEPENDS += "python3"
> > > +
> > >  do_install() {
> > > -       install -d ${D}${bindir}
> > > -       install -m 0755 rwmem ${D}${bindir}
> > > +       install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
> > > +       install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
> > >  }
> > > --
> > > 2.19.2
> > >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


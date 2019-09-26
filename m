Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2693E00B1B; Thu, 26 Sep 2019 11:39:17 -0700 (PDT)
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
	*      [209.85.222.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE30AE0047F
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 11:39:16 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id u184so2666791qkd.4
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 11:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O7xPLAMPb80eJTjfpHReFdIHN05+bkeIxbKGLqewzX4=;
	b=p1PhISXXfpw59OPxh9f5WD28EtL1+JFGu/ay4KxaWks3hvgLoqvP4b5wRQ4J2itAIw
	mrj2dlbRHhdbObi/zDX7WUzT/gi3dF3JIAygv5SqtajgvwWmTVbg8/olOQvyh4L6B/Ho
	Tbqt959YaF8XbmpIcgXLgEU+EuA3A1ID2XclAE0zF1ZQ7kbsGW+5YyHvu8aROUM2REtG
	LNIhE1v4u5gL3YspN/3qFpHVQPgBcq6rEn4Ge8XcSKRAHD8xBqjf9gc1RsaoPAf7kzNl
	AudRdOgzHRDG5EflvxUY9o/JEuOJBkEBqXo1YybXi3M9TJeDE8nuDrG8sHpf70eBRRCv
	KBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O7xPLAMPb80eJTjfpHReFdIHN05+bkeIxbKGLqewzX4=;
	b=PGwd4d83hVj5k5qY1bd2n+iaGy7dETa+V5RtaT6Es9tug5cqtQ1ykuR0KASc+HXIx2
	ADCQdEMckkmzjFuy3wxC40zBIaywHqECcIfu0/rLbhB4p711WJEDQyfdJ6bOjGwiFlNq
	zhLwyUzK/HXUz6n2uqEU3i0QojdrpxV2rLQtCwvFunhu/KKSzy24VfrSnK2OBSFNhPdi
	QnXWU0mUxCBgm7HA7uQ7s1IptZ/7s1ILp/dkKnZ19u5if/lIaJuhmN+HAS8FsloBbFEd
	uYncs5i5w/VNWnBSSeRivRsn8YJ+W4N99lcT44+GApM6xEKRtJx98S/QQYK/piue91mn
	bDIg==
X-Gm-Message-State: APjAAAX+ccF2mjBky2/B+BuIwYJj8QrzZmwRJe660ccItv/9RzLhXxK7
	VPkGPo1tkGhUM5FtKuryGtJ+0IWsMYgwh8HBAgo=
X-Google-Smtp-Source: APXvYqzMspnpC41MBqqW3zAY8ypodxbUM0rCbk4B5tkkKrsduYGlqRaJc+kxt9Z/9DMZJ3/izaKEZtqsBobGwkTSFf0=
X-Received: by 2002:a37:6651:: with SMTP id a78mr262117qkc.474.1569523155773; 
	Thu, 26 Sep 2019 11:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190926160150.2507778-1-raj.khem@gmail.com>
	<20190926182525.GD5566@beryl>
	<f4ece6e4-322f-554b-bbbe-a81e6e3cf9ad@gmail.com>
	<20190926183750.GE5566@beryl>
In-Reply-To: <20190926183750.GE5566@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Sep 2019 11:38:49 -0700
Message-ID: <CAMKF1sodM7svKrX4_La0qReEHKe_Hc7aGcfi9i3W6ruZNBkyYw@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 Sep 2019 18:39:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 26, 2019 at 11:37 AM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Thu, Sep 26, 2019 at 11:28:29AM -0700, Khem Raj wrote:
> > On 9/26/19 11:25 AM, Denys Dmytriyenko wrote:
> > >Does this need:
> > >
> > >DEPENDS += "python3"
> > >
> > >Otherwise do_configure fails:
> > >
> > >-- Checking for module 'python3'
> > >--   No package 'python3' found
> > >
> >
> > it was looking for that on build system so inherit python3native should have
> > fixed it. Sent a v2 just now
>
> inherit python3native was already in v1 and it was giving me that error
> anyway.

hmmm a clean build shows it here as well. Sending v3

>
>
> > >On Thu, Sep 26, 2019 at 09:01:50AM -0700, Khem Raj wrote:
> > >>- New versions uses CMake and extra modules
> > >>- Correct detection of nm/ranlib/ar for LTO
> > >>- Fix build with clang/libc++
> > >>
> > >>Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >>---
> > >>  ...Make-provided-vars-for-ar-and-ranlib.patch | 34 +++++++++++++++++++
> > >>  ....h-Include-cerrno-for-errno-definiti.patch | 24 +++++++++++++
> > >>  recipes-bsp/rwmem/rwmem_1.1.bb                | 13 -------
> > >>  recipes-bsp/rwmem/rwmem_1.2.bb                | 27 +++++++++++++++
> > >>  4 files changed, 85 insertions(+), 13 deletions(-)
> > >>  create mode 100644 recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> > >>  create mode 100644 recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
> > >>  delete mode 100644 recipes-bsp/rwmem/rwmem_1.1.bb
> > >>  create mode 100644 recipes-bsp/rwmem/rwmem_1.2.bb
> > >>
> > >>diff --git a/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> > >>new file mode 100644
> > >>index 00000000..79968f32
> > >>--- /dev/null
> > >>+++ b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> > >>@@ -0,0 +1,34 @@
> > >>+From ee3bbdaae568118b4aad453c8fbb1ec648e8fbf2 Mon Sep 17 00:00:00 2001
> > >>+From: Khem Raj <raj.khem@gmail.com>
> > >>+Date: Sat, 8 Dec 2018 22:48:23 -0800
> > >>+Subject: [PATCH] Use CMake provided vars for ar and ranlib
> > >>+
> > >>+hardcoding them means we may not be able to cross compile the package
> > >>+reliably as build host may or may not have gcc-ar and gcc-ranlib
> > >>+installed, using the cross tools is the correct thing to do here
> > >>+
> > >>+Upstream-Status: Submitted [https://github.com/tomba/rwmem/pull/5]
> > >>+
> > >>+Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >>+---
> > >>+ CMakeLists.txt | 4 ++--
> > >>+ 1 file changed, 2 insertions(+), 2 deletions(-)
> > >>+
> > >>+diff --git a/CMakeLists.txt b/CMakeLists.txt
> > >>+index 5e7f327..e36fca0 100644
> > >>+--- a/CMakeLists.txt
> > >>++++ b/CMakeLists.txt
> > >>+@@ -50,8 +50,8 @@ if (NOT ${U_CMAKE_BUILD_TYPE} MATCHES DEBUG)
> > >>+   if (HAS_LTO_FLAG)
> > >>+           set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -flto")
> > >>+           set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
> > >>+-          set(CMAKE_AR gcc-ar)
> > >>+-          set(CMAKE_RANLIB gcc-ranlib)
> > >>++          set(CMAKE_AR ${CMAKE_CXX_COMPILER_AR})
> > >>++          set(CMAKE_RANLIB ${CMAKE_CXX_COMPILER_RANLIB})
> > >>+   endif()
> > >>+ endif()
> > >>+
> > >>+--
> > >>+2.19.2
> > >>+
> > >>diff --git a/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch b/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
> > >>new file mode 100644
> > >>index 00000000..9f33fa5e
> > >>--- /dev/null
> > >>+++ b/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
> > >>@@ -0,0 +1,24 @@
> > >>+From 9f1d52590336caeab8038cdd015294df2e5d8c1f Mon Sep 17 00:00:00 2001
> > >>+From: Khem Raj <raj.khem@gmail.com>
> > >>+Date: Fri, 1 Feb 2019 23:47:04 -0800
> > >>+Subject: [PATCH] librwmem/helpers.h: Include <cerrno> for errno definitions
> > >>+
> > >>+this is found with libc++
> > >>+
> > >>+Upstream-Status: Submitted [https://github.com/tomba/rwmem/pull/5]
> > >>+Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >>+---
> > >>+ librwmem/helpers.h | 1 +
> > >>+ 1 file changed, 1 insertion(+)
> > >>+
> > >>+diff --git a/librwmem/helpers.h b/librwmem/helpers.h
> > >>+index ccc6c9e..686943e 100644
> > >>+--- a/librwmem/helpers.h
> > >>++++ b/librwmem/helpers.h
> > >>+@@ -1,5 +1,6 @@
> > >>+ #pragma once
> > >>+
> > >>++#include <cerrno>
> > >>+ #include <string>
> > >>+ #include <vector>
> > >>+ #include <string.h>
> > >>diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
> > >>deleted file mode 100644
> > >>index 2848e1cd..00000000
> > >>--- a/recipes-bsp/rwmem/rwmem_1.1.bb
> > >>+++ /dev/null
> > >>@@ -1,13 +0,0 @@
> > >>-SUMMARY = "A small tool to read/write memory"
> > >>-LICENSE = "GPLv2+"
> > >>-LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > >>-
> > >>-SRCREV = "54904b8873b265d8f1faf82617c2f04814c102c6"
> > >>-SRC_URI = "git://github.com/tomba/rwmem.git"
> > >>-
> > >>-S = "${WORKDIR}/git"
> > >>-
> > >>-do_install() {
> > >>-   install -d ${D}${bindir}
> > >>-   install -m 0755 rwmem ${D}${bindir}
> > >>-}
> > >>diff --git a/recipes-bsp/rwmem/rwmem_1.2.bb b/recipes-bsp/rwmem/rwmem_1.2.bb
> > >>new file mode 100644
> > >>index 00000000..c4d2bc49
> > >>--- /dev/null
> > >>+++ b/recipes-bsp/rwmem/rwmem_1.2.bb
> > >>@@ -0,0 +1,27 @@
> > >>+SUMMARY = "A small tool to read/write memory"
> > >>+LICENSE = "GPLv2+"
> > >>+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > >>+
> > >>+PV .= "+git${SRCPV}"
> > >>+
> > >>+SRCREV_rwmem = "7e5ca9802c1b8ff1f6407c19dfd0b9415501bb11"
> > >>+SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
> > >>+SRCREV_pybind11 = "9a19306fbf30642ca331d0ec88e7da54a96860f9"
> > >>+
> > >>+SRCREV_FORMAT = "rwmem_inih_pybind11"
> > >>+
> > >>+SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem \
> > >>+           git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
> > >>+           git://github.com/pybind/pybind11.git;protocol=https;name=pybind11;nobranch=1;destsuffix=git/ext/pybind11 \
> > >>+           file://0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch \
> > >>+           file://0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch \
> > >>+           "
> > >>+
> > >>+S = "${WORKDIR}/git"
> > >>+
> > >>+inherit cmake pkgconfig python3native
> > >>+
> > >>+do_install() {
> > >>+   install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
> > >>+   install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
> > >>+}
> > >>--
> > >>2.23.0
> > >>
> > >>--
> > >>_______________________________________________
> > >>meta-ti mailing list
> > >>meta-ti@yoctoproject.org
> > >>https://lists.yoctoproject.org/listinfo/meta-ti
> >


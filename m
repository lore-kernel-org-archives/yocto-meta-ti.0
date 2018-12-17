Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D291E00BB7; Mon, 17 Dec 2018 10:59:15 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE651E00B58
	for <meta-ti@yoctoproject.org>; Mon, 17 Dec 2018 10:59:14 -0800 (PST)
Received: by mail-qt1-f194.google.com with SMTP id p17so15326507qtl.5
	for <meta-ti@yoctoproject.org>; Mon, 17 Dec 2018 10:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=KMo+EThZJb2XUubGD1Iqjq5VlU2aD/KJMIyxhZ8arjE=;
	b=lmr2D5T9Z7YXIKNSA1fHQnq8/8/WO5D063Y9hTZIHz2Kw3SvugZaeBKEyyv1zPTqLL
	U4svuvrucyqFWpPEkNmcPOa+/DsQ3B6tDUYVx7Ix5PJXGTgfPIN1Qe3LweI4OPKxSPgz
	MIy929a5YT+sm22KL/63csDLXHax2MV8qYK5fR+8EiyA8WH3BxNUF9uMNjZRkacnCmkk
	KPeYQ4BGogr7IMaNsyUwln+Tz/ogTl7afsk1EvY6orwrrGpa5mylKb30UiRDd9Qcoae3
	cghRLmtuUgJxYn89rGbSkW5Tmhy1/0RAMGEYXZfpDY6+F1peLmvdm2T9MzDzl68wqNzf
	ARJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=KMo+EThZJb2XUubGD1Iqjq5VlU2aD/KJMIyxhZ8arjE=;
	b=kP2pcVJfa01ZvI+D5OLOt51KuqBn7aC5uLDRV6rKmhe0iuCUMMu/GEOBCAEYvkDOD4
	Wqf84YUoNAxYp6crqHqM0ewDlTWcS/BMNgxtCTAOfKz8kLXldo2NDjT3RTeZxXE8ekWh
	w4F02VWkSen3yrQwydefRfEunjaDEBCg6ZkpVQpcSYcsrjTRxzRk7OcstnaX298qP9AE
	AFm9vcNpeRd6kgaSOPi0/yYIvoI68lu4cjrlSKXkyOHF3++uwdVksgVNROeJWFFF2WUZ
	5CNfvnrxmhM1etH3Kk8ApEsR2tswnMfkmMT/OPULuZ53rPuxPQ6zqwmVpIRfvU7COPn0
	yxig==
X-Gm-Message-State: AA+aEWY3MVsP5rYkQEPEd/gN0v5Ov+yIIAndz1rrWSOy0zaDerJP3peg
	u3ugSZLYfz9icMIgdUqciBHTc26BLoSOak0N3f7b0WNZ
X-Google-Smtp-Source: AFSGD/V+t2bZ70nKXFyrAGOk3H4L9BhSz4KXq7l5ph+9g0X63BZrGCQ8VpgDJ1TydSlWTNti26o35d7a4r5GBKhYICA=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr14542638qtf.196.1545073153884;
	Mon, 17 Dec 2018 10:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20181209075901.18421-1-raj.khem@gmail.com>
In-Reply-To: <20181209075901.18421-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Dec 2018 10:58:47 -0800
Message-ID: <CAMKF1spD7Xkh1GDs4gG1YqvczzKcpeQbAYadSFMC-VpFZLAbDA@mail.gmail.com>
To: meta-ti@yoctoproject.org
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
X-List-Received-Date: Mon, 17 Dec 2018 18:59:15 -0000
Content-Type: text/plain; charset="UTF-8"

ping^1

On Sat, Dec 8, 2018 at 11:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> New versions use CMake
> Correct detection of nm/ranlib/ar for LTO
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Fix nm/ar/ranlib detection needed for LTO
>
>  ...Make-provided-vars-for-ar-and-ranlib.patch | 34 +++++++++++++++++++
>  recipes-bsp/rwmem/rwmem_1.1.bb                | 14 +++++---
>  2 files changed, 44 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
>
> diff --git a/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> new file mode 100644
> index 00000000..d72f427d
> --- /dev/null
> +++ b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> @@ -0,0 +1,34 @@
> +From ee3bbdaae568118b4aad453c8fbb1ec648e8fbf2 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 8 Dec 2018 22:48:23 -0800
> +Subject: [PATCH] Use CMake provided vars for ar and ranlib
> +
> +hardcoding them means we may not be able to cross compile the package
> +reliably as build host may or may not have gcc-ar and gcc-ranlib
> +installed, using the cross tools is the correct thing to do here
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + CMakeLists.txt | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 5e7f327..e36fca0 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -50,8 +50,8 @@ if (NOT ${U_CMAKE_BUILD_TYPE} MATCHES DEBUG)
> +       if (HAS_LTO_FLAG)
> +               set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -flto")
> +               set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
> +-              set(CMAKE_AR gcc-ar)
> +-              set(CMAKE_RANLIB gcc-ranlib)
> ++              set(CMAKE_AR ${CMAKE_CXX_COMPILER_AR})
> ++              set(CMAKE_RANLIB ${CMAKE_CXX_COMPILER_RANLIB})
> +       endif()
> + endif()
> +
> +--
> +2.19.2
> +
> diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
> index 2848e1cd..62c33a3b 100644
> --- a/recipes-bsp/rwmem/rwmem_1.1.bb
> +++ b/recipes-bsp/rwmem/rwmem_1.1.bb
> @@ -2,12 +2,18 @@ SUMMARY = "A small tool to read/write memory"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> -SRCREV = "54904b8873b265d8f1faf82617c2f04814c102c6"
> -SRC_URI = "git://github.com/tomba/rwmem.git"
> +SRCREV = "ad00619005654f9cde5c2ea2ed2277d1d3ad2f26"
> +SRC_URI = "gitsm://github.com/tomba/rwmem.git \
> +           file://0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch \
> +          "
>
>  S = "${WORKDIR}/git"
>
> +inherit cmake pkgconfig
> +
> +DEPENDS += "python3"
> +
>  do_install() {
> -       install -d ${D}${bindir}
> -       install -m 0755 rwmem ${D}${bindir}
> +       install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
> +       install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
>  }
> --
> 2.19.2
>


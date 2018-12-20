Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6217E00C4D; Wed, 19 Dec 2018 19:15:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A95DBE0090E
	for <meta-ti@yoctoproject.org>; Wed, 19 Dec 2018 19:15:21 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBK3FKll031383;
	Wed, 19 Dec 2018 21:15:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545275720;
	bh=BUWj71UcZDJdHGdtHXASZYsEaXexo9Er8Q6QwYbbBxg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ciYNCsmVoTP/KjS53zGXrtAdn72YXg99wCTgDCu3STwSLjoZeCV6L9T/XHNVfHoTQ
	A7y9OzSTW2ugvC5X7ghH9UG2PfQTpkA2QhN7qcPWrr0oIheUbWyU9NEazjxQDzQszk
	CxA/ACwalV9kTDq0VuzVUtG5Na4LLghfBZpT16Q0=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBK3FKSZ031883
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Dec 2018 21:15:20 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 19 Dec 2018 21:15:20 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 19 Dec 2018 21:15:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBK3FKBx027251;
	Wed, 19 Dec 2018 21:15:20 -0600
Date: Wed, 19 Dec 2018 22:15:19 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181220031519.GQ517@beryl>
References: <20181209075901.18421-1-raj.khem@gmail.com>
	<CAMKF1spD7Xkh1GDs4gG1YqvczzKcpeQbAYadSFMC-VpFZLAbDA@mail.gmail.com>
	<20181217190708.GA517@beryl> <20181217191319.GB517@beryl>
MIME-Version: 1.0
In-Reply-To: <20181217191319.GB517@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Thu, 20 Dec 2018 03:15:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Dec 17, 2018 at 02:13:19PM -0500, Denys Dmytriyenko wrote:
> On Mon, Dec 17, 2018 at 02:07:08PM -0500, Denys Dmytriyenko wrote:
> > On Mon, Dec 17, 2018 at 10:58:47AM -0800, Khem Raj wrote:
> > > ping^1
> > 
> > Yeah, I've been meaning to reply, just didn't have time.
> > 
> > Mostly I'm fine with the update. But I don't like hidden submodules instead of 
> > direct dependencies. I already made pybind11 recipe for Tomi's kms++ some time 
> > ago (though upstreaming it to oe-core didn't work and I didn't find time to 
> > follow up). I haven't looked at "inih" module yet, but maybe should be a 
> > separate recipe as well?
> 
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/inih/libinih_git.bb

It appears to be an 8-year old fork of the original. Doesn't seem to work, 
lacks some methods...


> > BTW, should it DEPENDS on python3 or inherit python3native?
> > 
> > Denys
> > 
> > 
> > > On Sat, Dec 8, 2018 at 11:59 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > New versions use CMake
> > > > Correct detection of nm/ranlib/ar for LTO
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > > v2: Fix nm/ar/ranlib detection needed for LTO
> > > >
> > > >  ...Make-provided-vars-for-ar-and-ranlib.patch | 34 +++++++++++++++++++
> > > >  recipes-bsp/rwmem/rwmem_1.1.bb                | 14 +++++---
> > > >  2 files changed, 44 insertions(+), 4 deletions(-)
> > > >  create mode 100644 recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> > > >
> > > > diff --git a/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> > > > new file mode 100644
> > > > index 00000000..d72f427d
> > > > --- /dev/null
> > > > +++ b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> > > > @@ -0,0 +1,34 @@
> > > > +From ee3bbdaae568118b4aad453c8fbb1ec648e8fbf2 Mon Sep 17 00:00:00 2001
> > > > +From: Khem Raj <raj.khem@gmail.com>
> > > > +Date: Sat, 8 Dec 2018 22:48:23 -0800
> > > > +Subject: [PATCH] Use CMake provided vars for ar and ranlib
> > > > +
> > > > +hardcoding them means we may not be able to cross compile the package
> > > > +reliably as build host may or may not have gcc-ar and gcc-ranlib
> > > > +installed, using the cross tools is the correct thing to do here
> > > > +
> > > > +Upstream-Status: Pending
> > > > +
> > > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > +---
> > > > + CMakeLists.txt | 4 ++--
> > > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > > +
> > > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > > +index 5e7f327..e36fca0 100644
> > > > +--- a/CMakeLists.txt
> > > > ++++ b/CMakeLists.txt
> > > > +@@ -50,8 +50,8 @@ if (NOT ${U_CMAKE_BUILD_TYPE} MATCHES DEBUG)
> > > > +       if (HAS_LTO_FLAG)
> > > > +               set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -flto")
> > > > +               set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
> > > > +-              set(CMAKE_AR gcc-ar)
> > > > +-              set(CMAKE_RANLIB gcc-ranlib)
> > > > ++              set(CMAKE_AR ${CMAKE_CXX_COMPILER_AR})
> > > > ++              set(CMAKE_RANLIB ${CMAKE_CXX_COMPILER_RANLIB})
> > > > +       endif()
> > > > + endif()
> > > > +
> > > > +--
> > > > +2.19.2
> > > > +
> > > > diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
> > > > index 2848e1cd..62c33a3b 100644
> > > > --- a/recipes-bsp/rwmem/rwmem_1.1.bb
> > > > +++ b/recipes-bsp/rwmem/rwmem_1.1.bb
> > > > @@ -2,12 +2,18 @@ SUMMARY = "A small tool to read/write memory"
> > > >  LICENSE = "GPLv2+"
> > > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > > >
> > > > -SRCREV = "54904b8873b265d8f1faf82617c2f04814c102c6"
> > > > -SRC_URI = "git://github.com/tomba/rwmem.git"
> > > > +SRCREV = "ad00619005654f9cde5c2ea2ed2277d1d3ad2f26"
> > > > +SRC_URI = "gitsm://github.com/tomba/rwmem.git \
> > > > +           file://0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch \
> > > > +          "
> > > >
> > > >  S = "${WORKDIR}/git"
> > > >
> > > > +inherit cmake pkgconfig
> > > > +
> > > > +DEPENDS += "python3"
> > > > +
> > > >  do_install() {
> > > > -       install -d ${D}${bindir}
> > > > -       install -m 0755 rwmem ${D}${bindir}
> > > > +       install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
> > > > +       install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
> > > >  }
> > > > --
> > > > 2.19.2
> > > >
> > > -- 
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


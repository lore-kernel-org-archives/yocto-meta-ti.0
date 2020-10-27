Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.8418.1603766614553310692
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 19:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nlGqmF4V;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09R2hXVV096766;
	Mon, 26 Oct 2020 21:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603766613;
	bh=1UCqZEFVtObCIbAnxGOn3Sl6I4AP4SnfN8sAK0sRwR0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=nlGqmF4VWGOl7IKXEa3mrGALTj3QcP6sfA9DcpLEwP1UBxPXlVB+WRPDspFkGPfx3
	 Am9YzTaO1pVz0m0Qg6ovFC85G3BeneDB+JQFfrC+jccDAQZ4M5+Txtu7Ae0Ln3dJ4I
	 YkfO/GGXjc0+KcKL8bw/ZQHwPIi3IE+9TIBDhpig=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09R2hXOk065750
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Oct 2020 21:43:33 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 26
 Oct 2020 21:43:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 26 Oct 2020 21:43:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09R2hWNT086174;
	Mon, 26 Oct 2020 21:43:32 -0500
Date: Mon, 26 Oct 2020 22:43:32 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH 1/2] ti-rpmsg-char-examples: Fix cross compile
Message-ID: <20201027024332.GQ19741@beryl>
References: <20201025065934.3308920-1-raj.khem@gmail.com>
 <20201026212000.GO19741@beryl>
 <CAMKF1spoTDFaNBAgBmq2NV4Yx3D=UD9OK7Nb7yJUkenvnv=Smw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spoTDFaNBAgBmq2NV4Yx3D=UD9OK7Nb7yJUkenvnv=Smw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 26, 2020 at 04:24:11PM -0700, Khem Raj wrote:
> I think it should be applied but then I don't know how else this
> component is used. maybe there are some toolchains which don't have
> sysrooots used to compile this

This is meant to be cross-compiled for the target, in which case accessing 
host headers or libraries is a bad idea regardless of the toolchain...


> On Mon, Oct 26, 2020 at 2:20 PM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > On Sat, Oct 24, 2020 at 11:59:33PM -0700, Khem Raj wrote:
> > > This fixes problems during cross compile where it starts to peek into
> > > build host's include and library paths and causes errors with clang and
> > > QA warnings with gcc
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  ...-Remove-use-of-includedir-and-libdir.patch | 37 +++++++++++++++++++
> > >  recipes-ti/ipc/ti-rpmsg-char-examples_git.bb  |  2 +
> > >  2 files changed, 39 insertions(+)
> > >  create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> > >
> > > diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> > > new file mode 100644
> > > index 00000000..34807152
> > > --- /dev/null
> > > +++ b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> > > @@ -0,0 +1,37 @@
> > > +From 1a26cb577ba54dd9214eeb94fed0ce3a0f4603b6 Mon Sep 17 00:00:00 2001
> > > +From: Khem Raj <raj.khem@gmail.com>
> > > +Date: Sat, 24 Oct 2020 23:46:39 -0700
> > > +Subject: [PATCH] examples: Remove use of includedir and libdir
> > > +
> > > +These point to standard include and library paths which already are used
> > > +from sysroot relative paths secondly, they use absolute paths which
> > > +means we are asking to add -I/usr/include which might be ok in a native
> > > +build but not in cross build. This helps mitigate QA errors found with
> > > +OE build system since it finds it adding host include and library search
> > > +paths to linker/compiler commandline
> >
> > What's the Upstream-Status on this? Should it be "Inappropriate [OE-specific]"?
> >
> >
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +---
> > > + examples/Makefile.am | 5 +----
> > > + 1 file changed, 1 insertion(+), 4 deletions(-)
> > > +
> > > +diff --git a/examples/Makefile.am b/examples/Makefile.am
> > > +index 5a9bedb..d547e41 100644
> > > +--- a/examples/Makefile.am
> > > ++++ b/examples/Makefile.am
> > > +@@ -1,6 +1,4 @@
> > > +-INCLUDE = -I${includedir}
> > > +-
> > > +-AM_CFLAGS = -Wall -g -O2 $(INCLUDE)
> > > ++AM_CFLAGS = -Wall -g -O2
> > > +
> > > + bin_PROGRAMS = rpmsg_char_simple
> > > +
> > > +@@ -8,4 +6,3 @@ bin_PROGRAMS = rpmsg_char_simple
> > > + rpmsg_char_simple_SOURCES = rpmsg_char_simple.c
> > > + rpmsg_char_simple_CPPFLAGS = $(AM_CFLAGS)
> > > + rpmsg_char_simple_LDADD = -lpthread -lti_rpmsg_char
> > > +-rpmsg_char_simple_LDFLAGS = -L${libdir}
> > > +--
> > > +2.29.1
> > > +
> > > diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> > > index 142e5bf0..cbe4d7fd 100644
> > > --- a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> > > +++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> > > @@ -2,6 +2,8 @@ SUMMARY = "TI RPMsg Char Sample Applications and Tests"
> > >
> > >  require ti-rpmsg-char.inc
> > >
> > > +SRC_URI += "file://0001-examples-Remove-use-of-includedir-and-libdir.patch"
> > > +
> > >  DEPENDS = "ti-rpmsg-char"
> > >
> > >  inherit autotools pkgconfig
> > > --
> > > 2.29.1
> > >
> >
> > >
> > > 
> > >
> >

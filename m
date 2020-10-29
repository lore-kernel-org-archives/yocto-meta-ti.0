Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1165.1603994967431975201
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 11:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Rbz14q1d;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09TI9QiC062169;
	Thu, 29 Oct 2020 13:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603994966;
	bh=O9YDLWkIveU4vmm+Xx8JXiAFaSDx9A4vSS8BnbBLOiM=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=Rbz14q1dnI6oDieUNdzi6MJdVQ1zqvPCo+J95w8EPQ0hJGVX2ktupn0hvi5yF1yaq
	 RlAyAq3ng84DX3J+B/3pmtw3a8cajQ3IswL45A2OlHPKV+wfLBZ7w0JfrcbYOHAI2A
	 1otFVbXRVEtREmNiKx767WhC7Drk+xBnq0G2guo4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09TI9QDr026956
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Oct 2020 13:09:26 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 29
 Oct 2020 13:09:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 29 Oct 2020 13:09:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09TI9P3E128793;
	Thu, 29 Oct 2020 13:09:26 -0500
Date: Thu, 29 Oct 2020 14:09:25 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH 1/2] ti-rpmsg-char-examples: Fix cross compile
Message-ID: <20201029180925.GI15849@beryl>
References: <20201025065934.3308920-1-raj.khem@gmail.com>
 <20201026212000.GO19741@beryl>
 <CAMKF1spoTDFaNBAgBmq2NV4Yx3D=UD9OK7Nb7yJUkenvnv=Smw@mail.gmail.com>
 <1641B93D38E82508.16876@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <1641B93D38E82508.16876@lists.yoctoproject.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 26, 2020 at 10:43:32PM -0400, Denys Dmytriyenko via lists.yoctoproject.org wrote:
> On Mon, Oct 26, 2020 at 04:24:11PM -0700, Khem Raj wrote:
> > I think it should be applied but then I don't know how else this
> > component is used. maybe there are some toolchains which don't have
> > sysrooots used to compile this
> 
> This is meant to be cross-compiled for the target, in which case accessing 
> host headers or libraries is a bad idea regardless of the toolchain...

Khem, Suman,

Any conclusion here? Should this change be taken upstream by Suman? Or should 
this reside here as a patch with "Upstream-Status: Inappropriate [OE-specific]"?

Denys


> > On Mon, Oct 26, 2020 at 2:20 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > On Sat, Oct 24, 2020 at 11:59:33PM -0700, Khem Raj wrote:
> > > > This fixes problems during cross compile where it starts to peek into
> > > > build host's include and library paths and causes errors with clang and
> > > > QA warnings with gcc
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  ...-Remove-use-of-includedir-and-libdir.patch | 37 +++++++++++++++++++
> > > >  recipes-ti/ipc/ti-rpmsg-char-examples_git.bb  |  2 +
> > > >  2 files changed, 39 insertions(+)
> > > >  create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> > > >
> > > > diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> > > > new file mode 100644
> > > > index 00000000..34807152
> > > > --- /dev/null
> > > > +++ b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> > > > @@ -0,0 +1,37 @@
> > > > +From 1a26cb577ba54dd9214eeb94fed0ce3a0f4603b6 Mon Sep 17 00:00:00 2001
> > > > +From: Khem Raj <raj.khem@gmail.com>
> > > > +Date: Sat, 24 Oct 2020 23:46:39 -0700
> > > > +Subject: [PATCH] examples: Remove use of includedir and libdir
> > > > +
> > > > +These point to standard include and library paths which already are used
> > > > +from sysroot relative paths secondly, they use absolute paths which
> > > > +means we are asking to add -I/usr/include which might be ok in a native
> > > > +build but not in cross build. This helps mitigate QA errors found with
> > > > +OE build system since it finds it adding host include and library search
> > > > +paths to linker/compiler commandline
> > >
> > > What's the Upstream-Status on this? Should it be "Inappropriate [OE-specific]"?
> > >
> > >
> > > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > +---
> > > > + examples/Makefile.am | 5 +----
> > > > + 1 file changed, 1 insertion(+), 4 deletions(-)
> > > > +
> > > > +diff --git a/examples/Makefile.am b/examples/Makefile.am
> > > > +index 5a9bedb..d547e41 100644
> > > > +--- a/examples/Makefile.am
> > > > ++++ b/examples/Makefile.am
> > > > +@@ -1,6 +1,4 @@
> > > > +-INCLUDE = -I${includedir}
> > > > +-
> > > > +-AM_CFLAGS = -Wall -g -O2 $(INCLUDE)
> > > > ++AM_CFLAGS = -Wall -g -O2
> > > > +
> > > > + bin_PROGRAMS = rpmsg_char_simple
> > > > +
> > > > +@@ -8,4 +6,3 @@ bin_PROGRAMS = rpmsg_char_simple
> > > > + rpmsg_char_simple_SOURCES = rpmsg_char_simple.c
> > > > + rpmsg_char_simple_CPPFLAGS = $(AM_CFLAGS)
> > > > + rpmsg_char_simple_LDADD = -lpthread -lti_rpmsg_char
> > > > +-rpmsg_char_simple_LDFLAGS = -L${libdir}
> > > > +--
> > > > +2.29.1
> > > > +
> > > > diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> > > > index 142e5bf0..cbe4d7fd 100644
> > > > --- a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> > > > +++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> > > > @@ -2,6 +2,8 @@ SUMMARY = "TI RPMsg Char Sample Applications and Tests"
> > > >
> > > >  require ti-rpmsg-char.inc
> > > >
> > > > +SRC_URI += "file://0001-examples-Remove-use-of-includedir-and-libdir.patch"
> > > > +
> > > >  DEPENDS = "ti-rpmsg-char"
> > > >
> > > >  inherit autotools pkgconfig
> > > > --
> > > > 2.29.1
> > > >
> > >
> > > >
> > > > 
> > > >
> > >

> 
> 
> 


Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web09.6107.1603754679018810428
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 16:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ijTwgLNt;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id t20so5175752qvv.8
        for <meta-ti@lists.yoctoproject.org>; Mon, 26 Oct 2020 16:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YIbeTNlH9b+SvygZp9U5+rBycbAwpk+mVt7pmn7IihA=;
        b=ijTwgLNtPyaZGimprwSPY+R2UPxrsaguZU4FhdhLWsaS99Puw23ubRhPwaP3f8Zdzi
         ea2QASg2RDvGYqumUllI5/xaTe5Aw/rGEtLnZdnhxNmvXBlU93odOauPNq6wjbcIguvi
         z8zF7lOXaE/+UONSc9NbZO8vjr/ZTCH0N/C/b2vH0thtusxBF/GqOHmkT3fQ8SRpoWUW
         C2PN5TiOwlkQTuiLRjs2IgCKSDaLVZSHoZVypRVsVIRCuHgPdApHAHSiXm7tcAbwal/g
         KeWen54sYIaS6E3LxrUcHeIGBfBunMZrrc9ja7ySCR3KJJ8YfT7nabLjVJMi6ic4SlCT
         /bEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YIbeTNlH9b+SvygZp9U5+rBycbAwpk+mVt7pmn7IihA=;
        b=nhmvKZS4KQZA2hIJVU6O8msMWklBUVgLWnZ8FNMN2PcNYuH7TkIwcVaTTlNOMA5f75
         CFsjbCJ+8WMweeckZD5jvcVN22BCYxmraoEZu7MhEWmHb4tSldxlt6ZN9nnDlLD+IP/s
         7i9zYMkt3VmnYHoBHX6pMD8Z2nlzCG8rdmE5+P6AfieNpq9J+EyAwS8MoQgSbGTx5nye
         hTBGGDxu2nuC6AnJsyo5bEWiwDOnBxad6dbJ7KGRXgSiTwULEvNHxA7nJI4h6bNC5RYI
         SWhPr4iti9Xp9unMeNprxdgY/ovjXo+TR4vo7buxGu42CptTozVg5G701e1GzD7xRAho
         6ftg==
X-Gm-Message-State: AOAM532IfPaQ3GzmbdDZhP9p7gc3AnnMtTPZD5nLf8FPisvshY2MtsAL
	65mODDglwRnSiWvUkW1ep2uSz7Oe5+jHWNVbUKQ=
X-Google-Smtp-Source: ABdhPJwZgqcFnpIKv7NMlIh4G7ityDFFRHimed3r1kAZRWihunxFfeHWbPbewl3Gigr/wM6t6JUig/eU0oXUv5RGgRk=
X-Received: by 2002:a0c:b65b:: with SMTP id q27mr261753qvf.8.1603754678010;
 Mon, 26 Oct 2020 16:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201025065934.3308920-1-raj.khem@gmail.com> <20201026212000.GO19741@beryl>
In-Reply-To: <20201026212000.GO19741@beryl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 26 Oct 2020 16:24:11 -0700
Message-ID: <CAMKF1spoTDFaNBAgBmq2NV4Yx3D=UD9OK7Nb7yJUkenvnv=Smw@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH 1/2] ti-rpmsg-char-examples: Fix cross compile
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

I think it should be applied but then I don't know how else this
component is used. maybe there are some toolchains which don't have
sysrooots used to compile this

On Mon, Oct 26, 2020 at 2:20 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Sat, Oct 24, 2020 at 11:59:33PM -0700, Khem Raj wrote:
> > This fixes problems during cross compile where it starts to peek into
> > build host's include and library paths and causes errors with clang and
> > QA warnings with gcc
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...-Remove-use-of-includedir-and-libdir.patch | 37 +++++++++++++++++++
> >  recipes-ti/ipc/ti-rpmsg-char-examples_git.bb  |  2 +
> >  2 files changed, 39 insertions(+)
> >  create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> >
> > diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> > new file mode 100644
> > index 00000000..34807152
> > --- /dev/null
> > +++ b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> > @@ -0,0 +1,37 @@
> > +From 1a26cb577ba54dd9214eeb94fed0ce3a0f4603b6 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sat, 24 Oct 2020 23:46:39 -0700
> > +Subject: [PATCH] examples: Remove use of includedir and libdir
> > +
> > +These point to standard include and library paths which already are used
> > +from sysroot relative paths secondly, they use absolute paths which
> > +means we are asking to add -I/usr/include which might be ok in a native
> > +build but not in cross build. This helps mitigate QA errors found with
> > +OE build system since it finds it adding host include and library search
> > +paths to linker/compiler commandline
>
> What's the Upstream-Status on this? Should it be "Inappropriate [OE-specific]"?
>
>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + examples/Makefile.am | 5 +----
> > + 1 file changed, 1 insertion(+), 4 deletions(-)
> > +
> > +diff --git a/examples/Makefile.am b/examples/Makefile.am
> > +index 5a9bedb..d547e41 100644
> > +--- a/examples/Makefile.am
> > ++++ b/examples/Makefile.am
> > +@@ -1,6 +1,4 @@
> > +-INCLUDE = -I${includedir}
> > +-
> > +-AM_CFLAGS = -Wall -g -O2 $(INCLUDE)
> > ++AM_CFLAGS = -Wall -g -O2
> > +
> > + bin_PROGRAMS = rpmsg_char_simple
> > +
> > +@@ -8,4 +6,3 @@ bin_PROGRAMS = rpmsg_char_simple
> > + rpmsg_char_simple_SOURCES = rpmsg_char_simple.c
> > + rpmsg_char_simple_CPPFLAGS = $(AM_CFLAGS)
> > + rpmsg_char_simple_LDADD = -lpthread -lti_rpmsg_char
> > +-rpmsg_char_simple_LDFLAGS = -L${libdir}
> > +--
> > +2.29.1
> > +
> > diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> > index 142e5bf0..cbe4d7fd 100644
> > --- a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> > +++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> > @@ -2,6 +2,8 @@ SUMMARY = "TI RPMsg Char Sample Applications and Tests"
> >
> >  require ti-rpmsg-char.inc
> >
> > +SRC_URI += "file://0001-examples-Remove-use-of-includedir-and-libdir.patch"
> > +
> >  DEPENDS = "ti-rpmsg-char"
> >
> >  inherit autotools pkgconfig
> > --
> > 2.29.1
> >
>
> >
> > 
> >
>

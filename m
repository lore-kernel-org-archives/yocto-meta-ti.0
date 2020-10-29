Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.3097.1604002192209657004
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 13:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nRvAru+U;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id j129so3073093qke.5
        for <meta-ti@lists.yoctoproject.org>; Thu, 29 Oct 2020 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L4Jqbi3wJzNa7c96o+t+97wt8Sj90VvFA/dTiE8/D+Q=;
        b=nRvAru+UUv3QhxKCJB1wDnr1B81Fya7f3BFLMry7YhbE7LDbqvSw6XxodFohzb/kQQ
         0QKy4LWJacpgs9yLkd6Rxj+2KPzhR0hw5VYSlVpgU8nhs1E45DmZBO807wl+RIkFJ3Tn
         rCIQDWHL2H8s1mki+cF8idTd5H75YeC0pltyYK7RLn52dj8I0Ie2Rm2JIpgRSSeVcBdH
         SGwrJdHRQGaTznrqZF4WmGwOAUQj591X4yRMELrR/z3od1DIZu3HwXc8wxX5aGJnKHcp
         NBnUVUIt6h3QZjdilNMav1o8SwoVd2ff0BCvdsWjbGxZtLKDtuxs1O6WV/9ptMIoqjLJ
         c/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L4Jqbi3wJzNa7c96o+t+97wt8Sj90VvFA/dTiE8/D+Q=;
        b=K0AETLRC0kUtpfJ1AMZXl31c/L476K6bgyKq3hNfm6UG1VOtDZ46WqjwcmMeLMj7lH
         d5mseNrwfCBcBdyORYzSWi7v2chFD4EjIT1obgTYC+UjDTeT3ltDSLVN2oBfwfLlLAKo
         gJtrLNya8BdJktK1Fw4Qt2EyUSzWCuHA4cKRy4JYe7lHEetigSlvUnB6gQ8yBdCd4QVv
         OzEs8BImDE3fZbw9ZlwLGo+tfXL16KtbgMzxH8iCQCNJCMCfgwvhG4csO0uTzDWvzPPp
         cRnjIY4KCxanvM5TtEPUwBkLDmEVUEi/CSO1wevb1Xr89nmPcs+NCVibnF9DgEn8LANp
         65tA==
X-Gm-Message-State: AOAM533I5wAWghsxQ6gVK5AM8lRgLbV3Hl57wHtxhXrMFB3I6AJ3CD+Y
	L279o5zJw8rVIT0YjUFu6iBBNJc0stskkuckB3M=
X-Google-Smtp-Source: ABdhPJz8FKogNBT6zGt3Rcv3tGA26nvq3fAgczPveCMH3pboTBrdtzbvD3X/FERuwj48Pp+6H+xqB4grsqz6CED7vyM=
X-Received: by 2002:a05:620a:16cb:: with SMTP id a11mr5460385qkn.474.1604002191158;
 Thu, 29 Oct 2020 13:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201025065934.3308920-1-raj.khem@gmail.com> <20201026212000.GO19741@beryl>
 <CAMKF1spoTDFaNBAgBmq2NV4Yx3D=UD9OK7Nb7yJUkenvnv=Smw@mail.gmail.com>
 <1641B93D38E82508.16876@lists.yoctoproject.org> <20201029180925.GI15849@beryl>
In-Reply-To: <20201029180925.GI15849@beryl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 29 Oct 2020 13:09:25 -0700
Message-ID: <CAMKF1srgwQaoEWowG11HfJN+vo2+tBHm4Bhr0K5VP6YXa6f+Cg@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH 1/2] ti-rpmsg-char-examples: Fix cross compile
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2020 at 11:09 AM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Mon, Oct 26, 2020 at 10:43:32PM -0400, Denys Dmytriyenko via lists.yoctoproject.org wrote:
> > On Mon, Oct 26, 2020 at 04:24:11PM -0700, Khem Raj wrote:
> > > I think it should be applied but then I don't know how else this
> > > component is used. maybe there are some toolchains which don't have
> > > sysrooots used to compile this
> >
> > This is meant to be cross-compiled for the target, in which case accessing
> > host headers or libraries is a bad idea regardless of the toolchain...
>
> Khem, Suman,
>
> Any conclusion here? Should this change be taken upstream by Suman? Or should
> this reside here as a patch with "Upstream-Status: Inappropriate [OE-specific]"?
>

its needed in OE for sure. Other places I don't know so literally your call.

> Denys
>
>
> > > On Mon, Oct 26, 2020 at 2:20 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > >
> > > > On Sat, Oct 24, 2020 at 11:59:33PM -0700, Khem Raj wrote:
> > > > > This fixes problems during cross compile where it starts to peek into
> > > > > build host's include and library paths and causes errors with clang and
> > > > > QA warnings with gcc
> > > > >
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > ---
> > > > >  ...-Remove-use-of-includedir-and-libdir.patch | 37 +++++++++++++++++++
> > > > >  recipes-ti/ipc/ti-rpmsg-char-examples_git.bb  |  2 +
> > > > >  2 files changed, 39 insertions(+)
> > > > >  create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> > > > >
> > > > > diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> > > > > new file mode 100644
> > > > > index 00000000..34807152
> > > > > --- /dev/null
> > > > > +++ b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> > > > > @@ -0,0 +1,37 @@
> > > > > +From 1a26cb577ba54dd9214eeb94fed0ce3a0f4603b6 Mon Sep 17 00:00:00 2001
> > > > > +From: Khem Raj <raj.khem@gmail.com>
> > > > > +Date: Sat, 24 Oct 2020 23:46:39 -0700
> > > > > +Subject: [PATCH] examples: Remove use of includedir and libdir
> > > > > +
> > > > > +These point to standard include and library paths which already are used
> > > > > +from sysroot relative paths secondly, they use absolute paths which
> > > > > +means we are asking to add -I/usr/include which might be ok in a native
> > > > > +build but not in cross build. This helps mitigate QA errors found with
> > > > > +OE build system since it finds it adding host include and library search
> > > > > +paths to linker/compiler commandline
> > > >
> > > > What's the Upstream-Status on this? Should it be "Inappropriate [OE-specific]"?
> > > >
> > > >
> > > > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > +---
> > > > > + examples/Makefile.am | 5 +----
> > > > > + 1 file changed, 1 insertion(+), 4 deletions(-)
> > > > > +
> > > > > +diff --git a/examples/Makefile.am b/examples/Makefile.am
> > > > > +index 5a9bedb..d547e41 100644
> > > > > +--- a/examples/Makefile.am
> > > > > ++++ b/examples/Makefile.am
> > > > > +@@ -1,6 +1,4 @@
> > > > > +-INCLUDE = -I${includedir}
> > > > > +-
> > > > > +-AM_CFLAGS = -Wall -g -O2 $(INCLUDE)
> > > > > ++AM_CFLAGS = -Wall -g -O2
> > > > > +
> > > > > + bin_PROGRAMS = rpmsg_char_simple
> > > > > +
> > > > > +@@ -8,4 +6,3 @@ bin_PROGRAMS = rpmsg_char_simple
> > > > > + rpmsg_char_simple_SOURCES = rpmsg_char_simple.c
> > > > > + rpmsg_char_simple_CPPFLAGS = $(AM_CFLAGS)
> > > > > + rpmsg_char_simple_LDADD = -lpthread -lti_rpmsg_char
> > > > > +-rpmsg_char_simple_LDFLAGS = -L${libdir}
> > > > > +--
> > > > > +2.29.1
> > > > > +
> > > > > diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> > > > > index 142e5bf0..cbe4d7fd 100644
> > > > > --- a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> > > > > +++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> > > > > @@ -2,6 +2,8 @@ SUMMARY = "TI RPMsg Char Sample Applications and Tests"
> > > > >
> > > > >  require ti-rpmsg-char.inc
> > > > >
> > > > > +SRC_URI += "file://0001-examples-Remove-use-of-includedir-and-libdir.patch"
> > > > > +
> > > > >  DEPENDS = "ti-rpmsg-char"
> > > > >
> > > > >  inherit autotools pkgconfig
> > > > > --
> > > > > 2.29.1
> > > > >
> > > >
> > > > >
> > > > >
> > > > >
> > > >
>
> >
> > 
> >
>

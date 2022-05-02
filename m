Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D144BC4332F
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 19:12:37 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web08.1552.1651518749236733888
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 12:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=flPy2hgs;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id jt15so1682531qvb.8
        for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 12:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1pHEhpnqbeetSGdPVkSkLsFlIXeUtI7AfoZXUDFcdMA=;
        b=flPy2hgsJG9M6oqDkFrNeR215zQfqNCvkp6jgTLXzxRLJhJq6/yvw8lvXGBLpdq7tW
         BtPc87yXea9oj0QaZx1z9UMHHjporMsknA/EC/QgPryC2FsG7uileKi2JQaHXzzX37fR
         QLrmj15wS4XVGWmOkT8hOOndKkPxBrV/K1v8DO9oF/U/5mk897kZBZ5u4EhyHyY3A/on
         u69CPSyfajL7ah042DEW+3I60gMLrxOmCWfuXBo16+GlEPLoGfydTKxaiLdE+Yc+K4nE
         3IOczCDR0gJ/ln+xfJqBu+I4IuZVrz2QwSwtxe/N0nIXNnQW1cYji821ImG6yqUEOL+V
         sekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1pHEhpnqbeetSGdPVkSkLsFlIXeUtI7AfoZXUDFcdMA=;
        b=HHe18HVmj5e8bYfJPSpg61CVM0DV3nziaeOctViEbr4c777BCG0SaG7fiM775wJMJq
         rjWIN31gdkG6rEikiUXgu02RKfgLi7jWARUiq7zVbvCgooEAJQWXoq084EOY+Jf603kc
         peidJl12VQy4Dc9t/+/rkYcKRDbr0wwzcVP8AtYf96eSV7dYbYAVfHrzsGzi4NAU3wpM
         Q3rXxz3s2aTPKtevILIG4+ymzJknxGyUi4bHiWQZ63VRZ1rtX4aUb6j6UGeNKSk0fH2g
         JBOkiyzniBR5jQDp8EF6sRtRbbEu7drBPe1ipk2ohZcurcC9biKoeZzo7eSCcgouPwv7
         OIRw==
X-Gm-Message-State: AOAM532GxLJbDQxo6aZqVGtFeUq1NkROf0Iuu4XDvM7dxdDbfmHSP4wZ
	nBH9I5UYgwEIBerq79ezOmZ6QdN25qyBye+vwp4=
X-Google-Smtp-Source: 
 ABdhPJykSViK4qzhdWMtWba82weN3xcXBEhZetjwzU+KZMF6Hzpi2eJTwR30mw86MaCWxIMpwyk4ssHTLSbB4bcuczE=
X-Received: by 2002:a05:6214:410c:b0:45a:7a94:ee04 with SMTP id
 kc12-20020a056214410c00b0045a7a94ee04mr9344170qvb.63.1651518748171; Mon, 02
 May 2022 12:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220501164920.2828087-1-raj.khem@gmail.com>
 <53c2b96d-676c-e4b7-6f74-33f1211e8912@ti.com>
 <20220502182404.GV9834@denix.org>
 <1aa11cce-610d-9b24-09ce-b540f4ed2bf5@ti.com>
In-Reply-To: <1aa11cce-610d-9b24-09ce-b540f4ed2bf5@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 May 2022 12:12:02 -0700
Message-ID: 
 <CAMKF1sqmoNSSxwKfRuf42PzjtpLeX7xp4p+M+_hALqpdusQzSw@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] uio-module-drv-test: Fix build with clang
To: Ryan Eatmon <reatmon@ti.com>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 19:12:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14677

On Mon, May 2, 2022 at 11:29 AM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
>
> On 5/2/2022 13:24, Denys Dmytriyenko wrote:
> > On Mon, May 02, 2022 at 12:59:59PM -0500, Ryan Eatmon via lists.yoctopr=
oject.org wrote:
> >>
> >> Was this patch sent to the upstream repository maintainer?  This
> >> seems like a very basic change that should work for all compilers
> >> and so should be pushed upstream.
> >
> > If only the upstream project was still alive:
> >
> > https://git.ti.com/cgit/keystone-linux/uio-module-drv/
> >
> > This code is used for PRU using UIO on AM3/BBB, AM4, AM5 and DRA7.
>
> Yeah, I'm realizing that now and attempting to manually make the same
> changes and commit them.  Then we can change the SRCREV to point to the
> new version.

Thanks

>
> >
> >> On 5/1/2022 11:49, Khem Raj wrote:
> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ---
> >>>   ...-instead-of-int8_t-in-main-signature.patch | 89 ++++++++++++++++=
+++
> >>>   .../uio-module-drv/uio-module-drv-test_git.bb |  4 +
> >>>   2 files changed, 93 insertions(+)
> >>>   create mode 100644 meta-ti-bsp/recipes-bsp/uio-module-drv/uio-modul=
e-drv-test/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch
> >>>
> >>> diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-te=
st/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch b/meta-ti-=
bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001-tests-Use-char-inst=
ead-of-int8_t-in-main-signature.patch
> >>> new file mode 100644
> >>> index 00000000..172ed7cb
> >>> --- /dev/null
> >>> +++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001=
-tests-Use-char-instead-of-int8_t-in-main-signature.patch
> >>> @@ -0,0 +1,89 @@
> >>> +From 972b8514cc99e76508363d2304bb13c27df99cd6 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Sun, 1 May 2022 09:39:42 -0700
> >>> +Subject: [PATCH] tests: Use char instead of int8_t in main signature
> >>> +
> >>> +int8_t is a define in C99 which is flagged by C compiler ( clang )
> >>> +
> >>> +Fixes errors like below
> >>> +
> >>> +pruss_uio_test.c:264:6: error: second parameter of 'main' (argument =
array) must be of type 'char **'
> >>> +void main (int32_t argc, int8_t **argv)
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + test/gen_ipc_int.c                       | 2 +-
> >>> + test/prussdrv_test/test/pruss_uio_test.c | 2 +-
> >>> + test/uio_cic2_int_multithread_test.c     | 2 +-
> >>> + test/uio_int_test.c                      | 2 +-
> >>> + test/uio_mem_test.c                      | 2 +-
> >>> + 5 files changed, 5 insertions(+), 5 deletions(-)
> >>> +
> >>> +diff --git a/test/gen_ipc_int.c b/test/gen_ipc_int.c
> >>> +index 2be3a9d..313c76a 100644
> >>> +--- a/test/gen_ipc_int.c
> >>> ++++ b/test/gen_ipc_int.c
> >>> +@@ -26,7 +26,7 @@ static int64_t clock_diff (struct timespec *start,=
 struct timespec *end)
> >>> +              + end->tv_nsec - start->tv_nsec;
> >>> + }
> >>> +
> >>> +-void main(int32_t argc, int8_t **argv)
> >>> ++void main(int32_t argc, char **argv)
> >>> + {
> >>> +   int size;
> >>> +   char *map ;
> >>> +diff --git a/test/prussdrv_test/test/pruss_uio_test.c b/test/prussdr=
v_test/test/pruss_uio_test.c
> >>> +index 5af4a2c..7391fbd 100644
> >>> +--- a/test/prussdrv_test/test/pruss_uio_test.c
> >>> ++++ b/test/prussdrv_test/test/pruss_uio_test.c
> >>> +@@ -261,7 +261,7 @@ int bsp_init()
> >>> +
> >>> + }
> >>> +
> >>> +-void main (int32_t argc, int8_t **argv)
> >>> ++void main (int32_t argc, char **argv)
> >>> + {
> >>> +     int ret_val;
> >>> +
> >>> +diff --git a/test/uio_cic2_int_multithread_test.c b/test/uio_cic2_in=
t_multithread_test.c
> >>> +index 0d9f126..15db958 100755
> >>> +--- a/test/uio_cic2_int_multithread_test.c
> >>> ++++ b/test/uio_cic2_int_multithread_test.c
> >>> +@@ -287,7 +287,7 @@ void *wait_inthread_for_interrupt(void *arg)
> >>> +   }
> >>> + }
> >>> +
> >>> +-void main(int32_t argc, int8_t **argv)
> >>> ++void main(int32_t argc, char **argv)
> >>> + {
> >>> +   thread_arg_t thread_arg[MAX_NUM_THREADS];
> >>> +   int ret, err;
> >>> +diff --git a/test/uio_int_test.c b/test/uio_int_test.c
> >>> +index 7095a0a..e0ba5a9 100644
> >>> +--- a/test/uio_int_test.c
> >>> ++++ b/test/uio_int_test.c
> >>> +@@ -161,7 +161,7 @@ static int64_t clock_diff (struct timespec *star=
t, struct timespec *end)
> >>> +              + end->tv_nsec - start->tv_nsec;
> >>> + }
> >>> +
> >>> +-void main(int32_t argc, int8_t **argv)
> >>> ++void main(int32_t argc, char **argv)
> >>> + {
> >>> +   int  fd_uio;
> >>> +   int ret;
> >>> +diff --git a/test/uio_mem_test.c b/test/uio_mem_test.c
> >>> +index aad13ac..3cdba37 100644
> >>> +--- a/test/uio_mem_test.c
> >>> ++++ b/test/uio_mem_test.c
> >>> +@@ -121,7 +121,7 @@ err_exit1:
> >>> +   return ret;
> >>> + }
> >>> +
> >>> +-void main(int32_t argc, int8_t **argv)
> >>> ++void main(int32_t argc, char **argv)
> >>> + {
> >>> +   int  fd_map;
> >>> +   int ret;
> >>> +--
> >>> +2.36.0
> >>> +
> >>> diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-te=
st_git.bb b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.=
bb
> >>> index dc17a1e9..41270042 100644
> >>> --- a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.=
bb
> >>> +++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.=
bb
> >>> @@ -2,6 +2,8 @@ DESCRIPTION =3D "Test code for user space IO (UIO) dr=
iver"
> >>>   include uio-module-drv.inc
> >>> +SRC_URI +=3D "file://0001-tests-Use-char-instead-of-int8_t-in-main-s=
ignature.patch"
> >>> +
> >>>   PR =3D "r1"
> >>>   COMPATIBLE_MACHINE =3D "omap-a15|ti33x|ti43x"
> >>> @@ -33,3 +35,5 @@ do_install:append:ti33x () {
> >>>   do_install:append:ti43x () {
> >>>           install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_te=
st ${D}${bindir}/.
> >>>   }
> >>> +
> >>> +CLEANBROKEN =3D "1"
> >>>
> >>>
> >>>
> >>>
> >>>
> >>
> >> --
> >> Ryan Eatmon                reatmon@ti.com
> >> -----------------------------------------
> >> Texas Instruments, Inc.  -  LCPD  -  MGTS
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C624C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 21:58:50 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.2085.1721167128369627242
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 14:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DdIoVBMY;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2598001aae7so3132030fac.2
        for <meta-ti@lists.yoctoproject.org>; Tue, 16 Jul 2024 14:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721167127; x=1721771927; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5daXV9/j9BsD5mqTCa1JE1U6nFuXRRA2x4W93K7PlHA=;
        b=DdIoVBMY4F+YIViuRGiYFHcsijSYwFWBl9UYyeA55OHb88ssBQlfdTxmGfHkO5Y+Le
         CzCKNl8hviRRD5VFsgh35kYcyWLKV8DN4yWEQZwsqmqBEo4mkrntRYActgL7c5vs+h6z
         IWUeW8L4xd0OA/ZJA+uYGDTEkxOxxHl14yRymZ+mEuCOYDAyH0/MoRE+PyJyZ5NUnfHT
         sL+RItI95/j2DXaOpCwctpfQ3B2zojSQk0SRbHNJE+AEm42LthxjdRkTi6wJuKKdxfYt
         K0wvU/Z3QlAukXoXcpwIHVGTZZz9C+S7+7+/8eEARE86cxkqVKf1OQBII2ZNQ1di+i7r
         /4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721167127; x=1721771927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5daXV9/j9BsD5mqTCa1JE1U6nFuXRRA2x4W93K7PlHA=;
        b=hvbdN3k+9YgC3rqXWwCknsTooDB3UfGOv6cxF/TeZoOWVTB98bkFgiGNAzAl/cZ+FV
         vKFYeBMwIIJqqoJczjC1BPWC8AeBnpiHuml924OLieznm+ol9PtbK+5izu1b5hcqhjOt
         bBj/qwQx1pQ0Usa0en1qskxqRqiWxm/uoTySa5BdaXsbUhU628VBN4FveqHjWUU+6b1+
         HpHM/lZt25aSxjNZ7muKkzc/aTT0l5G+CtxZaNFdcVtNfmGFNXC0DeaIIVmo7F1px6uM
         Y6KZw+DwLWxJ7uFoXG+Btkc1Dq+tmw/fw4WrRkwup5gHblJO0Es7xqyb5KdQFF36v9Pb
         lgtg==
X-Forwarded-Encrypted: i=1; AJvYcCVkkr9SQP2XpPkZIYBZzJgcodYtJ7LSJq/COMacafdxx4eAlVnLWqKD9VlmrWNppjJ2lMS+qCVWAbPZ5B69mcBNn8kKbVusbLevQpNA/OQ=
X-Gm-Message-State: AOJu0YyqNBHnbCRYQLswHNy0Vq5kbMrr4znJjnWvLtZ/qbkMUfrS1vZS
	nLi9hXJ8xnhLD1iBDmZKKVmYOV6bHmxReXS4WdQMyI+2QjOfJTt33QLK4391DSSegWbt0qPOmqo
	ZQm3jpVuM/WlNjMsHs70TFIZPW5g=
X-Google-Smtp-Source: AGHT+IFugKOsOX8LQTiJm0EaFP+9VfaNK0xuOpxWOVxUCs1h7rxWPxjiVU0oogMAts4jAnCBIpbNFpDf3wLsADYoqBw=
X-Received: by 2002:a05:6870:3324:b0:25e:4526:f6e4 with SMTP id
 586e51a60fabf-260bde5bcf6mr2962442fac.27.1721167127543; Tue, 16 Jul 2024
 14:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240716194532.26124-1-reatmon@ti.com>
In-Reply-To: <20240716194532.26124-1-reatmon@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jul 2024 14:58:21 -0700
Message-ID: <CAMKF1sqYD1BRcqxR=K9VsfXnWnqOTvS5H4de2qQ1mvj2qTcnkw@mail.gmail.com>
Subject: Re: [meta-ti][master][PATCH] ti-ipc: Fix "buildpaths" QA error
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Jul 2024 21:58:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17869

On Tue, Jul 16, 2024 at 12:45=E2=80=AFPM Ryan Eatmon via
lists.yoctoproject.org <reatmon=3Dti.com@lists.yoctoproject.org> wrote:
>
> Referring to the TI specific kernel header file via -I${UNPACKDIR}
> causes a "buildpaths" QA error.  Solution is to copy the file from
> UNPACKDIR into the S dir at the start of each compile, and then fix the
> patch to make sure the #include is correct for this new location.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...1-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch | 2 +-
>  meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb                    | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-fo=
r-rpmsg_rpc.h-in-the-kernel.patch b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-=
MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch
> index 522ad5e4..6d84cfb4 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg=
_rpc.h-in-the-kernel.patch
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg=
_rpc.h-in-the-kernel.patch
> @@ -26,7 +26,7 @@ index 2df7420..10f496b 100644
>   #endif
>
>  -#include linux_include(KERNEL_INSTALL_DIR,rpmsg_rpc)
> -+#include "linux/rpmsg_rpc.h"
> ++#include "rpmsg_rpc.h"
>
>   #ifdef _linux_
>   #define linux _linux
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recip=
es-ti/ipc/ti-ipc_git.bb
> index 11be09ea..e12ce273 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
> @@ -18,8 +18,6 @@ SRC_URI +=3D "file://tiipclad-daemon.sh \
>              file://0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel=
.patch \
>             "
>
> -CFLAGS +=3D "-I${UNPACKDIR}=3D"
> -

Perhaps adding  -fdebug-prefix-map=3D${UNPACKDIR}=3D${TARGET_DBGSRC_DIR}
in CFLAGS is all you need.

>  DAEMON =3D "UNKNOWN"
>  DAEMON:dra7xx =3D "lad_dra7xx"
>  DAEMON:omapl138 =3D "lad_omapl138"
> @@ -40,6 +38,10 @@ do_configure() {
>      oe_runconf
>  }
>
> +do_compile:prepend() {
> +    cp ${UNPACKDIR}/linux/rpmsg_rpc.h ${S}/packages/ti/ipc/mm/rpmsg_rpc.=
h
> +}
> +
>  do_install:append() {
>      install -d ${D}${sysconfdir}/init.d/
>
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17868): https://lists.yoctoproject.org/g/meta-ti/mess=
age/17868
> Mute This Topic: https://lists.yoctoproject.org/mt/107259201/1997914
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [raj.khem@gma=
il.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


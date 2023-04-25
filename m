Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776EDC77B61
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 16:44:19 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.85062.1682441055802045180
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Apr 2023 09:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@foundries.io header.s=google header.b=hLjtEuey;
 spf=pass (domain: foundries.io, ip: 209.85.208.171, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2a8bb726210so57400281fa.1
        for <meta-ti@lists.yoctoproject.org>; Tue, 25 Apr 2023 09:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1682441054; x=1685033054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaSzXEWrVJvMC4dbaEgcYWUdabraqaEnoPlI5YAEkag=;
        b=hLjtEueyQnbpcd6QyOETtm21JsbkqJNLJwFFUU9wkjbOv/Jontmsffgdtrn1KN6nQt
         XUh57AppFd0VI5k5FVKGG3eSBIMD6081VFVLX5+bckM98/wWNze9+t4gWXfzaNpnMMxT
         lw7Farp6OL8LxlUWxBqDOMlP6YqMmJeNrIvkdHSj1ZecCh6JOnh22Gcb6aOgtEmQS0TR
         Apwnir6MxMnEvN2p0RLuigHbDtaMern6qxFH/aZtt3VZmMQJi7rL8yIlt3ftdaqSn0Vn
         Ntiz9F03+gZ4eyBoDpUonKG7W8pOjPfBQKgDeKS9K59Gcj89496AA5/9Ikj7anwpyyZy
         hrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682441054; x=1685033054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaSzXEWrVJvMC4dbaEgcYWUdabraqaEnoPlI5YAEkag=;
        b=PHJCv4nJA/mChTeOfIj75tXs8PUlrMcHtDfvo+5C/wNPV9WEUl12wQsPSvU1t6Zoc9
         62F6+qMtOZwELkmLaLRgN3U9sx3/dofebDuYLAkvIcU/e+rhElAFX6AsZGhuoOoptZs6
         Q+WWNPDKlZg+Yas8EDFQCnKl9DVjWyUu58qreplYvJXGVJvLKaMnrSs8cIAxglh5v+4J
         7uOYp8QdXKYHUmPdbOGrWKOr7UfM8G6Uz/Cfx2QddZAmgsx+V+PA8l4n9qN2nhaalGC2
         5qlpQeelKSMFhW82eAQFSVjFh6ZMdPoJggKM0W9TItFOpHX8rvWETX3B7xKtT/9izMh3
         0zZA==
X-Gm-Message-State: AAQBX9dINlp9j+poIi7+NrP7Qtp1nazzUfiHFaIwARU+T9P+Z9ZhIHxX
	tRWvP6nj4OkcZXftjnsZCVh6ImlgBYPJMOxeXgH+
X-Google-Smtp-Source: AKy350Yqf2weSR5UB8U7mDq/3jJ3xCivTYPKJ3q1x5ErbSrGLlaPmCPHByA9ljxI7WshBLfX9qvUZopvQhrbQuww2Ug=
X-Received: by 2002:a2e:8857:0:b0:2a7:7b8e:5888 with SMTP id
 z23-20020a2e8857000000b002a77b8e5888mr4238046ljj.27.1682441053777; Tue, 25
 Apr 2023 09:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230425104017.31350-1-p-bhagat@ti.com> <6ab786ba-f60c-f13a-81aa-00fab818b8c2@ti.com>
In-Reply-To: <6ab786ba-f60c-f13a-81aa-00fab818b8c2@ti.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Tue, 25 Apr 2023 13:43:36 -0300
Message-ID: <CAAaKDhE=Vy-Ksq1Unvq2g=AMmfmFJ-f14Arw3F_oJnePj1RKbw@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone][PATCH] Add recipe and patches for jailhouse
 support for am62xx
To: reatmon@ti.com
Cc: paresh-ti <p-bhagat@ti.com>, meta-ti@lists.yoctoproject.org, praneeth@ti.com, 
	c-shilwant@ti.com, s-adivi@ti.com, g-gupta@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Apr 2023 16:44:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16417

On Tue, Apr 25, 2023 at 11:22=E2=80=AFAM Ryan Eatmon via
lists.yoctoproject.org <reatmon=3Dti.com@lists.yoctoproject.org> wrote:
> On 4/25/2023 5:40, paresh-ti wrote:
> > - Add and enable Jailhouse support for TI's k3-am625-sk similarly to ho=
w other
> > TI platforms were added and enabled in the past by adding platform-spec=
ific
> > configuration variables for the root cell DTB overlay, and the Linux de=
mo inmate
> > DTB, configuration, and Kernel command line settings.
> >
> > - Migrate the old recipe to kirkstone.
> >
> > - Switch to latest upstream source tree for jailhouse. The TI Jailhouse=
 repo has
> > gone stale and now upstream is really the happening place where new dev=
elopment
> > happens including for new devices such as AM62x. Hence go ahead and swi=
tch to
> > using the upstream repo.
> >
> > - Update the platform-specific config files to such that the root cell =
DTB overlay
> > gets included in the file system images.
> >
> > - Enable additional console on ttyS3 (usually mapped to main_uart1) and=
 ttyS2 for
> > the Linux demo inmate to use.
> >
> > - Add patches for the Jailhouse source tree for am62x.
> >
> > Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> > Signed-off-by: paresh-ti <p-bhagat@ti.com>
> > ---
> >   meta-ti-bsp/conf/machine/include/am62xx.inc   |   3 +
> >   ...k3-am625-sk-Add-crypto-memory-region.patch |  50 +++++
> >   ...-am625-sk-Switch-inmate-boot-console.patch |  60 +++++
> >   ...64-k3-am625-sk-Add-VTM-memory-region.patch |  40 ++++
> >   ...4-k3-am625-sk-Add-GPMC-memory-region.patch |  47 ++++
> >   .../recipes-ti/jailhouse/jailhouse-arch.inc   |  22 ++
> >   .../recipes-ti/jailhouse/jailhouse_git.bb     | 209 +++++++++++++++++=
+
> >   7 files changed, 431 insertions(+)
> >   create mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0001-con=
figs-arm64-k3-am625-sk-Add-crypto-memory-region.patch
> >   create mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0002-con=
figs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch
> >   create mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0003-con=
figs-arm64-k3-am625-sk-Add-VTM-memory-region.patch
> >   create mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0004-con=
figs-arm64-k3-am625-sk-Add-GPMC-memory-region.patch
> >   create mode 100644 meta-ti-extras/recipes-ti/jailhouse/jailhouse-arch=
.inc
> >   create mode 100644 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.=
bb
> >
> > diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/=
conf/machine/include/am62xx.inc
> > index 623d90eb..a205a18c 100644
> > --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
> > +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
> > @@ -23,3 +23,6 @@ TFA_BOARD =3D "lite"
> >   TFA_K3_SYSTEM_SUSPEND =3D "1"
> >
> >   OPTEEMACHINE =3D "k3-am62x"
> > +
> > +# Normally AM62 boards use ttyS2, but our Jailhouse inmate may use tty=
S3, so try both
> > +SERIAL_CONSOLES =3D "115200;ttyS2 115200;ttyS3"
> > diff --git a/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-arm=
64-k3-am625-sk-Add-crypto-memory-region.patch b/meta-ti-extras/recipes-ti/j=
ailhouse/files/0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patc=
h
> > new file mode 100644
> > index 00000000..d37631f9
> > --- /dev/null
> > +++ b/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-arm64-k3-a=
m625-sk-Add-crypto-memory-region.patch
> > @@ -0,0 +1,49 @@
> > +From 723ca87d25c1f8bac68d2608dbc3b5e8caba69ca Mon Sep 17 00:00:00 2001
> > +From: Andreas Dannenberg <dannenberg@ti.com>
> > +Date: Mon, 12 Sep 2022 13:22:04 -0500
> > +Subject: [PATCH] configs: arm64: k3-am625-sk: Add crypto memory region
> > +
> > +Add the memory region for the AM62x crypto accelerator to the device-
> > +specific config file. This fixes a runtime exception when the kernel
> > +accesses that memory region:
> > +
> > +<snip>
> > +Unhandled data read at 0x40910010(4)
> > +
> > +FATAL: unhandled trap (exception class 0x24)
> > +<snip>
> > +
> > +Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
>
> All of these patches need Upstream-Status.  Please add them.
>
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_H=
eader_Recommendations:_Upstream-Status

You can find the ones I sent upstream at
https://groups.google.com/g/jailhouse-dev/c/3BrwWSbrq90

> > +SRC_URI =3D " \
> > +    git://github.com/siemens/jailhouse.git;protocol=3Dhttps;branch=3D$=
{BRANCH} \
> > +    file://0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.pat=
ch \
> > +    file://0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.p=
atch \
> > +    file://0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch =
\
> > +    file://0001-jailhouse-k3-fix-bar-mask-size.patch \

It seems this one wasn't added here?

I guess it is the one we have at
https://github.com/foundriesio/meta-lmp/blob/main/meta-lmp-bsp/recipes-kern=
el/jailhouse/jailhouse/0001-configs-k3-use-intx-for-bar_mask.patch.

Thanks,
--=20
Ricardo Salveti


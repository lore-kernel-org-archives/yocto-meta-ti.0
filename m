Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDDBC77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 16:20:57 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.916.1683822046779993894
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 09:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@foundries.io header.s=google header.b=FvJ49mxQ;
 spf=pass (domain: foundries.io, ip: 209.85.208.176, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ac836f4447so89727461fa.2
        for <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 09:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1683822045; x=1686414045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yE1E5n2UkIbwjDcZbE7A2dA20fCXMD/5loDJpgtxlA=;
        b=FvJ49mxQ3/DxfdKfJhZ4ovorBU4/Cu0bS+VcOfCxvZ8SkkWPHvsURRtdHRMk+uTbjB
         y2kzbvG2LhREkwMXShkvElFBjQuM7zaPnmaG08tnOocGi/RPaBo3Uu11afdLislOS8n6
         xadN8hyjfdORVcubGVaDib/0PDeMGj3ld/kpyNuyjMF0BPdDaxgQ869C8U6apZvyaPvX
         22dFs+kG/x+fwKaNdACYPpRpwLpYdaIvSBVxK51R5KqLNe+QNnmpEmyqZnD+KGuJq0uE
         P6N3KhYr4VjO0nT+erOa9d7F2r2zKF0hgeVwaurn9zaL+apBsyOf7htWN15zQBerV9LV
         KVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683822045; x=1686414045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3yE1E5n2UkIbwjDcZbE7A2dA20fCXMD/5loDJpgtxlA=;
        b=Trs/o3+nOxr+z73khZv3gP8MxAFEZn5b5IomYx5U1s3axalpgiiGY/dctIiaB7GfCZ
         WbWwu3MJinRSVFT9whLfKazgd3wsjfhg6J1N7M4hSUCwVCbKWRkyYWkTa4wx+Q0Po5Hy
         bYsmZbH253TnwIECd7NpYM+LJmiP4inDY/2I4DtfeaXGKyq6CokWmR4szVCtou2to2tX
         to96qCcbIAx9A89SrNHgj5+Smpi5xKgChKeNRszZg0E5LGVtJTCL8fYReoMmExM0PDGJ
         xo5OcVImFJ8hWuqm5MjYCbVnzuqw4vGbXmfky28Vc9MW6OE4E3VzdnDRWvpv2rWjO3cw
         Jw1g==
X-Gm-Message-State: AC+VfDz2bGasgwreChEpQat27v7q+QA0TtVDtyP99XabTGDIic+73MO2
	5eP9voePz4uK+cUr7W/wGkJs3O6Sn/C2W3UHsOWJ
X-Google-Smtp-Source: ACHHUZ4Cw/lQcBOOOEiaGo825mCt9Voc2qZncDa2YFm+01MIc8Nzelq6zvw6QKSPL9qVlMOVtjqpqBl1tpuLJhOwpDA=
X-Received: by 2002:a2e:9bc5:0:b0:2ac:76dc:b067 with SMTP id
 w5-20020a2e9bc5000000b002ac76dcb067mr3587803ljj.10.1683822044657; Thu, 11 May
 2023 09:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230509-b4-k3-fit-signing-v1-1-2e335869bec8@ti.com> <20230511154739.GZ9226@denix.org>
In-Reply-To: <20230511154739.GZ9226@denix.org>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Thu, 11 May 2023 13:20:08 -0300
Message-ID: <CAAaKDhGanojzgOsA3Bz4OJmqVQpLD_Jnns6C+jpryDt+DbpXFA@mail.gmail.com>
Subject: Re: [meta-ti][master/kirkstone][RFC PATCH] conf: machine: include: k3
 enable fit signing for uboot
To: Denys Dmytriyenko <denis@denix.org>
Cc: m-chawdhry@ti.com, meta-ti@lists.yoctoproject.org, 
	Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>, 
	Kamlesh Gurudasani <kamlesh@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 16:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16514

On Thu, May 11, 2023 at 12:48=E2=80=AFPM Denys Dmytriyenko <denis@denix.org=
> wrote:
>
> On Thu, May 11, 2023 at 11:54:00AM +0530, Manorit Chawdhry via lists.yoct=
oproject.org wrote:
> > Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> > ---
> > To: Ryan Eatmon <reatmon@ti.com>
> > To: Denys Dmytriyenko <denys@ti.com>
> > Cc: meta-ti@lists.yoctoproject.org
> > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > Cc: Praneeth Bajjuri <praneeth@ti.com>
> > Cc: Udit Kumar <u-kumar1@ti.com>
> > Cc: Andrew Davis <afd@ti.com>
> > Cc: Kamlesh Gurudasani <kamlesh@ti.com>
> > ---
> >  meta-ti-bsp/conf/machine/include/k3.inc | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf=
/machine/include/k3.inc
> > index fff1550564b3..ab7e45a8016f 100644
> > --- a/meta-ti-bsp/conf/machine/include/k3.inc
> > +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> > @@ -31,6 +31,12 @@ SPL_BINARY =3D "tispl.bin"
> >  SPL_BINARYNAME =3D "tispl.bin"
> >  UBOOT_SUFFIX =3D "img"
> >
> > +UBOOT_SIGN_ENABLE =3D "1"
> > +UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
> > +UBOOT_SIGN_KEYNAME =3D "uboot_signing_dev_key"
> > +UBOOT_SIGN_KEYDIR =3D "${DEPLOY_DIR_IMAGE}/u-boot-keys"
>
> How are the keys get into there? Are there extra docs/instructions?

FIT_GENERATE_KEYS set to 1 forces the key to be automatically
generated by openembedded-core/meta/classes/uboot-sign.bbclass, so
they are created during build time.

Cheers,
--=20
Ricardo Salveti


Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F9FEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 15:14:46 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.15068.1686755676619474082
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 08:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@foundries.io header.s=google header.b=NI5mkyMx;
 spf=pass (domain: foundries.io, ip: 209.85.208.178, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b34ac4b6e8so9334621fa.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1686755675; x=1689347675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJxHEF9OKVMeWQUsDR3LKM5mlTP6ovUYWGJc1lw4alA=;
        b=NI5mkyMx+twrVXqBl+KheflfEvIUbX1gcKs0VnmBjCGl+KqU4vb7km02do2yQysyIO
         Ym3RsjN3uhlrPvTmDamSxdwjdh7VZEZQIMUx6ybqk+aAczLZfUwHqq7gcZYdmwpFOopP
         c3lSu7n0RBHjsiv+Ja+h4bacwTHHlvQMCzd6wKUgPQ9a/LOzeC5yMxKXgacsCEIwqZ3u
         JOX5JvUa/AM2YrgfE4/XYfXBpHi97hk9svFfRrbU+MUYqjnysthJjTN4ncooIk4aoJyj
         BboOUOMDDOECJuaXXLoY5oG9LGX/SGCinP6ZeD86BAhlDtmp1mSm9offVcdThG00OAln
         hdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686755675; x=1689347675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJxHEF9OKVMeWQUsDR3LKM5mlTP6ovUYWGJc1lw4alA=;
        b=HMKvW4RwLfoas8jYyQrclZJdpF5+P61bIBfvEcL0oyannIHSnBlddBfXzhXSRqCoI4
         rm1rPP0OhNqq63f4LP9KKvrsQveEA9onG/5Ij8CpA/vxrAOCe1gcOD8pDPvLWJ5Yy+gY
         Q1Gw9W8/Uk1fdYIjwcvAyi/NcSGqoaXSkiWZpuJPYsxG5rqh2LDYiqFwxq7qQ6QdICUA
         qlzesVzWfrVKOijCj60YH9xeHpVzLItfvjZRud5zv+Iwmk1x0CItbKBBKqUBgqIySNlY
         E2+1nNPj6oxrxPKCPSqdfIRDP5BW1fsN3K468+U4HzUzV74/azKnn7JczzU7vR28L8EN
         KjeQ==
X-Gm-Message-State: AC+VfDxIcPpxzgkbUKnitTgYnSe3TZqjiDMiRtvYCSwe003WMvFqChC3
	qDWdWFHHpOBsqzsHy8+KYeSKftpXZLME225qlCfo
X-Google-Smtp-Source: ACHHUZ5w0Pgy2EpNhaEE2ahZab89SFCiLiNgYE5WbLvOqj51/U71TruDiNCqXMs+cko7JJx/rX9e6B1DwqFCzVXLJFA=
X-Received: by 2002:a2e:6a09:0:b0:2b1:ecac:91d3 with SMTP id
 f9-20020a2e6a09000000b002b1ecac91d3mr6756062ljc.25.1686755674578; Wed, 14 Jun
 2023 08:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230613-b4-internal-core-secdev-fit-v1-1-c344639b5be1@ti.com>
In-Reply-To: <20230613-b4-internal-core-secdev-fit-v1-1-c344639b5be1@ti.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Wed, 14 Jun 2023 12:13:58 -0300
Message-ID: <CAAaKDhEHSsRE7rY75-Db7_eFfjfHmrA4awJXgpj0QW6Q2WWCgQ@mail.gmail.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: machine: include: k3
 enable fit signing for uboot
To: m-chawdhry@ti.com
Cc: meta-ti@lists.yoctoproject.org, Andrew Davis <afd@ti.com>, 
	Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
	Praneeth Bajjuri <praneeth@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kamlesh Gurudasani <kamlesh@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 15:14:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16722

On Wed, Jun 14, 2023 at 4:41=E2=80=AFAM Manorit Chawdhry via
lists.yoctoproject.org <m-chawdhry=3Dti.com@lists.yoctoproject.org>
wrote:
>
> Enables FIT Image signing for K3 platforms
>
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/k3.inc                  | 7 +++++++
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 1 +
>  2 files changed, 8 insertions(+)
>
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
> index f8bfb3dbcafc..eb25fa780407 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -31,6 +31,13 @@ SPL_BINARY =3D "tispl.bin"
>  SPL_BINARYNAME =3D "tispl.bin"
>  UBOOT_SUFFIX =3D "img"
>
> +UBOOT_SIGN_ENABLE =3D "1"
> +UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
> +UBOOT_SIGN_KEYNAME ?=3D "custMpk"
> +UBOOT_SIGN_KEYDIR ?=3D "${TI_SECURE_DEV_PKG}/keys"

Did you verify that this won't cause a build failure when the key is
not available at runtime (e.g. users not defining TI_SECURE_DEV_PKG)?

Just because UBOOT_SIGN_ENABLE is being forced to 1.

Thanks,
--=20
Ricardo Salveti


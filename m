Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34696C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 16:19:17 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.984.1683821951434946372
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 09:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@foundries.io header.s=google header.b=O/WATjj6;
 spf=pass (domain: foundries.io, ip: 209.85.208.181, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ad9f2926adso42653001fa.1
        for <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 09:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1683821949; x=1686413949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ab/eqcYdIg1hxyI4Fe+aEWqFK4SxSEQfp7/BUHi+0lU=;
        b=O/WATjj6npT0+s9x5wGbLLONmSWcqCp6gtMoEJ6KbYcNqlXnZ3zkRRr+4yjgDwZP0Q
         SPHCWtmovRPfKM81+FBep9DqZJB8IzHhvM6OWcsLASasgJeodec/fEVN/TRIjinndBTU
         ODYdOKxrKb+yixv2RZn7RyvyN9muZP/H6kadzEzx9WafYAdTphJITJZDe40M1XZHV3uM
         xVLhtUfrCFM6JWxcMcdmce3bvaAixIfGXIa++a7D4cTAng7XUtiSq8QfOQ4MrzKa+CU5
         2GQu4W36s7Re9bG7R3D7r4I2qVCSVRJt0Q0TLEWNw3VYccwJ30CA6tAyqbhHx2dc57EB
         7n4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683821949; x=1686413949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ab/eqcYdIg1hxyI4Fe+aEWqFK4SxSEQfp7/BUHi+0lU=;
        b=VF4qkbReRajlAzYLowIcXya87+bOwUKFuzhBKSH7KBpfXi/LSSxfyegNHcZWgZB7k/
         mbIR69IrvIH9QSCgMfPnk+cNXpT8IQ9qtspoqsRrJqFONHdrlXRGKn0YG3v+7pTzNqXI
         B8/XMk+mpR9f6LInQ4s3ER6K0zZmHxY79/Lg/KF7RyfG2l+9G21JtQZ0sJsFaLFxtczZ
         zfNDdevRypdKJoBL6EB7GGr5CCXETS6Q1VghMVskmMS3qHof32jEv2Fl49Gn3dFbfmy3
         d8hrizijm/RCOphaEUBHc92DHRxsoaxMBmnOWo3sDuybzGcSa2eQlbqF1ecEqOXod5U7
         /4pg==
X-Gm-Message-State: AC+VfDzq05V7s07i53nI+EUEZbKteABHZgnYYUj5OR0u9STUPz156pb4
	ZR3+xf0C52iB6fvSJPpyjQMuoKi/MB5r8ewFtVVR
X-Google-Smtp-Source: ACHHUZ7pdey6TfFpr1aN3/Ce4vsZmibEgEI5GeUYEzfOKIyelinFrb9rlVAWBEuvGsJCEHmIrBx0tn+svXkY7Ay3naE=
X-Received: by 2002:a2e:900f:0:b0:298:a840:ec65 with SMTP id
 h15-20020a2e900f000000b00298a840ec65mr3449125ljg.36.1683821949188; Thu, 11
 May 2023 09:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230509-b4-k3-fit-signing-v1-1-2e335869bec8@ti.com>
In-Reply-To: <20230509-b4-k3-fit-signing-v1-1-2e335869bec8@ti.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Thu, 11 May 2023 13:18:32 -0300
Message-ID: <CAAaKDhF46NgQ8n80O2Ki2dYhE7_=Js8R3Cz1kuVbr_AMqvAFiw@mail.gmail.com>
Subject: Re: [meta-ti][master/kirkstone][RFC PATCH] conf: machine: include: k3
 enable fit signing for uboot
To: m-chawdhry@ti.com
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>, 
	Denys Dmytriyenko <denys@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, 
	Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>, Kamlesh Gurudasani <kamlesh@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 16:19:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16513

On Thu, May 11, 2023 at 3:24=E2=80=AFAM Manorit Chawdhry via
lists.yoctoproject.org <m-chawdhry=3Dti.com@lists.yoctoproject.org>
wrote:
>
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
> To: Ryan Eatmon <reatmon@ti.com>
> To: Denys Dmytriyenko <denys@ti.com>
> Cc: meta-ti@lists.yoctoproject.org
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Praneeth Bajjuri <praneeth@ti.com>
> Cc: Udit Kumar <u-kumar1@ti.com>
> Cc: Andrew Davis <afd@ti.com>
> Cc: Kamlesh Gurudasani <kamlesh@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/k3.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
> index fff1550564b3..ab7e45a8016f 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -31,6 +31,12 @@ SPL_BINARY =3D "tispl.bin"
>  SPL_BINARYNAME =3D "tispl.bin"
>  UBOOT_SUFFIX =3D "img"
>
> +UBOOT_SIGN_ENABLE =3D "1"
> +UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
> +UBOOT_SIGN_KEYNAME =3D "uboot_signing_dev_key"
> +UBOOT_SIGN_KEYDIR =3D "${DEPLOY_DIR_IMAGE}/u-boot-keys"
> +FIT_GENERATE_KEYS =3D "1"

I think it is better to make this decision a bit more flexible by
using ?=3D instead of a hard set, since distros might not want to use
automatically generated keys (and keys with a different name as well).

Cheers,
--=20
Ricardo Salveti


Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6408BC61D85
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 21:58:49 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.6137.1700603919486254455
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Nov 2023 13:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oExmllIH;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: denys.dmytriyenko@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-332cc1f176bso1211312f8f.2
        for <meta-ti@lists.yoctoproject.org>; Tue, 21 Nov 2023 13:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1700603918; x=1701208718; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eO2v/PGurN7T0b8QvOo6FN+71KjxxyBKCevPKWq2E7s=;
        b=oExmllIH5JVkbVr8lNY83bRluWvpI3/IXMmNYagCaQb7pRYvA4B4vlDktT1j5PjsgZ
         2iLBKlVYgYhODRuHhZ2o/cvXqufnyHtfLCiX1DKGkbe9GBkmIOqA/4y4Xvuam2x9x7QH
         WmdG2RAhwzybf4FqVFI0EFWwseogVgKFKRU84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700603918; x=1701208718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eO2v/PGurN7T0b8QvOo6FN+71KjxxyBKCevPKWq2E7s=;
        b=HMUX2yjeUPTrTt2Wf7/PEVVsncoH0uRAoblR5C0Zteu7MI4MsyqbEKephoTR5dbGOE
         J7uXMbGqE6y3rEkOQZadeygx0Eo+P6Z5BAxzQMBIHbvrYTGCs9nUONVH2iM3yWXBknVD
         WRtvzLTADwq5C/w4/c8RCaRoZKNzEO/f5rFxWOisDy7g4zihlXteeG9+2gU3T+2mA4wm
         IYJB9MMmaHi+iuZ2fRsvO3SCWaOdNGNRVOZi3JwVKK8lK0NMPaw0tIVyyMRBxMkay6Y6
         sjbrgTDlWoiLGD1pbmOPNOlLMn06LyRU+5Er7140tpKqzj4SdbL5Q7hAIZnJ0qz/J9y8
         8Xig==
X-Gm-Message-State: AOJu0Yy4T1Zx3iWB9rYnKT6IPGp50AbQbTkjNjqHbWn0wwLwwRnXwYra
	0Xgg/axmZJngPdjVV/0wnlpE7/w2/LKU74DyKyWe8A==
X-Google-Smtp-Source: AGHT+IEL7eY3FIVTiHrlXoP8h97EpLuaoqtk6bpcp+R5eowIvutYZT9Jq0s7EaKR3LB6mZdgiob773U/hhOCnkvlftw=
X-Received: by 2002:adf:d1c7:0:b0:32f:83e4:50e5 with SMTP id
 b7-20020adfd1c7000000b0032f83e450e5mr235279wrd.6.1700603917851; Tue, 21 Nov
 2023 13:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20231121165038.6088-1-detheridge@ti.com>
In-Reply-To: <20231121165038.6088-1-detheridge@ti.com>
From: Denys Dmytriyenko <denys@konsulko.com>
Date: Tue, 21 Nov 2023 16:58:27 -0500
Message-ID: <CAB2aN6Nsu7kJJmrC+v4NB=wg7h7CKxdkqGxDGQvnpydZsFUN3g@mail.gmail.com>
Subject: Re: [meta-ti][kirkstone][PATCH] mesa-pvr: rollback srcrev to unbreak
 Rogue GPU based platforms
To: Darren Etheridge <detheridge@ti.com>
Cc: max.krummenacher@toradex.com, anandb@ti.com, reatmon@ti.com, rs@ti.com, 
	meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Nov 2023 21:58:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17321

I haven't seen this on the list - was this blocked?

As of the change itself - is this essentially unbreaking Rogue by
breaking back SGX?

On Tue, Nov 21, 2023 at 11:50=E2=80=AFAM Darren Etheridge <detheridge@ti.co=
m> wrote:
>
> A bug was introduced while trying to unify the Mesa version that is used
> on SGX GPU's and Rogue GPU's.   It manifests itself as an immediate segfa=
ult
> whenever you try and run something like glmark2-es2-wayland or
> weston-simple-egl on certain Rogue based platforms (specifically am62x).
>
> Rollback the SRCREV to a version before the Mesa SGX changes were added.
> While we figure out what the underlying issue is with the unified
> version.
>
> This reverts the mesa-pvr recipe back to be the equivalent of commit id:
>         21fb9cbc01390f362ca376891b9f96f2ad24f344
>
> Signed-off-by: Darren Etheridge <detheridge@ti.com>
> ---
>  meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-=
ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> index 98d30c5b..281d6a21 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> @@ -23,7 +23,7 @@ SRC_URI =3D " \
>
>  S =3D "${WORKDIR}/git"
>
> -SRCREV =3D "7c9522a4147836064f582278e4f7115735c16868"
> +SRCREV =3D "54fd9d7dea098b6f11c2a244b0c6763dc8c5690c"
>
>  PACKAGECONFIG:append =3D " \
>      ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img=
-rogue-driver', 'pvr', '', d)} \
> --
> 2.17.1
>


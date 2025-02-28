Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9BFC282C6
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 18:27:55 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.1412.1740767271105751742
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Feb 2025 10:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=MHQ7xZQF;
 spf=pass (domain: criticallink.com, ip: 209.85.167.41, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54524740032so2408726e87.3
        for <meta-ti@lists.yoctoproject.org>; Fri, 28 Feb 2025 10:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1740767269; x=1741372069; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tPOloObFS3QOjRILkZMwVlMVgyn/jB8rcHuO3ahBis=;
        b=MHQ7xZQF+uKEUmaXM3ziL/orPsK75y5SrjWpRirpPrvZsl77Yeqd0h/GuPI+vIJBI0
         Z1fI4UT07zDXcH4AXhzMga8isSg6zm5bF9lR5n0B0UMdPR+VIKfNe6qfOaY0YTDDgIZj
         QwjRav+uK1VOPSweHJ0/BFg9zBsgTX3fyHkzRhhR/erLEohaT+LlZ6S9W+qb7/lmZsfv
         5IjmXYluwBmVaVv9KhDogSf2qs6GO2StC9cLXLtJqrd7QE3yjafFBFKKXF53kosanEbT
         jbFQ8CYRwITKmPbAC6yfu5iQGEh4CzHI5nrKbOZb/RCigHqItD44WRR2MIuR4k5aeADL
         14XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740767269; x=1741372069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tPOloObFS3QOjRILkZMwVlMVgyn/jB8rcHuO3ahBis=;
        b=Aamz43NYB0EAyoG+xlR0eAmSTpM0iUHK3m6ZSflHsP8bDhX464rVB8QpxHIckgHuU2
         CAdcIvk52F+lQbrwdjTm5WrVCkM1xfp06TB6y54u8tdh5nkkR4akHdPcUcf0Wjj/eoyP
         LgeBzhyF8RVZk/EUvu2tnaPHoCR+mfjw32jynF0D/UGmLTtZmvSBgAYKZO0z5Sknhjzu
         1zVxpVsPlsAz4aXCcGoU1+/r4xTRLsthwsuFkq6vQDn2ZZUfECa2CwTQDgmfs9nP52XO
         6FcAlEks/iB77MUDbID/4v6sadMk//OvZDjBSGrxy2BYaWyNO/XAY5bo2wFmo2qPtQAo
         ZMlg==
X-Forwarded-Encrypted: i=1; AJvYcCXvZ84ku8cNSAsMro5hHUrUbn5ZDGmQ1vQefJUHfygDDqEeCK8cWytUHiYV4aqNM2MtKZESL555@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yzt6NSRYFTQAJ+UC48g0kHurDg+qsER89+V7F7Im++XBWQIKoeU
	Ph0M8X1oJz83DCMXp9FG0E3TiHfQ69goYknTwRZkWiPp5IWIypR+pVVMcxB/iMzLoiaS5u/z32z
	R4OyCBXJUL16j8yB/9l8FwcTc1tyP1NpiDqSP
X-Gm-Gg: ASbGncuuIuZ6/tbTkA4UOa6k9P4I1bW8J8Fw3LWvqeuzHaqdnSPqEx5N4unK3Tyss4s
	r3e+q2pQ0lGdic1enV8zTBU+5ODRV7idK/EyGFsGD5OaQY5r7dlbM6r8IdL8IORupUxEIHu8E9L
	oe8IAJYw==
X-Google-Smtp-Source: AGHT+IEm/sC4jzGtIOASXZy949Cou+PKwixOlAMnGLVv4SoDamT/asx0Ef618b2IxTac21bPQ1NEdJkpVdN5GJZ27q8=
X-Received: by 2002:a19:380a:0:b0:546:2f7a:38c1 with SMTP id
 2adb3069b0e04-5494c107f48mr1814014e87.11.1740767269024; Fri, 28 Feb 2025
 10:27:49 -0800 (PST)
MIME-Version: 1.0
References: <20250228-uboot-cleanup-v1-1-3f7d3f2a4ee2@ti.com>
In-Reply-To: <20250228-uboot-cleanup-v1-1-3f7d3f2a4ee2@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Fri, 28 Feb 2025 13:27:35 -0500
X-Gm-Features: AQ5f1JrWcRaovfWZCynCYAKMu5wNyutUM485gV4IdSv9DaNkbKKIOITmSVrOR3U
Message-ID: <CADL8D3bcRNpg2TqsgMzW9nvUBp+FTfxzbNgOer9+4J6GGzmSuQ@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH master/scarthgap] conf: machine: k3: disable all
 fit signing for uboot
To: bb@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>, 
	Meta-TI <meta-ti@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Feb 2025 18:27:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18342

On Fri, Feb 28, 2025 at 1:12=E2=80=AFPM Bryan Brattlof via
lists.yoctoproject.org <bb=3Dti.com@lists.yoctoproject.org> wrote:
>
> All K3 SoCs utilize the binman packaging tools in U-Boot to package
> and sign the different boot firmware components needed to boot the
> various security variants of K3 platform. Disable UBOOT_SIGN_ENABLE
> to simplify the build
Are you trying to say that because binman does the signing, the
UBOOT_SIGN_ENABLE isn't needed?  Or does removing UBOOT_SIGN_ENABLE
disable the binman signing?
>
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/k3.inc | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
> index dd3cbecab3d51..b98b45802bc76 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -25,10 +25,6 @@ SPL_BINARY =3D "tispl.bin"
>  SPL_BINARYNAME =3D "tispl.bin"
>  UBOOT_SUFFIX =3D "img"
>
> -UBOOT_SIGN_ENABLE =3D "1"
> -UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
> -UBOOT_SIGN_KEYNAME ?=3D "custMpk"
> -UBOOT_SIGN_KEYDIR ?=3D "${TI_SECURE_DEV_PKG}/keys"
>  FIT_HASH_ALG ?=3D "sha512"
>  FIT_SIGN_ALG ?=3D "rsa4096"
>
>
> ---
> base-commit: c3d050c2c9db34e250b4b61e90a67bacbfa45066
> change-id: 20250228-uboot-cleanup-35cb26c61905
>
> Best regards,
> --
> Bryan Brattlof <bb@ti.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18341): https://lists.yoctoproject.org/g/meta-ti/mess=
age/18341
> Mute This Topic: https://lists.yoctoproject.org/mt/111439202/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [jcormier@cri=
ticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211


Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999DAC76196
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 20:51:13 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web10.766.1680900670244320555
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Apr 2023 13:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=kjTKg4z8;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: robertcnelson@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id h15so37837324vsh.0
        for <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 13:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680900669; x=1683492669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kc4LLoHVxl0djlSBRiBFoQK4h83+dpMcgGu0n/3Lw6s=;
        b=kjTKg4z8/2hf9hm9DzpdcoP2FA9rdi7HSgLFgJRSnjOplt0B0QzPsC3iD3I7n5Eo1/
         guzAcWCNkheP5v4GMw4P9w0KgNpA1VcBKwR4wIH7cVMNqFCKFaZSnOAT/jZTVnRlZacu
         Nj9UYauTPM7gANE9obvEHtt2judImt1jls+RBZMjWSOD/zPJQBZ7Kanxhs7kvgtem2d/
         VTiBv/UV5ZDR9WWrvTaPfv3DKxvF4l+C7pG8NfDyPHPlv3zZRHU1pGBLXfrYCEE+W8wi
         60nYnMuT3B6ZIYEf9NY+RNgN0If6QOmyi/uox8ThWYpT4JiRKFAFRrA3hYLb+7j5IyoY
         1+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680900669; x=1683492669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kc4LLoHVxl0djlSBRiBFoQK4h83+dpMcgGu0n/3Lw6s=;
        b=z4eKV/urKtIFz85ltRpAF6uPOF5sMraKo2nIfVnYSShFqdGQx7KB0WwJp5KCS3L/KG
         WC3NdGq1UqPkj6Xmn6ZPiwnBSidQMEirUgvTGtY9HohmCo42u8N2GrmdKQEyeXs/E5V8
         HoDaE2ECQb0eX5P+JCwDQNspImyfOHGWViqhghSiPyo0RU5ILJIskzOau2F1AIbNlnLq
         K6zhkTMWfjFkiIpX+M6l8ORZgVD2Lxez8Ck2gHjZLPfzxRXX3Tj+/8kUQGU/ZAPSj2+5
         DduZkDBD8VYoqyT04n/8gY8bnV8FAVuNXZhIT2qh7UV3wK/cOev+pNWwEN3waysm4s4T
         Ky4g==
X-Gm-Message-State: AAQBX9c0MJpa9qJ2Gx3ILNb4nVb2p6Bb35+dOqr1Pt9YWs5n4WI+6M40
	P39Hb59fU9e5SPg40PLpRMSc6DXiQciCkAxD4/8=
X-Google-Smtp-Source: AKy350Yi4ttS79OqzfpIqciSVdgFa1ZrHweGMYgby/COt+abmM2lILlejpDEtQjTqbis/ySrhCi8DqGBaJSUqZh2DSs=
X-Received: by 2002:a67:c38a:0:b0:425:e623:360a with SMTP id
 s10-20020a67c38a000000b00425e623360amr1845151vsj.1.1680900669161; Fri, 07 Apr
 2023 13:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230407203636.3265548-1-denis@denix.org> <20230407203636.3265548-2-denis@denix.org>
In-Reply-To: <20230407203636.3265548-2-denis@denix.org>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 7 Apr 2023 15:50:43 -0500
Message-ID: <CAOCHtYjcpjOwOL-kHT7s-HhLzi1CjWx-R0pu2=qBTwWiBJmoUw@mail.gmail.com>
Subject: Re: [master/kirkstone][PATCH 1/5] linux-bb.org: update to 5.10.162
 and dedicated branches
To: denis@denix.org
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 20:51:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16331

On Fri, Apr 7, 2023 at 3:36=E2=80=AFPM Denys Dmytriyenko <denis@denix.org> =
wrote:
>
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> * Update both 32 and 64-bit trees to 5.10.162
> * Switch from using a common branch that gets periodically rebased to usi=
ng
>   dedicated per-merge branches
> * Patch 32-bit defconfig to use LZMA compression instead of LZO, that is
>   being deprecated in OE-Core
>
> Cc: Robert Nelson <robertcnelson@gmail.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  ...h-default-kernel-compression-to-LZMA.patch | 30 +++++++++++++++++++
>  .../recipes-kernel/linux/linux-bb.org_git.bb  | 18 ++++++-----
>  2 files changed, 40 insertions(+), 8 deletions(-)
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-de=
fconfig-switch-default-kernel-compression-to-LZMA.patch
>
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig=
-switch-default-kernel-compression-to-LZMA.patch b/meta-ti-bsp/recipes-kern=
el/linux/linux-bb.org/0001-defconfig-switch-default-kernel-compression-to-L=
ZMA.patch
> new file mode 100644
> index 00000000..f6bff39f
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig-switch=
-default-kernel-compression-to-LZMA.patch
> @@ -0,0 +1,30 @@
> +From 0ccadc7a676341bbd66eb176308c7c59931e9dd2 Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@konsulko.com>
> +Date: Fri, 7 Apr 2023 01:44:56 +0000
> +Subject: [PATCH] defconfig: switch default kernel compression to LZMA
> +
> +LZO compression and lzop tool haven't been maintained for long time and =
have
> +been removed in recent versions of OE-Core, even though Debian may still=
 use
> +them. Switch to LZMA compression that is used by default in TI kernel co=
nfig.
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> +---
> + arch/arm/configs/bb.org_defconfig | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/arch/arm/configs/bb.org_defconfig b/arch/arm/configs/bb.org=
_defconfig
> +index 6bf0fb860683..7c035735172d 100644
> +--- a/arch/arm/configs/bb.org_defconfig
> ++++ b/arch/arm/configs/bb.org_defconfig
> +@@ -1,5 +1,5 @@
> + # CONFIG_LOCALVERSION_AUTO is not set
> +-CONFIG_KERNEL_LZO=3Dy
> ++CONFIG_KERNEL_LZMA=3Dy
> + CONFIG_SYSVIPC=3Dy
> + CONFIG_POSIX_MQUEUE=3Dy
> + CONFIG_NO_HZ_IDLE=3Dy

Oh! I didn't realize, lzo is in a sorry state.

Our only reason for using lzo over lzma, was purely a boot-up speed
race. (Thinking with the am335x single core at 1Ghz..)

Does OE-Core have proper support for lz4 as a replacement? Or just in
general lzma is the most recommended?

Regards,

--=20
Robert Nelson
https://rcn-ee.com/


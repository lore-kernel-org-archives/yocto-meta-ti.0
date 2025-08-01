Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B97C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 09:16:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.83542.1754039810644030213
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 02:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kf46vfpi;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso19257285e9.2
        for <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 02:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754039809; x=1754644609; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjYj4BDXV8lffGi4xNPIF4yuVxQmBlWrJsTFPIQjooo=;
        b=Kf46vfpitAgdBC1xgblpeo4bVTfcA38oe6p9/dIB+DrIZYUJx3SiRY3BKFkzkGVUOE
         SFrmn2LDyBWuhCb+cVusNSWkZXWWRujKz7rCAcMWNJiiQnPg2AZOrefJwIjoSK1+Y8Im
         0DN8cCRpm6HK//w2jZzqhEV0fFQ94TY6ARvTBG1R0P07iqS8g0B3Sbj8U+2KDulPmC/z
         Uk9xEgcf7/5Bw6zJsWT9+HWFS9VvfHxDrbAt/B8sF7uj+NhwYunt+3Z6gdPBNRs9ZuO9
         SOZCb6n/3e+Nl17rl2OZm+W+eGT83Oczb9OCHXGYmlzQPqFkUM/TISFISYXTzLitmjdf
         sVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754039809; x=1754644609;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LjYj4BDXV8lffGi4xNPIF4yuVxQmBlWrJsTFPIQjooo=;
        b=TM9Q6Xn88BzA54CnDOji/2jlmaAX3DhfeXJym34ksYs8HpBuhQj0L/zXnWjZBSXbX6
         +yaKnprCKL4DxwDNInTboBDVZkykxVZkYvRU6trHAT3bsuF0YqIMYwL9ptSgLA+gwLim
         qLu1MSFmRZyMaixS2ua2mOpLmVuP5fT1SqC0ManQNAeTuRCbBQQGIPToh4ne6e+MUIL7
         NvfjK1SMW+hTU+1F2YI9wlVQbv1tHPYkIj7fy03hAYt1lQBeAQyEZ+clRrZAYWBA2hYS
         WXlCrsxyscu4LlocCrwakJgppCR/C6ajagzaXzEPzLWBXMLKTS5J8+JAfna60lwFkCus
         L7CA==
X-Forwarded-Encrypted: i=1; AJvYcCW/ZEG4Tyi981GpaZggNJ2c53h+VONF8qufqVr7MkS/ARX0ZbLjXGZMxmIOxbXBbSD7nR1IKgM9@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YweBKgHhX+7yeWOMSd0YitDrCRBI2i9RX+Js2qfuabSr80KupSN
	dZKLQFu4PSTV47WfDUThpj08G5hj5zXM/kyx6OgJHuptz7SufdTcVber
X-Gm-Gg: ASbGncuAQpsO4sbfK1B7o5qlQv7O+FlArH0s++bQgdzfFPVu5vhPg7Zmsl29spmiq+H
	/qkxQhheCPA2CbIV3aQ2tS2avrxcL8my0hnL7MW89FWSj7JfGKVUWzhGyhfWhGPoMX/2ESWcqaw
	TZtHUFdctCR9P6eJYCOJIz1oP8CZwSAOyPxDSpeWhlqxJ1iekjGxjdpGhIJWQ7X+LJbA9BC6nYS
	4SBrBg9P3K4IClM7XPEAZDegzPsSbHC8zkxfUpPhSqI2gomG5qqrlaVeRDmRFFhFDISYDVPbWCo
	gaMcV0tM0sZbUyeZP5NB/QATmBDmtTXXAKi9DY0wvTb2ir651BIn72leRhSvv6L3ID8SblQHiEm
	g6PYspDFHF0BKyX671hIY/kLDvLTYXEKPwqS87NaafklU9ERKxamEpMrJswOS
X-Google-Smtp-Source: AGHT+IFkfWy9v31jMFAZ50W/i4LZsRinACDZs+H0Hdd5Sf9iBoawWk7i8fqiZ6R6bV2/cGz9Vfx6wg==
X-Received: by 2002:a05:600c:1da2:b0:456:1ac8:cace with SMTP id 5b1f17b1804b1-45892b9e27emr120937825e9.12.1754039808622;
        Fri, 01 Aug 2025 02:16:48 -0700 (PDT)
Received: from [192.168.0.7] (159-226-191-194.pool.dsl-net.ch. [194.191.226.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac158sm5345839f8f.4.2025.08.01.02.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:16:48 -0700 (PDT)
Message-ID: <b9c8b913068cfa6f0815f81e49aea1f501f7f12f.camel@gmail.com>
Subject: Re: [meta-ti][master][PATCH] linux-ti-*: Fix support for building
 legacy HS platforms
From: Max <max.oss.09@gmail.com>
To: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	 <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Date: Fri, 01 Aug 2025 11:16:47 +0200
In-Reply-To: <20250722214327.16345-1-reatmon@ti.com>
References: <20250722214327.16345-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 09:16:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18868

Hi

Am Dienstag, dem 22.07.2025 um 16:43 -0500 schrieb Ryan Eatmon via lists.yo=
ctoproject.org:
> The legacy HS platforms (am335x-hs-evm, am437x-hs-evm, and
> am57xx-hs-evm) are not using the new fitImage flow, but the kernels all
> include the kernel.bbclass which disallows the old fitImage flow.
>=20
> Copy in the last version of the kernel.bbclass and name it
> kernel_legacyhs.bbclass, and update the machine configs to defined a
> variable to use as the KERNEL_BASE_CLASS to inherit.
>=20
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
...
> diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/co=
nf/machine/include/ti-soc.inc
> index e3a50fdd..56ea9e47 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> @@ -11,3 +11,6 @@ UBOOT_RD_ENTRYPOINT =3D "0x84000000"
> =20
>  # TI platforms all use devicetrees with overlays
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree"
> +
> +# All machines should start off pointing at the default base kernel clas=
s
> +KERNEL_BASE_CLASS =3D "kernel"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> index 4c740678..51723fc0 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -3,7 +3,7 @@ SUMMARY =3D "Mainline Linux kernel for TI devices"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> =20
> -inherit kernel
> +inherit ${KERNEL_BASE_CLASS}
> =20
...
>=20

This breaks building for any machine which does not define KERNEL_BASE_CLAS=
S,
i.e. any machine which does not include ti-soc.inc or its siblings.

Building for qemuarm64 results in the following parse error:

| $ MACHINE=3Dqemuarm64 bitbake --parse-only
| Loading cache: 100% |#################################| Time: 0:00:12
| Loaded 5400 entries from dependency cache.
| ERROR: ParseError at .../meta-ti/meta-ti-bsp/recipes-kernel/linux/linux-t=
i-staging_6.12.bb:6:
Could not inherit file classes/${KERNEL_BASE_CLASS}.bbclass                =
                       =20
| ERROR: Parsing halted due to errors, see error messages above

Regards,
Max


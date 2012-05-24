Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-gg0-f176.google.com (mail-gg0-f176.google.com
	[209.85.161.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62183E01304
	for <meta-ti@yoctoproject.org>; Thu, 24 May 2012 01:38:52 -0700 (PDT)
Received: by ggnk4 with SMTP id k4so9567616ggn.35
	for <meta-ti@yoctoproject.org>; Thu, 24 May 2012 01:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Gz/BEEPxZFAJlcQ76bPGXRvK6jd6trnRhfTcI+GV0wg=;
	b=ta6AmxkRW7XX4cCFT/N7pWIpGazlqzIhhQHFYldojIBAPaXAr9O7A6ao/ikiCm+Jgd
	f5yHddNcISoDeoFE1uQDobWgb9CN8o6lDLRiVCJnN7HW6QWPU4R025RJ7R5wXFGwXgOp
	xd+jtDKcKkdzs+1aopPRuz6ZvKrBYYwu82LhQ2BIsTgO/Uc4KMwnsgNfRut6HzUyaENp
	aO1Jgg2UhT/fpvROxf4EqfSAzdou813EtfbcGqQUcEHT4zj70HjXRX37OPy86Ydb5Klw
	SQe9TdaOM/o5mniorjoRWP/Oo60O5S7yLeMKIuyuZNLUs9S8v2OeEColODTxhK546VbA
	uWFA==
MIME-Version: 1.0
Received: by 10.50.154.169 with SMTP id vp9mr15394917igb.53.1337848731230;
	Thu, 24 May 2012 01:38:51 -0700 (PDT)
Received: by 10.64.141.72 with HTTP; Thu, 24 May 2012 01:38:51 -0700 (PDT)
In-Reply-To: <1337774235-9471-1-git-send-email-koen@dominion.thruhere.net>
References: <1337774235-9471-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 24 May 2012 10:38:51 +0200
Message-ID: <CALbNGRRXZOYCqF9z7nytO2D_spToeJJw1mYggsqZq7irPeig1Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH] linux-mainline: update to 3.2.18
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2012 08:38:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 23, 2012 at 1:57 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> ---
> =A0conf/machine/include/omap3.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes-kernel/linux/linux-mainline_3.2.bb | =A0 =A08 ++++----
> =A02 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.=
inc
> index c5b1979..0f3cc36 100644
> --- a/conf/machine/include/omap3.inc
> +++ b/conf/machine/include/omap3.inc
> @@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
> =A0require conf/machine/include/tune-cortexa8.inc
> =A0PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap"
> =A0# Increase this everytime you change something in the kernel
> -MACHINE_KERNEL_PR =3D "r120"
> +MACHINE_KERNEL_PR =3D "r121"
>
> =A0KERNEL_IMAGETYPE =3D "uImage"
>
> diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-kernel/=
linux/linux-mainline_3.2.bb
> index 3dda4f8..69eb7e5 100644
> --- a/recipes-kernel/linux/linux-mainline_3.2.bb
> +++ b/recipes-kernel/linux/linux-mainline_3.2.bb
> @@ -5,12 +5,12 @@ KERNEL_IMAGETYPE =3D "uImage"
>
> =A0COMPATIBLE_MACHINE =3D "(beagleboard)"
>
> -PV =3D "3.2.16"
> -# v3.2.16 tag
> -SRCREV_pn-${PN} =3D "b1be7dd1ec231ae751d0ce3acd0d2e5760704a6f"
> +PV =3D "3.2.18"
> +# v3.2.18 tag
> +SRCREV_pn-${PN} =3D "52c6b95f8a2edaff98b779f15b2f4d69b61b18b9"
>
> =A0# The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machi=
ne/include/omap3.inc
> -MACHINE_KERNEL_PR_append =3D "d"
> +MACHINE_KERNEL_PR_append =3D "a"
>
> =A0FILESPATH =3D. "${FILE_DIRNAME}/linux-mainline-3.2:${FILE_DIRNAME}/lin=
ux-mainline-3.2/${MACHINE}:"
>
> --
> 1.7.10
Signed-off?


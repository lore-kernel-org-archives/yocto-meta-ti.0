Return-Path: <r-monk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 623BFE00305
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 20 Dec 2011 08:26:35 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pBKGQYM4018390;
	Tue, 20 Dec 2011 10:26:34 -0600
Received: from DNCE72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pBKGQXQX011636;
	Tue, 20 Dec 2011 10:26:33 -0600 (CST)
Received: from DNCE02.ent.ti.com ([fe80::e5b6:a692:b14:3c86]) by
	DNCE72.ent.ti.com ([fe80::8e3:61e5:a5b9:593c%23]) with mapi id
	14.01.0323.003; Tue, 20 Dec 2011 17:26:33 +0100
From: "Monk, Roger" <r-monk@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] linux-ti81xx-psp 2.6.37: update to match
	latest	*SDK
Thread-Index: AQHMvzPaGdyYyb3GzEKnWhYDwn2ycZXk6aPg
Date: Tue, 20 Dec 2011 16:26:32 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF522407E1EE20@DNCE02.ent.ti.com>
References: <1324398242-32416-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1324398242-32416-1-git-send-email-koen@dominion.thruhere.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.88.85]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: Re: [PATCH] linux-ti81xx-psp 2.6.37: update to match latest	*SDK
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
X-List-Received-Date: Tue, 20 Dec 2011 16:26:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2011 at 16:24:02, Koen Kooi wrote:
> Subject: [meta-ti] [PATCH] linux-ti81xx-psp 2.6.37: update to match
> latest *SDK
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Roger Monk <r-monk@ti.com>

Boot Tested on DM8148 EVM

> ---
>  conf/machine/include/ti814x.inc                    |    2 +-
>  ...d-code-for-disabling-the-least-significan.patch |   45
> ++++++++++++++++++++
>  recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb    |    9 ++--
>  3 files changed, 50 insertions(+), 6 deletions(-)  create mode 100644
> recipes-kernel/linux/linux-ti81xx-psp-2.6.37/0001-ti814x-added-code-
> for-disabling-the-least-significan.patch
>
> diff --git a/conf/machine/include/ti814x.inc
> b/conf/machine/include/ti814x.inc index 4f1c1de..23b6a1d 100644
> --- a/conf/machine/include/ti814x.inc
> +++ b/conf/machine/include/ti814x.inc
> @@ -6,7 +6,7 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti81xx-psp"
>  PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"
>
>  # Increase this everytime you change something in the kernel -
> MACHINE_KERNEL_PR =3D "r1"
> +MACHINE_KERNEL_PR =3D "r2"
>
>  KERNEL_IMAGETYPE =3D "uImage"
>
> diff --git a/recipes-kernel/linux/linux-ti81xx-psp-2.6.37/0001-ti814x-
> added-code-for-disabling-the-least-significan.patch b/recipes-
> kernel/linux/linux-ti81xx-psp-2.6.37/0001-ti814x-added-code-for-
> disabling-the-least-significan.patch
> new file mode 100644
> index 0000000..c1f368d
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti81xx-psp-2.6.37/0001-ti814x-added-
> cod
> +++ e-for-disabling-the-least-significan.patch
> @@ -0,0 +1,45 @@
> +From 1d43359e415cada4607d0d21b7de07c740616386 Mon Sep 17 00:00:00
> +2001
> +From: Amarinder Bindra <a-bindra@ti.com>
> +Date: Wed, 7 Dec 2011 20:54:56 +0530
> +Subject: [PATCH] ti814x: added code for disabling the least
> significant
> +bit of TI814x_HDMI_MUX_ADDR before vps init
> +
> +
> +Signed-off-by: Amarinder Bindra <a-bindra@ti.com>
> +---
> + drivers/video/ti81xx/vpss/core.c |   13 ++++++++++++-
> + 1 files changed, 12 insertions(+), 1 deletions(-)
> +
> +diff --git a/drivers/video/ti81xx/vpss/core.c
> +b/drivers/video/ti81xx/vpss/core.c
> +index eb9c074..80008b9 100644
> +--- a/drivers/video/ti81xx/vpss/core.c
> ++++ b/drivers/video/ti81xx/vpss/core.c
> +@@ -41,7 +41,7 @@
> +
> + #define VPS_DRIVER_NAME  "vpss"
> +
> +-
> ++#define TI814x_HDMI_MUX_ADDR (0x481C52C8)
> +
> + #ifdef DEBUG
> + unsigned int vpss_debug;
> +@@ -148,6 +148,17 @@ static int __init vps_init(void)  {
> +     VPSSDBG("core init\n");
> +
> ++        /* This mux is for configuring the pixel clock to Venc
> through HDMI or PLL*/
> ++        u32 reg_value;
> ++        u32 reg_base;
> ++
> ++        reg_base =3D (u32)ioremap(TI814x_HDMI_MUX_ADDR, 0x10);
> ++        reg_value =3D __raw_readl(reg_base);
> ++        reg_value &=3D 0xFFFFFFFE;
> ++
> ++        __raw_writel(reg_value, reg_base);
> ++        iounmap((u32 *)TI814x_HDMI_MUX_ADDR);
> ++
> +     if (platform_driver_probe(&vps_driver, vps_probe)) {
> +             VPSSERR("failed to register ti81xx-vpss driver\n");
> +             return -ENODEV;
> +--
> +1.7.1
> +
> diff --git a/recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb
> b/recipes- kernel/linux/linux-ti81xx-psp_2.6.37.bb
> index bae58b9..e5a3836 100644
> --- a/recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb
> +++ b/recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb
> @@ -6,15 +6,14 @@ KERNEL_IMAGETYPE =3D "uImage"
>  COMPATIBLE_MACHINE =3D "am387x-evm|am389x-evm|c6a814x-evm|c6a816x-
> evm|dm814x-evm"
>
>  # This is on the ti81xx-master branch -SRCREV =3D
> "a02ce6137c1647009a17ecac35d846fe9479dded"
> -
> -# requires .28 hdvpss: d686b2da5d2e7337c9759f910c3a665c27b0ec31
> +SRCREV =3D "745a06cb913ad7a9ab44855aa36d8c012cd5793b"
>
>  # The main PR is now using MACHINE_KERNEL_PR, for omap3 see
> conf/machine/include/omap3.inc -MACHINE_KERNEL_PR_append =3D
> "d+gitr${SRCREV}"
> +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCREV}"
>
>  SRC_URI +=3D "git://arago-project.org/git/projects/linux-
> omap3.git;protocol=3Dgit;branch=3Dti81xx-master \
> -           file://defconfig"
> +            file://0001-ti814x-added-code-for-disabling-the-least-
> significan.patch \
> +            file://defconfig"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 1.7.2.5
>
>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti





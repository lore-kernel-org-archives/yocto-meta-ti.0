Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 292F5E007DB; Tue,  5 Aug 2014 07:52:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D4BAE007EB
	for <meta-ti@yoctoproject.org>; Tue,  5 Aug 2014 07:52:02 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s75Eq1jf014457;
	Tue, 5 Aug 2014 09:52:01 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75Eq1bZ008239;
	Tue, 5 Aug 2014 09:52:01 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Tue, 5 Aug 2014 09:52:01 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH v3 1/2] linux-ti-staging 3.14: update to
	latest	3.14.15
Thread-Index: AQHPsHRtW8wHv3GYJkGwtQPMwUKa6JvCGK2w
Date: Tue, 5 Aug 2014 14:52:00 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F3053@DFLE08.ent.ti.com>
References: <1407219135-17200-1-git-send-email-denis@denix.org>
In-Reply-To: <1407219135-17200-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] linux-ti-staging 3.14: update to latest	3.14.15
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Aug 2014 14:52:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Tuesday, August 05, 2014 1:12 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH v3 1/2] linux-ti-staging 3.14: update to latest=
 3.14.15
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Update SGX patching, as now being partially upstreamed to the kernel.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v3 - drop sgx.cfg, as migrated to kernel  recipes-kernel/linux/linux-ti-s=
taging-
> 3.14/sgx.cfg | 24 ------  ...se-pdata-quirks-for-sgx-deassert_hardrese.pa=
tch | 86
> ----------------------
>  .../sgx/0005-ARM-dts-am437x-add-SGX-node.patch     | 41 -----------
>  .../0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch  | 42 -----------
>  recipes-kernel/linux/linux-ti-staging_3.14.bb      | 16 ++--
>  5 files changed, 6 insertions(+), 203 deletions(-)  delete mode 100644 r=
ecipes-
> kernel/linux/linux-ti-staging-3.14/sgx.cfg
>  delete mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/sgx/0004-A=
RM-
> OMAP2-Use-pdata-quirks-for-sgx-deassert_hardrese.patch
>  delete mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/sgx/0005-A=
RM-
> dts-am437x-add-SGX-node.patch
>  delete mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/sgx/0006-A=
RM-
> dts-am33xx-add-DT-node-for-gpu.patch
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx.cfg b/recipes=
-
> kernel/linux/linux-ti-staging-3.14/sgx.cfg
> deleted file mode 100644
> index 0291779..0000000
> --- a/recipes-kernel/linux/linux-ti-staging-3.14/sgx.cfg
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -##################################################
> -# SGX Graphics config options
> -##################################################
> -CONFIG_DMA_SHARED_BUFFER=3Dy
> -CONFIG_TI_ST=3Dn
> -CONFIG_INPUT_TOUCHSCREEN=3Dy
> -CONFIG_TOUCHSCREEN_ADS7846=3Dy
> -CONFIG_I2C_ALGOBIT=3Dy
> -CONFIG_MFD_TPS65218=3Dn
> -CONFIG_DRM=3Dy
> -CONFIG_DRM_KMS_HELPER=3Dy
> -CONFIG_DRM_KMS_FB_HELPER=3Dy
> -CONFIG_DRM_GEM_CMA_HELPER=3Dy
> -CONFIG_DRM_KMS_CMA_HELPER=3Dy
> -CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> -CONFIG_DRM_TILCDC=3Dy
> -CONFIG_FB_SYS_FILLRECT=3Dy
> -CONFIG_FB_SYS_COPYAREA=3Dy
> -CONFIG_FB_SYS_IMAGEBLIT=3Dy
> -CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> -CONFIG_HDMI=3Dy
> -CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> -CONFIG_SND_DAVINCI_SOC=3Dm
> -CONFIG_SND_SIMPLE_CARD=3Dn
> diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0004-ARM-OMAP=
2-
> Use-pdata-quirks-for-sgx-deassert_hardrese.patch b/recipes-
> kernel/linux/linux-ti-staging-3.14/sgx/0004-ARM-OMAP2-Use-pdata-quirks-fo=
r-
> sgx-deassert_hardrese.patch
> deleted file mode 100644
> index b0d5d40..0000000
> --- a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0004-ARM-OMAP2-Use-
> pdata-quirks-for-sgx-deassert_hardrese.patch
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -From 761dbda366d46ff007e04c09dd2deeee5073d090 Mon Sep 17 00:00:00
> 2001
> -From: Darren Etheridge <detheridge@ti.com>
> -Date: Fri, 25 Jul 2014 16:09:53 -0500
> -Subject: [PATCH 4/6] ARM: OMAP2+: Use pdata-quirks for sgx
> deassert_hardreset
> -
> -Use pdata_quirks to provide platform data to the sgx driver.
> -The data that is provided includes:
> -
> -1) Function pointers for the driver to use to reset the h/w block.
> -2) The reset name that matches with what is used in hwmod.
> -
> -Signed-off-by: Darren Etheridge <detheridge@ti.com>
> ----
> - arch/arm/mach-omap2/pdata-quirks.c    | 12 ++++++++++++
> - include/linux/platform_data/gfx-sgx.h | 22 ++++++++++++++++++++++
> - 2 files changed, 34 insertions(+)
> - create mode 100644 include/linux/platform_data/gfx-sgx.h
> -
> -diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-
> omap2/pdata-quirks.c
> -index a1fb5aa..945dd61 100644
> ---- a/arch/arm/mach-omap2/pdata-quirks.c
> -+++ b/arch/arm/mach-omap2/pdata-quirks.c
> -@@ -17,6 +17,7 @@
> -
> - #include <linux/platform_data/pinctrl-single.h>
> - #include <linux/platform_data/iommu-omap.h>
> -+#include <linux/platform_data/gfx-sgx.h>
> -
> - #include "am35xx.h"
> - #include "common.h"
> -@@ -63,6 +64,13 @@ static inline void legacy_init_wl12xx(unsigned
> ref_clock,
> - }
> - #endif
> -
> -+#if defined(CONFIG_SOC_AM33XX) || defined(CONFIG_SOC_AM43XX) static
> -+struct gfx_sgx_platform_data gfx_pdata =3D {
> -+	.reset_name =3D "gfx",
> -+	.deassert_reset =3D omap_device_deassert_hardreset, }; #endif
> -+
> - #ifdef CONFIG_MACH_NOKIA_N8X0
> - static void __init omap2420_n8x0_legacy_init(void)
> - {
> -@@ -270,6 +278,10 @@ struct of_dev_auxdata omap_auxdata_lookup[]
> __initdata =3D {
> - 	OF_DEV_AUXDATA("ti,am3517-emac", 0x5c000000, "davinci_emac.0",
> - 		       &am35xx_emac_pdata),
> - #endif
> -+#if defined(CONFIG_SOC_AM33XX) || defined(CONFIG_SOC_AM43XX)
> -+	OF_DEV_AUXDATA("ti,sgx", 0x56000000, "56000000.sgx",
> -+			&gfx_pdata),
> -+#endif
> - #ifdef CONFIG_ARCH_OMAP4
> - 	OF_DEV_AUXDATA("ti,omap4-padconf", 0x4a100040,
> "4a100040.pinmux", &pcs_pdata),
> - 	OF_DEV_AUXDATA("ti,omap4-padconf", 0x4a31e040,
> "4a31e040.pinmux", &pcs_pdata),
> -diff --git a/include/linux/platform_data/gfx-sgx.h
> b/include/linux/platform_data/gfx-sgx.h
> -new file mode 100644
> -index 0000000..aa59b2c
> ---- /dev/null
> -+++ b/include/linux/platform_data/gfx-sgx.h
> -@@ -0,0 +1,22 @@
> -+/*
> -+ * SGX Graphics Driver Platform Data
> -+ *
> -+ * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.co=
m/
> -+ *	Darren Etheridge <detheridge@ti.com>
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+modify
> -+ * it under the terms of the GNU General Public License version 2 as
> -+ * published by the Free Software Foundation.
> -+ *
> -+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
> -+ * kind, whether express or implied; without even the implied warranty
> -+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ * GNU General Public License for more details.
> -+ */
> -+#include <linux/platform_device.h>
> -+
> -+struct gfx_sgx_platform_data {
> -+	const char *reset_name;
> -+
> -+	int (*deassert_reset)(struct platform_device *pdev, const char
> -+*name); };
> ---
> -1.9.1
> -
> diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0005-ARM-dts-
> am437x-add-SGX-node.patch b/recipes-kernel/linux/linux-ti-staging-
> 3.14/sgx/0005-ARM-dts-am437x-add-SGX-node.patch
> deleted file mode 100644
> index e18581a..0000000
> --- a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0005-ARM-dts-am437x-=
add-
> SGX-node.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From c921fe043facef3bd6649170fb6130f18e9367b7 Mon Sep 17 00:00:00
> 2001
> -From: Darren Etheridge <detheridge@ti.com>
> -Date: Tue, 29 Jul 2014 16:27:59 -0500
> -Subject: [PATCH 5/6] ARM: dts: am437x: add SGX node
> -
> -Add dt node to enable SGX PowerVR driver.
> -
> -Signed-off-by: Darren Etheridge <detheridge@ti.com>
> ----
> - arch/arm/boot/dts/am4372.dtsi | 8 ++++++++
> - 1 file changed, 8 insertions(+)
> -
> -diff --git a/arch/arm/boot/dts/am4372.dtsi
> b/arch/arm/boot/dts/am4372.dtsi -index d36af42..d963a60 100644
> ---- a/arch/arm/boot/dts/am4372.dtsi
> -+++ b/arch/arm/boot/dts/am4372.dtsi
> -@@ -707,6 +707,13 @@
> - 			dma-names =3D "tx", "rx";
> - 		};
> -
> -+		sgx@0x56000000 {
> -+			compatible =3D "ti,sgx";
> -+			ti,hwmods =3D "gfx";
> -+			reg =3D <0x56000000 0x1000000>;
> -+			interrupts =3D <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> -+		};
> -+
> - 		mcasp1: mcasp@4803C000 {
> - 			compatible =3D "ti,am33xx-mcasp-audio";
> - 			ti,hwmods =3D "mcasp1";
> -@@ -891,6 +898,7 @@
> - 				clocks =3D <&disp_clk>;
> - 				clock-names =3D "fck";
> - 			};
> -+
> - 		};
> - 	};
> - };
> ---
> -1.9.1
> -
> diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0006-ARM-dts-
> am33xx-add-DT-node-for-gpu.patch b/recipes-kernel/linux/linux-ti-staging-
> 3.14/sgx/0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch
> deleted file mode 100644
> index d4d0f13..0000000
> --- a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0006-ARM-dts-am33xx-=
add-
> DT-node-for-gpu.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 0ef34332c3400b211a047eaca751d00c97f5104c Mon Sep 17 00:00:00
> 2001
> -From: Darren Etheridge <detheridge@ti.com>
> -Date: Fri, 18 Jul 2014 16:19:54 -0500
> -Subject: [PATCH 6/6] ARM: dts: am33xx: add DT node for gpu
> -
> -Add the node into the am33xx.dtsi file for the SGX GPU -that is found in
> some variants of the SoC.
> -
> -Signed-off-by: Darren Etheridge <detheridge@ti.com>
> ----
> - arch/arm/boot/dts/am33xx.dtsi | 8 +++++++-
> - 1 file changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dt=
si
> -index 2cfd694..df6ae9c 100644
> ---- a/arch/arm/boot/dts/am33xx.dtsi
> -+++ b/arch/arm/boot/dts/am33xx.dtsi
> -@@ -109,7 +109,6 @@
> - 		prcm: prcm@44e00000 {
> - 			compatible =3D "ti,am3-prcm";
> - 			reg =3D <0x44e00000 0x4000>;
> --
> - 			prcm_clocks: clocks {
> - 				#address-cells =3D <1>;
> - 				#size-cells =3D <0>;
> -@@ -822,6 +821,13 @@
> - 			reg =3D <0x48310000 0x2000>;
> - 			interrupts =3D <111>;
> - 		};
> -+
> -+		sgx@0x56000000 {
> -+			compatible =3D "ti,sgx";
> -+			ti,hwmods =3D "gfx";
> -+			reg =3D <0x56000000 0x1000000>;
> -+			interrupts =3D <37>;
> -+		};
> - 	};
> - };
> -
> ---
> -1.9.1
> -
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-
> kernel/linux/linux-ti-staging_3.14.bb
> index c223c88..6088bee 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> @@ -43,11 +43,11 @@ S =3D "${WORKDIR}/git"
>=20
>  BRANCH =3D "ti-linux-3.14.y"
>=20
> -SRCREV =3D "b0fa4f08d72c8723219b5174b5749151b5acaee0"
> -PV =3D "3.14.14"
> +SRCREV =3D "780f0589876618911eb9cd7ad5a83db249ad1638"
> +PV =3D "3.14.15"
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild -MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
>  KERNEL_CONFIG_DIR =3D "${S}/ti_config_fragments"
> @@ -55,21 +55,17 @@ KERNEL_CONFIG_FRAGMENTS =3D
> "${KERNEL_CONFIG_DIR}/audio_display.cfg ${KERNEL_CONFI
>                             ${KERNEL_CONFIG_DIR}/connectivity.cfg
> ${KERNEL_CONFIG_DIR}/ipc.cfg \
>                             ${KERNEL_CONFIG_DIR}/power.cfg"
>=20
> -KERNEL_CONFIG_FRAGMENTS_append_ti33x =3D " ${WORKDIR}/non-smp.cfg
> ${WORKDIR}/sgx.cfg"
> -KERNEL_CONFIG_FRAGMENTS_append_ti43x =3D " ${WORKDIR}/non-smp.cfg
> ${WORKDIR}/sgx.cfg"
> +KERNEL_CONFIG_FRAGMENTS_append_ti33x =3D " ${WORKDIR}/non-smp.cfg"
> +KERNEL_CONFIG_FRAGMENTS_append_ti43x =3D " ${WORKDIR}/non-smp.cfg"
>=20
>  # Patches necessary to make SGX graphics work with this kernel version
> SGX_PATCHES =3D "file://sgx/0001-HACK-drm-fb_helper-enable-panning-
> support.patch \
>                 file://sgx/0002-HACK-drm-tilcdc-add-vsync-callback-for-us=
e-in-
> omaplf.patch \
> -               file://sgx/0003-drm-tilcdc-fix-the-ping-pong-dma-tearing-=
issue-seen-
> .patch \
> -               file://sgx/0004-ARM-OMAP2-Use-pdata-quirks-for-sgx-
> deassert_hardrese.patch \
> -               file://sgx/0005-ARM-dts-am437x-add-SGX-node.patch \
> -               file://sgx/0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch"
> +               file://sgx/0003-drm-tilcdc-fix-the-ping-pong-dma-tearing-=
issue-seen-
> .patch"
>=20
>  SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
> kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>             file://defconfig \
>             file://non-smp.cfg \
> -           file://sgx.cfg \
>            "
>=20
>  SRC_URI_append_ti33x =3D " ${SGX_PATCHES}"
> --
> 2.0.4
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


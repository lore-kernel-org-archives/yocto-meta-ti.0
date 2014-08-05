Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E482FE007D2; Tue,  5 Aug 2014 10:24:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4517CE007C1
	for <meta-ti@yoctoproject.org>; Tue,  5 Aug 2014 10:24:48 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2A19152A87; Tue,  5 Aug 2014 17:24:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140805172448.2A19152A87@arago-project.org>
Date: Tue,  5 Aug 2014 17:24:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging 3.14: update to latest 3.14.15
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
X-List-Received-Date: Tue, 05 Aug 2014 17:24:54 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: aa289a01a1e7630512cf6c5cbafd35904036700e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=aa289a01a1e7630512cf6c5cbafd35904036700e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Aug  5 12:12:14 2014 +0000

linux-ti-staging 3.14: update to latest 3.14.15

Update SGX patching, as now being partially upstreamed to the kernel.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-3.14/sgx.cfg |   24 ------
 ...se-pdata-quirks-for-sgx-deassert_hardrese.patch |   86 --------------------
 .../sgx/0005-ARM-dts-am437x-add-SGX-node.patch     |   41 ---------
 .../0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch  |   42 ----------
 recipes-kernel/linux/linux-ti-staging_3.14.bb      |   16 ++---
 5 files changed, 6 insertions(+), 203 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx.cfg b/recipes-kernel/linux/linux-ti-staging-3.14/sgx.cfg
deleted file mode 100644
index 0291779..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.14/sgx.cfg
+++ /dev/null
@@ -1,24 +0,0 @@
-##################################################
-# SGX Graphics config options
-##################################################
-CONFIG_DMA_SHARED_BUFFER=y
-CONFIG_TI_ST=n
-CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_ADS7846=y
-CONFIG_I2C_ALGOBIT=y
-CONFIG_MFD_TPS65218=n
-CONFIG_DRM=y
-CONFIG_DRM_KMS_HELPER=y
-CONFIG_DRM_KMS_FB_HELPER=y
-CONFIG_DRM_GEM_CMA_HELPER=y
-CONFIG_DRM_KMS_CMA_HELPER=y
-CONFIG_DRM_I2C_NXP_TDA998X=y
-CONFIG_DRM_TILCDC=y
-CONFIG_FB_SYS_FILLRECT=y
-CONFIG_FB_SYS_COPYAREA=y
-CONFIG_FB_SYS_IMAGEBLIT=y
-CONFIG_BACKLIGHT_CLASS_DEVICE=y
-CONFIG_HDMI=y
-CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
-CONFIG_SND_DAVINCI_SOC=m
-CONFIG_SND_SIMPLE_CARD=n
diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0004-ARM-OMAP2-Use-pdata-quirks-for-sgx-deassert_hardrese.patch b/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0004-ARM-OMAP2-Use-pdata-quirks-for-sgx-deassert_hardrese.patch
deleted file mode 100644
index b0d5d40..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0004-ARM-OMAP2-Use-pdata-quirks-for-sgx-deassert_hardrese.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 761dbda366d46ff007e04c09dd2deeee5073d090 Mon Sep 17 00:00:00 2001
-From: Darren Etheridge <detheridge@ti.com>
-Date: Fri, 25 Jul 2014 16:09:53 -0500
-Subject: [PATCH 4/6] ARM: OMAP2+: Use pdata-quirks for sgx deassert_hardreset
-
-Use pdata_quirks to provide platform data to the sgx driver.
-The data that is provided includes:
-
-1) Function pointers for the driver to use to reset the h/w block.
-2) The reset name that matches with what is used in hwmod.
-
-Signed-off-by: Darren Etheridge <detheridge@ti.com>
----
- arch/arm/mach-omap2/pdata-quirks.c    | 12 ++++++++++++
- include/linux/platform_data/gfx-sgx.h | 22 ++++++++++++++++++++++
- 2 files changed, 34 insertions(+)
- create mode 100644 include/linux/platform_data/gfx-sgx.h
-
-diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
-index a1fb5aa..945dd61 100644
---- a/arch/arm/mach-omap2/pdata-quirks.c
-+++ b/arch/arm/mach-omap2/pdata-quirks.c
-@@ -17,6 +17,7 @@
- 
- #include <linux/platform_data/pinctrl-single.h>
- #include <linux/platform_data/iommu-omap.h>
-+#include <linux/platform_data/gfx-sgx.h>
- 
- #include "am35xx.h"
- #include "common.h"
-@@ -63,6 +64,13 @@ static inline void legacy_init_wl12xx(unsigned ref_clock,
- }
- #endif
- 
-+#if defined(CONFIG_SOC_AM33XX) || defined(CONFIG_SOC_AM43XX)
-+static struct gfx_sgx_platform_data gfx_pdata = {
-+	.reset_name = "gfx",
-+	.deassert_reset = omap_device_deassert_hardreset,
-+};
-+#endif
-+
- #ifdef CONFIG_MACH_NOKIA_N8X0
- static void __init omap2420_n8x0_legacy_init(void)
- {
-@@ -270,6 +278,10 @@ struct of_dev_auxdata omap_auxdata_lookup[] __initdata = {
- 	OF_DEV_AUXDATA("ti,am3517-emac", 0x5c000000, "davinci_emac.0",
- 		       &am35xx_emac_pdata),
- #endif
-+#if defined(CONFIG_SOC_AM33XX) || defined(CONFIG_SOC_AM43XX)
-+	OF_DEV_AUXDATA("ti,sgx", 0x56000000, "56000000.sgx",
-+			&gfx_pdata),
-+#endif
- #ifdef CONFIG_ARCH_OMAP4
- 	OF_DEV_AUXDATA("ti,omap4-padconf", 0x4a100040, "4a100040.pinmux", &pcs_pdata),
- 	OF_DEV_AUXDATA("ti,omap4-padconf", 0x4a31e040, "4a31e040.pinmux", &pcs_pdata),
-diff --git a/include/linux/platform_data/gfx-sgx.h b/include/linux/platform_data/gfx-sgx.h
-new file mode 100644
-index 0000000..aa59b2c
---- /dev/null
-+++ b/include/linux/platform_data/gfx-sgx.h
-@@ -0,0 +1,22 @@
-+/*
-+ * SGX Graphics Driver Platform Data
-+ *
-+ * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
-+ *	Darren Etheridge <detheridge@ti.com>
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License version 2 as
-+ * published by the Free Software Foundation.
-+ *
-+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
-+ * kind, whether express or implied; without even the implied warranty
-+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ */
-+#include <linux/platform_device.h>
-+
-+struct gfx_sgx_platform_data {
-+	const char *reset_name;
-+
-+	int (*deassert_reset)(struct platform_device *pdev, const char *name);
-+};
--- 
-1.9.1
-
diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0005-ARM-dts-am437x-add-SGX-node.patch b/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0005-ARM-dts-am437x-add-SGX-node.patch
deleted file mode 100644
index e18581a..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0005-ARM-dts-am437x-add-SGX-node.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From c921fe043facef3bd6649170fb6130f18e9367b7 Mon Sep 17 00:00:00 2001
-From: Darren Etheridge <detheridge@ti.com>
-Date: Tue, 29 Jul 2014 16:27:59 -0500
-Subject: [PATCH 5/6] ARM: dts: am437x: add SGX node
-
-Add dt node to enable SGX PowerVR driver.
-
-Signed-off-by: Darren Etheridge <detheridge@ti.com>
----
- arch/arm/boot/dts/am4372.dtsi | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
-index d36af42..d963a60 100644
---- a/arch/arm/boot/dts/am4372.dtsi
-+++ b/arch/arm/boot/dts/am4372.dtsi
-@@ -707,6 +707,13 @@
- 			dma-names = "tx", "rx";
- 		};
- 
-+		sgx@0x56000000 {
-+			compatible = "ti,sgx";
-+			ti,hwmods = "gfx";
-+			reg = <0x56000000 0x1000000>;
-+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-+		};
-+
- 		mcasp1: mcasp@4803C000 {
- 			compatible = "ti,am33xx-mcasp-audio";
- 			ti,hwmods = "mcasp1";
-@@ -891,6 +898,7 @@
- 				clocks = <&disp_clk>;
- 				clock-names = "fck";
- 			};
-+
- 		};
- 	};
- };
--- 
-1.9.1
-
diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch b/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch
deleted file mode 100644
index d4d0f13..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 0ef34332c3400b211a047eaca751d00c97f5104c Mon Sep 17 00:00:00 2001
-From: Darren Etheridge <detheridge@ti.com>
-Date: Fri, 18 Jul 2014 16:19:54 -0500
-Subject: [PATCH 6/6] ARM: dts: am33xx: add DT node for gpu
-
-Add the node into the am33xx.dtsi file for the SGX GPU
-that is found in some variants of the SoC.
-
-Signed-off-by: Darren Etheridge <detheridge@ti.com>
----
- arch/arm/boot/dts/am33xx.dtsi | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
-index 2cfd694..df6ae9c 100644
---- a/arch/arm/boot/dts/am33xx.dtsi
-+++ b/arch/arm/boot/dts/am33xx.dtsi
-@@ -109,7 +109,6 @@
- 		prcm: prcm@44e00000 {
- 			compatible = "ti,am3-prcm";
- 			reg = <0x44e00000 0x4000>;
--
- 			prcm_clocks: clocks {
- 				#address-cells = <1>;
- 				#size-cells = <0>;
-@@ -822,6 +821,13 @@
- 			reg = <0x48310000 0x2000>;
- 			interrupts = <111>;
- 		};
-+
-+		sgx@0x56000000 {
-+			compatible = "ti,sgx";
-+			ti,hwmods = "gfx";
-+			reg = <0x56000000 0x1000000>;
-+			interrupts = <37>;
-+		};
- 	};
- };
- 
--- 
-1.9.1
-
diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index c223c88..6088bee 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -43,11 +43,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "b0fa4f08d72c8723219b5174b5749151b5acaee0"
-PV = "3.14.14"
+SRCREV = "780f0589876618911eb9cd7ad5a83db249ad1638"
+PV = "3.14.15"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
@@ -55,21 +55,17 @@ KERNEL_CONFIG_FRAGMENTS = "${KERNEL_CONFIG_DIR}/audio_display.cfg ${KERNEL_CONFI
                            ${KERNEL_CONFIG_DIR}/connectivity.cfg ${KERNEL_CONFIG_DIR}/ipc.cfg \
                            ${KERNEL_CONFIG_DIR}/power.cfg"
 
-KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${WORKDIR}/non-smp.cfg ${WORKDIR}/sgx.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${WORKDIR}/non-smp.cfg ${WORKDIR}/sgx.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${WORKDIR}/non-smp.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${WORKDIR}/non-smp.cfg"
 
 # Patches necessary to make SGX graphics work with this kernel version
 SGX_PATCHES = "file://sgx/0001-HACK-drm-fb_helper-enable-panning-support.patch \
                file://sgx/0002-HACK-drm-tilcdc-add-vsync-callback-for-use-in-omaplf.patch \
-               file://sgx/0003-drm-tilcdc-fix-the-ping-pong-dma-tearing-issue-seen-.patch \
-               file://sgx/0004-ARM-OMAP2-Use-pdata-quirks-for-sgx-deassert_hardrese.patch \
-               file://sgx/0005-ARM-dts-am437x-add-SGX-node.patch \
-               file://sgx/0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch"
+               file://sgx/0003-drm-tilcdc-fix-the-ping-pong-dma-tearing-issue-seen-.patch"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
            file://non-smp.cfg \
-           file://sgx.cfg \
           "
 
 SRC_URI_append_ti33x = " ${SGX_PATCHES}"



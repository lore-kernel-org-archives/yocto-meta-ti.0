Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BC9FE00B76; Fri, 30 Oct 2015 15:36:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97397E00B70
	for <meta-ti@yoctoproject.org>; Fri, 30 Oct 2015 15:36:25 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NX200FDQ1G1EHK0@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 30 Oct 2015 17:36:02 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=5lJygRwiOn0A:10 a=sozttTNsAAAA:8
	a=LMiPQXqFAAAA:8	a=-goyPDIiSlF-D_-1Q6sA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E25E8161C6B;	Fri,
	30 Oct 2015 18:36:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 30 Oct 2015 18:35:52 -0400
Message-id: <1446244554-20019-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/3] linux-ti-staging: remove unused patches/configs
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
X-List-Received-Date: Fri, 30 Oct 2015 22:36:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...cache-flush-management-symbols-when-MULTI.patch |  36 -----
 .../0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch  | 150 ---------------------
 .../0007-ARM-dts-am437x-add-DT-node-for-gpu.patch  | 102 --------------
 ...se-pdata-quirks-for-sgx-deassert_hardrese.patch |  96 -------------
 recipes-kernel/linux/linux-ti-staging-4.1/sgx.cfg  |   1 -
 5 files changed, 385 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-4.1/0005-arm-Export-cache-flush-management-symbols-when-MULTI.patch
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-4.1/0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-4.1/0007-ARM-dts-am437x-add-DT-node-for-gpu.patch
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-4.1/0008-ARM-OMAP2-Use-pdata-quirks-for-sgx-deassert_hardrese.patch
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-4.1/sgx.cfg

diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0005-arm-Export-cache-flush-management-symbols-when-MULTI.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0005-arm-Export-cache-flush-management-symbols-when-MULTI.patch
deleted file mode 100644
index 12dd52f..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.1/0005-arm-Export-cache-flush-management-symbols-when-MULTI.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ea8c16f49b043f4f096909e0d7bc0b9d248aafce Mon Sep 17 00:00:00 2001
-From: Pantelis Antoniou <panto@antoniou-consulting.com>
-Date: Fri, 28 Aug 2015 06:17:59 +0000
-Subject: [PATCH 5/8] arm: Export cache flush management symbols when
- !MULTI_CACHE
-
-When compiling a kernel without CONFIG_MULTI_CACHE enabled the
-dma access functions end up not being exported. Fix it.
-
-Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>
-Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- arch/arm/kernel/setup.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
-index 979c1c5..063165d 100644
---- a/arch/arm/kernel/setup.c
-+++ b/arch/arm/kernel/setup.c
-@@ -1137,3 +1137,12 @@ const struct seq_operations cpuinfo_op = {
- 	.stop	= c_stop,
- 	.show	= c_show
- };
-+
-+/* export the cache management functions */
-+#ifndef MULTI_CACHE
-+
-+EXPORT_SYMBOL(__glue(_CACHE,_dma_map_area));
-+EXPORT_SYMBOL(__glue(_CACHE,_dma_unmap_area));
-+EXPORT_SYMBOL(__glue(_CACHE,_dma_flush_range));
-+
-+#endif
--- 
-2.2.0
-
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch
deleted file mode 100644
index 03dc287..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.1/0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 29ce4cbb157611004fb1908b949ac54ca396ca5d Mon Sep 17 00:00:00 2001
-From: Darren Etheridge <detheridge@ti.com>
-Date: Fri, 28 Aug 2015 06:18:00 +0000
-Subject: [PATCH 6/8] ARM: dts: am33xx: add DT node for gpu
-
-Add the node into the am33xx.dtsi file for the SGX GPU.
-
-Signed-off-by: Darren Etheridge <detheridge@ti.com>
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- arch/arm/boot/dts/am335x-bone.dts      | 4 ++++
- arch/arm/boot/dts/am335x-boneblack.dts | 4 ++++
- arch/arm/boot/dts/am335x-evm.dts       | 5 +++++
- arch/arm/boot/dts/am335x-evmsk.dts     | 4 ++++
- arch/arm/boot/dts/am335x-lxm.dts       | 3 +++
- arch/arm/boot/dts/am335x-nano.dts      | 4 ++++
- arch/arm/boot/dts/am335x-pepper.dts    | 4 ++++
- arch/arm/boot/dts/am33xx.dtsi          | 8 ++++++++
- 8 files changed, 36 insertions(+)
- mode change 100644 => 100755 arch/arm/boot/dts/am335x-bone.dts
- mode change 100644 => 100755 arch/arm/boot/dts/am335x-evm.dts
- mode change 100644 => 100755 arch/arm/boot/dts/am335x-evmsk.dts
- mode change 100644 => 100755 arch/arm/boot/dts/am335x-lxm.dts
- mode change 100644 => 100755 arch/arm/boot/dts/am335x-nano.dts
- mode change 100644 => 100755 arch/arm/boot/dts/am335x-pepper.dts
- mode change 100644 => 100755 arch/arm/boot/dts/am33xx.dtsi
-
-diff --git a/arch/arm/boot/dts/am335x-bone.dts b/arch/arm/boot/dts/am335x-bone.dts
-old mode 100644
-new mode 100755
-index 6b849372..ce1b68a
---- a/arch/arm/boot/dts/am335x-bone.dts
-+++ b/arch/arm/boot/dts/am335x-bone.dts
-@@ -24,3 +24,7 @@
- &mmc1 {
- 	vmmc-supply = <&ldo3_reg>;
- };
-+
-+&sgx {
-+	status = "okay";
-+};
-diff --git a/arch/arm/boot/dts/am335x-boneblack.dts b/arch/arm/boot/dts/am335x-boneblack.dts
-index 34c9928..369f34d 100644
---- a/arch/arm/boot/dts/am335x-boneblack.dts
-+++ b/arch/arm/boot/dts/am335x-boneblack.dts
-@@ -33,6 +33,10 @@
- 	status = "okay";
- };
- 
-+&sgx {
-+	status = "okay";
-+};
-+
- &am33xx_pinmux {
- 	nxp_hdmi_bonelt_pins: nxp_hdmi_bonelt_pins {
- 		pinctrl-single,pins = <
-diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
-old mode 100644
-new mode 100755
-index 8704195..2414437
---- a/arch/arm/boot/dts/am335x-evm.dts
-+++ b/arch/arm/boot/dts/am335x-evm.dts
-@@ -905,3 +905,8 @@
- &rtc {
- 	system-power-controller;
- };
-+
-+&sgx {
-+	status = "okay";
-+};
-+
-diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
-old mode 100644
-new mode 100755
-index 3c54b90..74d1943
---- a/arch/arm/boot/dts/am335x-evmsk.dts
-+++ b/arch/arm/boot/dts/am335x-evmsk.dts
-@@ -729,3 +729,7 @@
- &lcdc {
-       status = "okay";
- };
-+
-+&sgx {
-+	status = "okay";
-+};
-diff --git a/arch/arm/boot/dts/am335x-lxm.dts b/arch/arm/boot/dts/am335x-lxm.dts
-old mode 100644
-new mode 100755
-index 5c5667a..c7c51b4
---- a/arch/arm/boot/dts/am335x-lxm.dts
-+++ b/arch/arm/boot/dts/am335x-lxm.dts
-@@ -364,3 +364,6 @@
- 	status = "okay";
- };
- 
-+&sgx {
-+	status = "okay";
-+};
-diff --git a/arch/arm/boot/dts/am335x-nano.dts b/arch/arm/boot/dts/am335x-nano.dts
-old mode 100644
-new mode 100755
-index 5ed4ca6..7dc4b13
---- a/arch/arm/boot/dts/am335x-nano.dts
-+++ b/arch/arm/boot/dts/am335x-nano.dts
-@@ -438,3 +438,7 @@
- 		};
- 	};
- };
-+
-+&sgx {
-+	status = "okay";
-+};
-diff --git a/arch/arm/boot/dts/am335x-pepper.dts b/arch/arm/boot/dts/am335x-pepper.dts
-old mode 100644
-new mode 100755
-index 0d35ab6..67e032d9
---- a/arch/arm/boot/dts/am335x-pepper.dts
-+++ b/arch/arm/boot/dts/am335x-pepper.dts
-@@ -651,3 +651,7 @@
- 		>;
- 	};
- };
-+
-+&sgx {
-+	status = "okay";
-+};
-diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
-old mode 100644
-new mode 100755
-index 308ec9a..86631ba
---- a/arch/arm/boot/dts/am33xx.dtsi
-+++ b/arch/arm/boot/dts/am33xx.dtsi
-@@ -880,6 +880,14 @@
- 			reg = <0x48310000 0x2000>;
- 			interrupts = <111>;
- 		};
-+
-+		sgx: sgx@0x56000000 {
-+			compatible = "ti,am335x-sgx530", "img,sgx530";
-+			ti,hwmods = "gfx";
-+			reg = <0x56000000 0x1000000>;
-+			interrupts = <37>;
-+			status = "disabled";
-+		};
- 	};
- };
- 
--- 
-2.2.0
-
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0007-ARM-dts-am437x-add-DT-node-for-gpu.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0007-ARM-dts-am437x-add-DT-node-for-gpu.patch
deleted file mode 100644
index 540f5cc..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.1/0007-ARM-dts-am437x-add-DT-node-for-gpu.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 975c3e8be136fc459688c5d5e9daf272e6092af0 Mon Sep 17 00:00:00 2001
-From: Darren Etheridge <detheridge@ti.com>
-Date: Fri, 28 Aug 2015 06:18:01 +0000
-Subject: [PATCH 7/8] ARM: dts: am437x: add DT node for gpu
-
-Add dt node to enable SGX PowerVR driver in AM437x base dtsi file.
-
-Signed-off-by: Darren Etheridge <detheridge@ti.com>
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- arch/arm/boot/dts/am4372.dtsi        | 8 ++++++++
- arch/arm/boot/dts/am437x-gp-evm.dts  | 4 ++++
- arch/arm/boot/dts/am437x-idk-evm.dts | 4 ++++
- arch/arm/boot/dts/am437x-sk-evm.dts  | 4 ++++
- arch/arm/boot/dts/am43x-epos-evm.dts | 4 ++++
- 5 files changed, 24 insertions(+)
- mode change 100644 => 100755 arch/arm/boot/dts/am4372.dtsi
- mode change 100644 => 100755 arch/arm/boot/dts/am437x-gp-evm.dts
- mode change 100644 => 100755 arch/arm/boot/dts/am437x-idk-evm.dts
- mode change 100644 => 100755 arch/arm/boot/dts/am437x-sk-evm.dts
- mode change 100644 => 100755 arch/arm/boot/dts/am43x-epos-evm.dts
-
-diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
-old mode 100644
-new mode 100755
-index 72009c2..4fc40b2
---- a/arch/arm/boot/dts/am4372.dtsi
-+++ b/arch/arm/boot/dts/am4372.dtsi
-@@ -789,6 +789,14 @@
- 			dma-names = "tx", "rx";
- 		};
- 
-+		sgx: sgx@0x56000000 {
-+			compatible = "ti,am437x-sgx530", "img,sgx530";
-+			ti,hwmods = "gfx";
-+			reg = <0x56000000 0x1000000>;
-+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-+			status = "disabled";
-+		};
-+
- 		rng: rng@48310000 {
- 			compatible = "ti,omap4-rng";
- 			ti,hwmods = "rng";
-diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
-old mode 100644
-new mode 100755
-index 5a26668..bbd3f84
---- a/arch/arm/boot/dts/am437x-gp-evm.dts
-+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
-@@ -1241,3 +1241,7 @@
- 	status = "okay";
- 	ext-clk-src;
- };
-+
-+&sgx {
-+	status = "okay";
-+};
-diff --git a/arch/arm/boot/dts/am437x-idk-evm.dts b/arch/arm/boot/dts/am437x-idk-evm.dts
-old mode 100644
-new mode 100755
-index f7d8656..ea017df
---- a/arch/arm/boot/dts/am437x-idk-evm.dts
-+++ b/arch/arm/boot/dts/am437x-idk-evm.dts
-@@ -405,3 +405,7 @@
- &cpu {
- 	cpu0-supply = <&tps>;
- };
-+
-+&sgx {
-+	status = "okay";
-+};
-diff --git a/arch/arm/boot/dts/am437x-sk-evm.dts b/arch/arm/boot/dts/am437x-sk-evm.dts
-old mode 100644
-new mode 100755
-index 5506e91..55a1263
---- a/arch/arm/boot/dts/am437x-sk-evm.dts
-+++ b/arch/arm/boot/dts/am437x-sk-evm.dts
-@@ -758,3 +758,7 @@
- &wkup_m3_ipc {
- 	ti,scale-data-fw = "am43x-evm-scale-data.bin";
- };
-+
-+&sgx {
-+	status = "okay";
-+};
-diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
-old mode 100644
-new mode 100755
-index 92515b3..c9e3dbb
---- a/arch/arm/boot/dts/am43x-epos-evm.dts
-+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
-@@ -869,3 +869,7 @@
- &cpu {
- 	cpu0-supply = <&dcdc2>;
- };
-+
-+&sgx {
-+	status = "okay";
-+};
--- 
-2.2.0
-
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0008-ARM-OMAP2-Use-pdata-quirks-for-sgx-deassert_hardrese.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0008-ARM-OMAP2-Use-pdata-quirks-for-sgx-deassert_hardrese.patch
deleted file mode 100644
index a316849..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.1/0008-ARM-OMAP2-Use-pdata-quirks-for-sgx-deassert_hardrese.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 306abd812cbb86a4bffe3d1aee14eb77cc6b1458 Mon Sep 17 00:00:00 2001
-From: Darren Etheridge <detheridge@ti.com>
-Date: Fri, 28 Aug 2015 06:18:02 +0000
-Subject: [PATCH 8/8] ARM: OMAP2+: Use pdata-quirks for sgx deassert_hardreset
-
-Use pdata_quirks to provide platform data to the sgx driver.  This is used
-to provide a function pointer for the sgx driver to access
-omap_device_deassert_hardreset along with the reset name as defined in the
-corresponding hwmod entry.
-
-This platform data will not be required when a seperate reset driver is
-available allowing decoupling from omap_hwmod and omap_device.
-
-Signed-off-by: Darren Etheridge <detheridge@ti.com>
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- arch/arm/mach-omap2/pdata-quirks.c     | 16 +++++++++++++++-
- include/linux/platform_data/sgx-omap.h | 22 ++++++++++++++++++++++
- 2 files changed, 37 insertions(+), 1 deletion(-)
- mode change 100644 => 100755 arch/arm/mach-omap2/pdata-quirks.c
- create mode 100755 include/linux/platform_data/sgx-omap.h
-
-diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
-old mode 100644
-new mode 100755
-index 1377979..f62ad71
---- a/arch/arm/mach-omap2/pdata-quirks.c
-+++ b/arch/arm/mach-omap2/pdata-quirks.c
-@@ -19,6 +19,7 @@
- #include <linux/platform_data/iommu-omap.h>
- #include <linux/platform_data/remoteproc-omap.h>
- #include <linux/platform_data/wkup_m3.h>
-+#include <linux/platform_data/sgx-omap.h>
- #include <linux/platform_data/pci-dra7xx.h>
- 
- #include "common.h"
-@@ -37,7 +38,12 @@ struct pdata_init {
- 
- struct of_dev_auxdata omap_auxdata_lookup[];
- static struct twl4030_gpio_platform_data twl_gpio_auxdata;
--
-+#if defined(CONFIG_SOC_AM33XX) || defined(CONFIG_SOC_AM43XX)
-+static struct gfx_sgx_platform_data sgx_pdata = {
-+	.reset_name = "gfx",
-+	.deassert_reset = omap_device_deassert_hardreset,
-+};
-+#endif
- #if IS_ENABLED(CONFIG_OMAP_IOMMU)
- int omap_iommu_set_pwrdm_constraint(struct platform_device *pdev, bool request,
- 				    u8 *pwrst);
-@@ -377,6 +383,14 @@ struct of_dev_auxdata omap_auxdata_lookup[] __initdata = {
- 	OF_DEV_AUXDATA("ti,am3352-wkup-m3", 0x44d00000, "44d00000.wkup_m3",
- 		       &wkup_m3_data),
- #endif
-+#if defined(CONFIG_SOC_AM33XX)
-+	OF_DEV_AUXDATA("ti,am335x-sgx530", 0x56000000, "56000000.sgx",
-+		       &sgx_pdata),
-+#endif
-+#if defined(CONFIG_SOC_AM43XX)
-+	OF_DEV_AUXDATA("ti,am437x-sgx530", 0x56000000, "56000000.sgx",
-+		       &sgx_pdata),
-+#endif
- #ifdef CONFIG_ARCH_OMAP4
- 	OF_DEV_AUXDATA("ti,omap4-padconf", 0x4a100040, "4a100040.pinmux", &pcs_pdata),
- 	OF_DEV_AUXDATA("ti,omap4-padconf", 0x4a31e040, "4a31e040.pinmux", &pcs_pdata),
-diff --git a/include/linux/platform_data/sgx-omap.h b/include/linux/platform_data/sgx-omap.h
-new file mode 100755
-index 0000000..aa59b2c
---- /dev/null
-+++ b/include/linux/platform_data/sgx-omap.h
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
-2.2.0
-
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/sgx.cfg b/recipes-kernel/linux/linux-ti-staging-4.1/sgx.cfg
deleted file mode 100644
index 37e19a3..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.1/sgx.cfg
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_DRM_OMAP_SGX_PLUGIN=y
-- 
2.2.0



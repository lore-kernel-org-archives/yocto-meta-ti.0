Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1535C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:22:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.822.1675898562344906703
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=v6VQfTTp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NMeqq050705;
	Wed, 8 Feb 2023 17:22:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675898560;
	bh=yesjbW3rVBkzBAA2a9OSiR/b4LKSD+x4ExANs9PpUys=;
	h=From:To:CC:Subject:Date;
	b=v6VQfTTpVcBaJ0zeaE6ylSAG+yRoyIP8bFnLOy/NYsxAlXWbyL/kACIp8xqdQzpvz
	 mem7LkfsdoEPw8YCoWCOZ+qbZYok4DkWTbeC6iYA7HwFgABhfGvXqbmJRbshAQVcB4
	 xMzFJ5n+DRuxQ5p8+0cDVLvZQXY8vB6i98CWpdMk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NMedH017589
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:22:40 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:22:39 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:22:39 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NMdXo053158;
	Wed, 8 Feb 2023 17:22:39 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] uio-module-drv: Remove deprecated uio-module-drv
Date: Wed, 8 Feb 2023 17:22:39 -0600
Message-ID: <20230208232239.17720-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:22:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15766

UIO drivers are generally frowned upon in the community, and for PRU
we now have much better alternatives in RProc, RPmsg, and PRU-Consumer.
Let's not send the wrong message by continuing to support this crufty
interface. Remove the kernel module, DTBs, and test recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../uio-module-drv/uio-module-drv-test_git.bb |  35 ---
 .../uio-module-drv/uio-module-drv.inc         |  19 --
 .../uio-module-drv/uio-module-drv_git.bb      |  20 --
 .../linux/files/dra7xx/am571x-pru-uio.dtsi    | 272 ----------------
 .../linux/files/dra7xx/am57xx-pru-uio.dtsi    | 252 ---------------
 .../linux/files/ti33x/am335x-pru-uio.dtsi     | 192 ------------
 .../linux/files/ti43x/am437x-pru-uio.dtsi     | 292 ------------------
 .../linux/linux-ti-staging_5.10.bb            |   1 -
 meta-ti-bsp/recipes-kernel/linux/ti-uio.inc   |  71 -----
 .../uio-test-pruss/uio-test-pruss_git.bb      |  38 ---
 10 files changed, 1192 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
 delete mode 100644 meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
 delete mode 100644 meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-uio.inc
 delete mode 100644 meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb

diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
deleted file mode 100644
index dc17a1e9..00000000
--- a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Test code for user space IO (UIO) driver"
-
-include uio-module-drv.inc
-
-PR = "r1"
-
-COMPATIBLE_MACHINE = "omap-a15|ti33x|ti43x"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEVICE_NAME:omap-a15 = "am57xx"
-DEVICE_NAME:ti33x = "am33xx"
-DEVICE_NAME:ti43x = "am43xx"
-RDEPENDS:${PN} = "uio-module-drv"
-
-do_compile() {
-	oe_runmake -C ${S} test "DEVICE=${DEVICE_NAME}"
-}
-
-do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/test/uio_mem_test ${D}${bindir}/.
-	install -c -m 755 ${S}/test/uio_int_test ${D}${bindir}/.
-}
-
-do_install:append:omap-a15 () {
-	install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
-}
-
-do_install:append:ti33x () {
-        install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
-}
-
-do_install:append:ti43x () {
-        install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
-}
diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
deleted file mode 100644
index a74b59bb..00000000
--- a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
-
-BRANCH = "master"
-# This corresponds to version 02.03.01.00
-UIO_MODULE_DRV_SRCREV = "78c535afe8f8cc0b715500a63eab0bc3606c0579"
-
-PV = "2.3.1.0+git${SRCPV}"
-
-UIO_MODULE_DRV_GIT_URI = "git://git.ti.com/git/keystone-linux/uio-module-drv.git"
-UIO_MODULE_DRV_GIT_PROTOCOL = "https"
-SRC_URI = "${UIO_MODULE_DRV_GIT_URI};protocol=${UIO_MODULE_DRV_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${UIO_MODULE_DRV_SRCREV}"
-
-S = "${WORKDIR}/git"
-
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST:ti-soc = "(.*)"
diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
deleted file mode 100644
index df5faa9a..00000000
--- a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "User space IO (UIO) driver for on-chip modules"
-
-include uio-module-drv.inc
-
-FILESEXTRAPATHS:prepend:= "${THISDIR}/${PN}:"
-
-# This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR:append = "d"
-PR = "${MACHINE_KERNEL_PR}"
-
-module_auto_load_uio-module-drv = "uio-module-drv"
-
-inherit module
-
-do_install:append () {
-    install -d ${D}${includedir}
-    cp *.h ${D}${includedir}
-}
-
-KERNEL_MODULE_AUTOLOAD += "uio_module_drv"
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
deleted file mode 100644
index 8ca11c78..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
+++ /dev/null
@@ -1,272 +0,0 @@
-&pruss_soc_bus1 {
-                uio_pruss1_mdio: uio_mdio@4b232400 {
-                        status = "okay";
-
-                        compatible = "ti,davinci_mdio";
-                        reg = <0x4b232400 0x90>;
-                        #address-cells = <1>;
-                        #size-cells = <0>;
-                        clocks = <&dpll_gmac_h13x2_ck>;
-                        clock-names = "fck";
-                        bus_freq = <1000000>;
-
-                        reset-gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
-                        reset-delay-us = <2>;   /* PHY datasheet states 1uS min */
-                        uio_pruss1_eth0_phy: uio_ethernet-phy@0 {
-                            reg = <0>;
-                        };
-
-                        uio_pruss1_eth1_phy: uio_ethernet-phy@1 {
-                            reg = <1>;
-                         };
-                };
-
-		uio_pruss1_mem: uio_pruss1_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b200000 0x2000>,
-			      <0x4b202000 0x2000>,
-			      <0x4b210000 0x8000>,
-			      <0x4b220000 0x5404>,
-			      <0x4b226000 0x474>,
-			      <0x4b22e000 0xc04>,
-			      <0x4b232000 0x154>;
-			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
-				    "iep", "mii_rt";
-			status = "okay";
-		};
-		uio_pruss1_mem2: uio_pruss1_mem2 {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b228000 0xd4>,
-			      <0x4b230000 0x174>,
-			      <0x4b232400 0x234>,
-			      <0x40300000 0x40000>;
-			mem-names = "uart", "ecap", "mdio", "ocmc";
-			status = "okay";
-		};
-		uio_pruss1_evt0: uio_pruss1_evt0 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt1: uio_pruss1_evt1 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt2: uio_pruss1_evt2 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt3: uio_pruss1_evt3 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt4: uio_pruss1_evt4 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt5: uio_pruss1_evt5 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt6: uio_pruss1_evt6 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt7: uio_pruss1_evt7 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-
-		uio_pruss1_0_mem: uio_pruss1_0_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b234000 0x3000>,
-			      <0x4b222000 0xb4>,
-			      <0x4b222400 0x3f4>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
-
-		uio_pruss1_1_mem: uio_pruss1_1_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b238000 0x3000>,
-			      <0x4b224000 0xb4>,
-			      <0x4b224400 0x3f4>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
-};
-
-&pruss_soc_bus2 {
-                uio_pruss2_mdio: uio_mdio@4b2b2400 {
-                        compatible = "ti,davinci_mdio";
-                        reg = <0x4b2b2400 0x90>;
-                        #address-cells = <1>;
-                        #size-cells = <0>;
-                        clocks = <&dpll_gmac_h13x2_ck>;
-                        clock-names = "fck";
-                        bus_freq = <1000000>;
-                        status = "okay";
-
-                        reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
-                        reset-delay-us = <2>;   /* PHY datasheet states 1uS min */
-
-                        uio_pruss2_eth0_phy: ethernet-phy@0 {
-                           reg = <0>;
-                        };
-
-                        uio_pruss2_eth1_phy: ethernet-phy@1 {
-                            reg = <1>;
-                         };
-                };
-
-		uio_pruss2_mem: uio_pruss2_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b280000 0x2000>,
-			      <0x4b282000 0x2000>,
-			      <0x4b290000 0x8000>,
-			      <0x4b2a0000 0x5404>,
-			      <0x4b2a6000 0x474>,
-			      <0x4b2ae000 0xc04>,
-			      <0x4b2b2000 0x154>;
-			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
-				    "iep", "mii_rt";
-			status = "okay";
-		};
-		uio_pruss2_mem2: uio_pruss2_mem2 {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b2a8000 0xd4>,
-			      <0x4b2b0000 0x174>,
-			      <0x4b2b2400 0x234>,
-			      <0x40340000 0x40000>;
-			mem-names = "uart", "ecap", "mdio", "ocmc";
-			status = "okay";
-		};
-		uio_pruss2_evt0: uio_pruss2_evt0 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt1: uio_pruss2_evt1 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt2: uio_pruss2_evt2 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt3: uio_pruss2_evt3 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt4: uio_pruss2_evt4 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt5: uio_pruss2_evt5 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt6: uio_pruss2_evt6 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt7: uio_pruss2_evt7 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-
-		uio_pruss2_0_mem: uio_pruss2_0_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b2b4000 0x3000>,
-			      <0x4b2a2000 0xb4>,
-			      <0x4b2a2400 0x3f4>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
-		uio_pruss2_1_mem: uio_pruss2_1_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b2b8000 0x3000>,
-			      <0x4b2a4000 0xb4>,
-			      <0x4b2a4400 0x3f4>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
-	};
-
-&pruss2_emac0 {
-        status = "disabled";
-};
-
-&pruss2_emac1 {
-        status = "disabled";
-};
-
-&pruss1 {
-	status = "disabled";
-};
-
-&pru1_0 {
-        status = "disabled";
-};
-
-&pru1_1 {
-        status = "disabled";
-};
-
-&pruss1_intc {
-        status = "disabled";
-};
-
-&pruss1_mdio {
-        status = "disabled";
-};
-
-&pruss2 {
-	status = "disabled";
-};
-
-&pru2_0 {
-        status = "disabled";
-};
-
-&pru2_1 {
-        status = "disabled";
-};
-
-&pruss2_intc {
-        status = "disabled";
-};
-
-&pruss2_mdio {
-        status = "disabled";
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
deleted file mode 100644
index 4cc57118..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
+++ /dev/null
@@ -1,252 +0,0 @@
-&pruss_soc_bus1 {
-                uio_pruss1_mem: uio_pruss1_mem {
-                        compatible = "ti,uio-module-drv";
-                        mem = <0x4b200000 0x2000>,
-                              <0x4b202000 0x2000>,
-                              <0x4b210000 0x8000>,
-                              <0x4b220000 0x2000>,
-                              <0x4b226000 0x2000>,
-                              <0x4b22e000 0x31c>,
-                              <0x4b232000 0x58>;
-                        mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
-                                    "iep", "mii_rt";
-                        status = "okay";
-                };
-                uio_pruss1_mem2: uio_pruss1_mem2 {
-                        compatible = "ti,uio-module-drv";
-                        mem = <0x4b228000 0x38>,
-                              <0x4b230000 0x60>,
-                              <0x4b232400 0x90>,
-                              <0x40340000 0x40000>;
-                        mem-names = "uart", "ecap", "mdio", "ocmc";
-                        status = "okay";
-                };
-                uio_pruss1_evt0: uio_pruss1_evt0 {
-                        compatible = "ti,uio-module-drv";
-                        interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
-                        interrupt-mode = <1>;
-                        status = "okay";
-                };
-                uio_pruss1_evt1: uio_pruss1_evt1 {
-                        compatible = "ti,uio-module-drv";
-                        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
-                        interrupt-mode = <1>;
-                        status = "okay";
-                };
-                uio_pruss1_evt2: uio_pruss1_evt2 {
-                        compatible = "ti,uio-module-drv";
-                        interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
-                        interrupt-mode = <1>;
-                        status = "okay";
-                };
-                uio_pruss1_evt3: uio_pruss1_evt3 {
-                        compatible = "ti,uio-module-drv";
-                        interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
-                        interrupt-mode = <1>;
-                        status = "okay";
-                };
-                uio_pruss1_evt4: uio_pruss1_evt4 {
-                        compatible = "ti,uio-module-drv";
-                        interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
-                        interrupt-mode = <1>;
-                        status = "okay";
-                };
-                uio_pruss1_evt5: uio_pruss1_evt5 {
-                        compatible = "ti,uio-module-drv";
-                        interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
-                        interrupt-mode = <1>;
-                        status = "okay";
-                };
-                uio_pruss1_evt6: uio_pruss1_evt6 {
-                        compatible = "ti,uio-module-drv";
-                        interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
-                        interrupt-mode = <1>;
-                        status = "okay";
-                };
-                uio_pruss1_evt7: uio_pruss1_evt7 {
-                        compatible = "ti,uio-module-drv";
-                        interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
-                        interrupt-mode = <1>;
-                        status = "okay";
-                };
-
-                uio_pruss1_0_mem: uio_pruss1_0_mem {
-                        compatible = "ti,uio-module-drv";
-                        mem = <0x4b234000 0x3000>,
-                              <0x4b222000 0x400>,
-                              <0x4b222400 0x100>;
-                        mem-names = "iram", "control", "debug";
-                        status = "okay";
-                };
-
-                uio_pruss1_1_mem: uio_pruss1_1_mem {
-                        compatible = "ti,uio-module-drv";
-                        mem = <0x4b238000 0x3000>,
-                              <0x4b224000 0x400>,
-                              <0x4b224400 0x100>;
-                        mem-names = "iram", "control", "debug";
-                        status = "okay";
-                };
-};
-
-&pruss1 {
-        status = "disabled";
-};
-
-&pru1_0 {
-        status = "disabled";
-};
-
-&pru1_1 {
-        status = "disabled";
-};
-
-&pruss1_intc {
-        status = "disabled";
-};
-
-&pruss_soc_bus2 {
-                uio_pruss2_mdio: uio_mdio@4b2b2400 {
-                    compatible = "ti,davinci_mdio";
-                    reg = <0x4b2b2400 0x90>;
-                    #address-cells = <1>;
-                    #size-cells = <0>;
-                    clocks = <&dpll_gmac_h13x2_ck>;
-                    clock-names = "fck";
-                    bus_freq = <1000000>;
-                    status = "disabled";
-                };
-
-		uio_pruss2_mem: uio_pruss2_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b280000 0x2000>,
-			      <0x4b282000 0x2000>,
-			      <0x4b290000 0x8000>,
-			      <0x4b2a0000 0x2000>,
-			      <0x4b2a6000 0x2000>,
-			      <0x4b2ae000 0x31c>,
-			      <0x4b2b2000 0x58>;
-			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
-				    "iep", "mii_rt";
-			status = "okay";
-		};
-		uio_pruss2_mem2: uio_pruss2_mem2 {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b2a8000 0x38>,
-			      <0x4b2b0000 0x60>,
-			      <0x4b2b2400 0x90>,
-			      <0x40300000 0x40000>;
-			mem-names = "uart", "ecap", "mdio", "ocmc";
-			status = "okay";
-		};
-		uio_pruss2_evt0: uio_pruss2_evt0 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt1: uio_pruss2_evt1 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt2: uio_pruss2_evt2 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt3: uio_pruss2_evt3 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt4: uio_pruss2_evt4 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt5: uio_pruss2_evt5 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt6: uio_pruss2_evt6 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt7: uio_pruss2_evt7 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-
-		uio_pruss2_0_mem: uio_pruss2_0_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b2b4000 0x3000>,
-			      <0x4b2a2000 0x400>,
-			      <0x4b2a2400 0x100>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
-		uio_pruss2_1_mem: uio_pruss2_1_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b2b8000 0x3000>,
-			      <0x4b2a4000 0x400>,
-			      <0x4b2a4400 0x100>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
-};
-
-&uio_pruss2_mdio {
-        reset-gpios = <&gpio5 8 GPIO_ACTIVE_LOW>,
-                      <&gpio5 9 GPIO_ACTIVE_LOW>;
-        reset-delay-us = <2>;   /* PHY datasheet states 1uS min */
-};
-
-&uio_pruss2_mdio {
-         status = "okay";
-         uio_pruss2_eth0_phy: uio_pruss2_eth0_phy@0 {
-             reg = <0>;
-         };
-
-         uio_pruss2_eth1_phy: uio_pruss2_eth1_phy@1 {
-              reg = <1>;
-          };
-};
-
-&pruss2_emac0 {
-        status = "disabled";
-};
-
-&pruss2_emac1 {
-        status = "disabled";
-};
-
-&pruss2 {
-        status = "disabled";
-};
-
-&pru2_0 {
-	status = "disabled";
-};
-
-&pru2_1 {
-	status = "disabled";
-};
-
-&pruss2_intc {
-        status = "disabled";
-};
-
-&pruss2_mdio {
-        status = "disabled";
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
deleted file mode 100644
index 93a40ab5..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
+++ /dev/null
@@ -1,192 +0,0 @@
-&pruss_soc_bus {
-		uio_pruss_mdio: uio_mdio@4a332400 {
-			compatible = "ti,davinci_mdio";
-			reg = <0x4a332400 0x90>;
-			clocks = <&dpll_core_m4_ck>;
-			clock-names = "fck";
-			bus_freq = <1000000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		uio_pruss_mem: uio_pruss_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4a300000 0x2000>,
-			      <0x4a302000 0x2000>,
-			      <0x4a310000 0x3000>,
-			      <0x4a320000 0x2000>,
-			      <0x4a326000 0x2000>,
-			      <0x4a32e000 0x31c>,
-			      <0x4a332000 0x58>;
-			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
-				    "iep", "mii_rt";
-
-			status = "okay";
-		};
-		uio_pruss_mem2: uio_pruss_mem2 {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4a328000 0xd4>,
-			      <0x4a330000 0x174>,
-			      <0x4a332400 0x90>,
-			      <0x40302000 0x0e000>;
-			mem-names = "uart", "ecap", "mdio", "ocmc";
-			status = "okay";
-		};
-
-		uio_pruss_evt0: uio_pruss_evt0 {
-			compatible = "ti,uio-module-drv";
-                        interrupts = <20>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss_evt1: uio_pruss_evt1 {
-			compatible = "ti,uio-module-drv";
-                        interrupts = <21>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss_evt2: uio_pruss_evt2 {
-			compatible = "ti,uio-module-drv";
-                        interrupts = <22>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss_evt3: uio_pruss_evt3 {
-			compatible = "ti,uio-module-drv";
-                        interrupts = <23>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss_evt4: uio_pruss_evt4 {
-			compatible = "ti,uio-module-drv";
-                        interrupts = <24>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss_evt5: uio_pruss_evt5 {
-			compatible = "ti,uio-module-drv";
-                        interrupts = <25>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss_evt6: uio_pruss_evt6 {
-			compatible = "ti,uio-module-drv";
-                        interrupts = <26>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss_evt7: uio_pruss_evt7 {
-			compatible = "ti,uio-module-drv";
-                        interrupts = <27>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-
-		uio_pruss_0_mem: uio_pruss_0_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4a334000 0x2000>,
-			      <0x4a322000 0x400>,
-			      <0x4a322400 0x100>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
-
-		uio_pruss_1_mem: uio_pruss_1_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4a338000 0x2000>,
-			      <0x4a324000 0x400>,
-			      <0x4a324400 0x100>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
-};
-
-&am33xx_pinmux {
-	uio_pruss_mdio_eth_default: uio_pruss_mdio_eht_default {
-		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x88c, (PIN_OUTPUT | MUX_MODE5))           /* gpmc_clk.pr1_mdio_mdclk */
-			AM33XX_IOPAD(0x888, (PIN_INPUT  | MUX_MODE5))           /* gpmc_csn3.pr1_mdio_data */
-			AM33XX_IOPAD(0x89c, (PIN_INPUT_PULLUP | MUX_MODE7))     /* gpmc_ben0_cle.gpio2_5 */
-			/* disable CPSW MDIO */
-			AM33XX_IOPAD(0x948, (PIN_INPUT_PULLUP | MUX_MODE7))     /* mdio_data.gpio0_0 */
-			AM33XX_IOPAD(0x94c, (PIN_INPUT_PULLUP | MUX_MODE7))     /* mdio_clk.gpio0_1 */
-			AM33XX_IOPAD(0x8a0, (PIN_INPUT  | MUX_MODE2))   /* dss_data0.pr1_mii_mt0_clk */
-			AM33XX_IOPAD(0x8b4, (PIN_OUTPUT | MUX_MODE2))   /* dss_data5.pr1_mii0_txd0 */
-			AM33XX_IOPAD(0x8b0, (PIN_OUTPUT | MUX_MODE2))   /* dss_data4.pr1_mii0_txd1 */
-			AM33XX_IOPAD(0x8ac, (PIN_OUTPUT | MUX_MODE2))   /* dss_data3.pr1_mii0_txd2 */
-			AM33XX_IOPAD(0x8a8, (PIN_OUTPUT | MUX_MODE2))   /* dss_data2.pr1_mii0_txd3 */
-			AM33XX_IOPAD(0x8cc, (PIN_INPUT  | MUX_MODE5))   /* dss_data11.pr1_mii0_rxd0 */
-			AM33XX_IOPAD(0x8c8, (PIN_INPUT  | MUX_MODE5))   /* dss_data10.pr1_mii0_rxd1 */
-			AM33XX_IOPAD(0x8c4, (PIN_INPUT  | MUX_MODE5))   /* dss_data9.pr1_mii0_rxd2 */
-			AM33XX_IOPAD(0x8c0, (PIN_INPUT  | MUX_MODE5))   /* dss_data8.pr1_mii0_rxd3 */
-			AM33XX_IOPAD(0x8a4, (PIN_OUTPUT | MUX_MODE2))   /* dss_data1.pr1_mii0_txen */
-			AM33XX_IOPAD(0x8d8, (PIN_INPUT  | MUX_MODE5))   /* dss_data14.pr1_mii_mr0_clk */
-			AM33XX_IOPAD(0x8dc, (PIN_INPUT  | MUX_MODE5))   /* dss_data15.pr1_mii0_rxdv */
-			AM33XX_IOPAD(0x8d4, (PIN_INPUT  | MUX_MODE5))   /* dss_data13.pr1_mii0_rxer */
-			AM33XX_IOPAD(0x8d0, (PIN_INPUT  | MUX_MODE5))   /* dss_data12.pr1_mii0_rxlink */
-			AM33XX_IOPAD(0x8e8, (PIN_INPUT  | MUX_MODE2))   /* dss_pclk.pr1_mii0_crs */
-
-			AM33XX_IOPAD(0x840, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a0.pr1_mii_mt1_clk */
-			AM33XX_IOPAD(0x850, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a4.pr1_mii1_txd0 */
-			AM33XX_IOPAD(0x84c, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a3.pr1_mii1_txd1 */
-			AM33XX_IOPAD(0x848, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a2.pr1_mii1_txd2 */
-			AM33XX_IOPAD(0x844, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a1.pr1_mii1_txd3 */
-			AM33XX_IOPAD(0x860, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a8.pr1_mii1_rxd0 */
-			AM33XX_IOPAD(0x85c, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a7.pr1_mii1_rxd1 */
-			AM33XX_IOPAD(0x858, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a6.pr1_mii1_rxd2 */
-			AM33XX_IOPAD(0x854, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a5.pr1_mii1_rxd3 */
-			AM33XX_IOPAD(0x874, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_wpn.pr1_mii1_txen */
-			AM33XX_IOPAD(0x864, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a9.pr1_mii_mr1_clk */
-			AM33XX_IOPAD(0x868, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a10.pr1_mii1_rxdv */
-			AM33XX_IOPAD(0x86c, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a11.pr1_mii1_rxer */
-			AM33XX_IOPAD(0x878, (PIN_INPUT  | MUX_MODE5))   /* gpmc_ben1.pr1_mii1_rxlink */
-			AM33XX_IOPAD(0x8ec, (PIN_INPUT  | MUX_MODE2))   /* lcd_ac_bias_en.pr1_mii1_crs */
-			AM33XX_IOPAD(0x870, (PIN_INPUT  | MUX_MODE5))   /* gpmc_wait0.pr1_mii1_col */
-		>;
-	};
-};
-
-&uio_pruss_mdio {
-	pinctrl-0 = <&uio_pruss_mdio_eth_default>;
-	pinctrl-names = "default";
-	reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
-	reset-delay-us = <2>; /* PHY datasheet states 1uS min */
-	status = "okay";
-
-	uio_pruss_eth0_phy: ethernet-phy@1 {
-		reg = <1>;
-	};
-
-	uio_pruss_eth1_phy: ethernet-phy@3 {
-		reg = <3>;
-	};
-};
-
-&pruss {
-	status = "disabled";
-};
-
-&pru0 {
-	status = "disabled";
-};
-
-&pru1 {
-	status = "disabled";
-};
-
-&pruss_intc {
-	status = "disabled";
-};
-
-&pruss_mdio {
-	status = "disabled";
-};
-
-&pruss_emac0 {
-        status = "disabled";
-};
-
-&pruss_emac1 {
-        status = "disabled";
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi
deleted file mode 100644
index 80993c4b..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi
+++ /dev/null
@@ -1,292 +0,0 @@
-&pruss_soc_bus {
-		uio_pruss2_mdio: uio_mdio@54432400 {
-			compatible = "ti,davinci_mdio";
-			reg = <0x54432400 0x90>;
-			clocks = <&dpll_core_m4_ck>;
-			clock-names = "fck";
-			bus_freq = <1000000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		uio_pruss2_mem: uio_pruss2_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x54400000 0x2000>,
-			      <0x54402000 0x2000>,
-			      <0x54410000 0x8000>,
-			      <0x54420000 0x2000>,
-			      <0x54426000 0x2000>,
-			      <0x5442e000 0x31c>,
-			      <0x54432000 0x58>;
-			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
-				    "iep", "mii_rt";
-			status = "okay";
-		};
-		uio_pruss2_mem2: uio_pruss2_mem2 {
-			compatible = "ti,uio-module-drv";
-			mem = <0x54428000 0x38>,
-			      <0x54430000 0x60>,
-			      <0x54432400 0x90>,
-			      <0x40320000 0x20000>;
-			mem-names = "uart", "ecap", "mdio", "ocmc";
-			status = "okay";
-		};
-		uio_pruss2_evt0: uio_pruss2_evt0 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt1: uio_pruss2_evt1 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt2: uio_pruss2_evt2 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt3: uio_pruss2_evt3 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt4: uio_pruss2_evt4 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt5: uio_pruss2_evt5 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt6: uio_pruss2_evt6 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss2_evt7: uio_pruss2_evt7 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-
-		uio_pruss2_0_mem: uio_pruss2_0_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x54434000 0x3000>,
-			      <0x54422000 0x400>,
-			      <0x54422400 0x100>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
-
-		uio_pruss2_1_mem: uio_pruss2_1_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x54438000 0x3000>,
-			      <0x54424000 0x400>,
-			      <0x54424400 0x100>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
-
-		uio_pruss1_mem: uio_pruss1_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x54440000 0x1000>,
-			      <0x54442000 0x1000>,
-			      <0x54450000 0x8000>,
-			      <0x54460000 0x2000>,
-			      <0x54466000 0x2000>,
-			      <0x5446e000 0x31c>,
-			      <0x54472000 0x58>;
-			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
-				    "iep", "mii_rt";
-			status = "okay";
-		};
-		uio_pruss1_mem2: uio_pruss1_mem2 {
-			compatible = "ti,uio-module-drv";
-			mem = <0x54468000 0x38>,
-			      <0x54470000 0x60>,
-			      <0x54472400 0x90>,
-			      <0x40302000 0x1e000>;
-			mem-names = "uart", "ecap", "mdio", "ocmc";
-			status = "okay";
-		};
-		uio_pruss1_evt0: uio_pruss1_evt0 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt1: uio_pruss1_evt1 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt2: uio_pruss1_evt2 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt3: uio_pruss1_evt3 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt4: uio_pruss1_evt4 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt5: uio_pruss1_evt5 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt6: uio_pruss1_evt6 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-		uio_pruss1_evt7: uio_pruss1_evt7 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-mode = <1>;
-			status = "okay";
-		};
-
-		uio_pruss1_0_mem: uio_pruss1_0_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x54474000 0x1000>,
-			      <0x54462000 0x400>,
-			      <0x54462400 0x100>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
-		uio_pruss1_1_mem: uio_pruss1_1_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x54478000 0x1000>,
-			      <0x54464000 0x400>,
-			      <0x54464400 0x100>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
-};
-
-&am43xx_pinmux {
-	uio_pruss2_mdio_eth_default: uio_pruss2_mdio_eth_default {
-		pinctrl-single,pins = <
-			AM4372_IOPAD(0x88c, (PIN_OUTPUT | MUX_MODE5))           /* gpmc_clk.pr1_mdio_mdclk */
-			AM4372_IOPAD(0xa70, (PIN_INPUT  | MUX_MODE8))           /* xdma_event_intr0.pr1_mdio_data */
-			AM4372_IOPAD(0xa00, (PIN_INPUT_PULLUP | MUX_MODE7))     /* cam1_data6.gpio4_20 */
-			AM4372_IOPAD(0x8a0, (PIN_INPUT  | MUX_MODE2))   /* dss_data0.pr1_mii_mt0_clk */
-			AM4372_IOPAD(0x8b4, (PIN_OUTPUT | MUX_MODE2))   /* dss_data5.pr1_mii0_txd0 */
-			AM4372_IOPAD(0x8b0, (PIN_OUTPUT | MUX_MODE2))   /* dss_data4.pr1_mii0_txd1 */
-			AM4372_IOPAD(0x8ac, (PIN_OUTPUT | MUX_MODE2))   /* dss_data3.pr1_mii0_txd2 */
-			AM4372_IOPAD(0x8a8, (PIN_OUTPUT | MUX_MODE2))   /* dss_data2.pr1_mii0_txd3 */
-			AM4372_IOPAD(0x8cc, (PIN_INPUT  | MUX_MODE5))   /* dss_data11.pr1_mii0_rxd0 */
-			AM4372_IOPAD(0x8c8, (PIN_INPUT  | MUX_MODE5))   /* dss_data10.pr1_mii0_rxd1 */
-			AM4372_IOPAD(0x8c4, (PIN_INPUT  | MUX_MODE5))   /* dss_data9.pr1_mii0_rxd2 */
-			AM4372_IOPAD(0x8c0, (PIN_INPUT  | MUX_MODE5))   /* dss_data8.pr1_mii0_rxd3 */
-			AM4372_IOPAD(0x8a4, (PIN_OUTPUT | MUX_MODE2))   /* dss_data1.pr1_mii0_txen */
-			AM4372_IOPAD(0x8d8, (PIN_INPUT  | MUX_MODE5))   /* dss_data14.pr1_mii_mr0_clk */
-			AM4372_IOPAD(0x8dc, (PIN_INPUT  | MUX_MODE5))   /* dss_data15.pr1_mii0_rxdv */
-			AM4372_IOPAD(0x8d4, (PIN_INPUT  | MUX_MODE5))   /* dss_data13.pr1_mii0_rxer */
-			AM4372_IOPAD(0x8d0, (PIN_INPUT  | MUX_MODE5))   /* dss_data12.pr1_mii0_rxlink */
-			AM4372_IOPAD(0xa40, (PIN_INPUT  | MUX_MODE5))   /* gpio5_10.pr1_mii0_crs */
-			AM4372_IOPAD(0xa38, (PIN_INPUT  | MUX_MODE5))   /* gpio5_8.pr1_mii0_col */
-			AM4372_IOPAD(0x858, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a6.pr1_mii_mt1_clk */
-			AM4372_IOPAD(0x854, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a5.pr1_mii1_txd0 */
-			AM4372_IOPAD(0x850, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a4.pr1_mii1_txd1 */
-			AM4372_IOPAD(0x84c, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a3.pr1_mii1_txd2 */
-			AM4372_IOPAD(0x848, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a2.pr1_mii1_txd3 */
-			AM4372_IOPAD(0x86c, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a11.pr1_mii1_rxd0 */
-			AM4372_IOPAD(0x868, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a10.pr1_mii1_rxd1 */
-			AM4372_IOPAD(0x864, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a9.pr1_mii1_rxd2 */
-			AM4372_IOPAD(0x860, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a8.pr1_mii1_rxd3 */
-			AM4372_IOPAD(0x840, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a0.pr1_mii1_txen */
-			AM4372_IOPAD(0x85c, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a7.pr1_mii_mr1_clk */
-			AM4372_IOPAD(0x844, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a1.pr1_mii1_rxdv */
-			AM4372_IOPAD(0x874, (PIN_INPUT  | MUX_MODE5))   /* gpmc_wpn.pr1_mii1_rxer */
-			AM4372_IOPAD(0xa4c, (PIN_INPUT  | MUX_MODE5))   /* gpio5_13.pr1_mii1_rxlink */
-			AM4372_IOPAD(0xa44, (PIN_INPUT  | MUX_MODE5))   /* gpio5_11.pr1_mii1_crs */
-			AM4372_IOPAD(0x878, (PIN_INPUT  | MUX_MODE5))   /* gpmc_be1n.pr1_mii1_col */
-		>;
-	};
-};
-
-&uio_pruss2_mdio {
-	pinctrl-0 = <&uio_pruss2_mdio_eth_default>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	reset-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
-	reset-delay-us = <2>;   /* PHY datasheet states 1uS min */
-
-	uio_pruss2_eth0_phy: uio_ethernet-phy@0 {
-		reg = <0>;
-	};
-
-	uio_pruss2_eth1_phy: uio_ethernet-phy@1 {
-		reg = <1>;
-	};
-};
-
-&pruss1 {
-	status = "disabled";
-};
-
-&pru1_0 {
-	status = "disabled";
-};
-
-&pru1_1 {
-	status = "disabled";
-};
-
-&pruss1_intc {
-	status = "disabled";
-};
-
-&pruss1_mdio {
-	status = "disabled";
-};
-
-&pruss0 {
-	status = "disabled";
-};
-
-&pru0_0 {
-	status = "disabled";
-};
-
-&pru0_1 {
-	status = "disabled";
-};
-
-&pruss0_intc {
-	status = "disabled";
-};
-
-&pruss1_emac0 {
-	status = "disabled";
-};
-
-&pruss1_emac1 {
-	status = "disabled";
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 67b28b2a..e6d4b107 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -7,7 +7,6 @@ inherit kernel
 
 DEFCONFIG_BUILDER = "${S}/ti_config_fragments/defconfig_builder.sh"
 require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/ti-uio.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-uio.inc b/meta-ti-bsp/recipes-kernel/linux/ti-uio.inc
deleted file mode 100644
index eea7866a..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/ti-uio.inc
+++ /dev/null
@@ -1,71 +0,0 @@
-SRC_URI:append:dra7xx = " file://am57xx-pru-uio.dtsi \
-                          file://am571x-pru-uio.dtsi \
-"
-SRC_URI:append:ti33x = " file://am335x-pru-uio.dtsi"
-SRC_URI:append:ti43x = " file://am437x-pru-uio.dtsi"
-
-DTSI_LIST = ""
-
-do_setup_uio() {
-    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
-    then
-        for dtsi in ${DTSI_LIST}
-        do
-            cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
-            for dtb in ${KERNEL_DEVICETREE}
-            do
-                dts=`echo $dtb | sed -e 's|dtb$|dts|'`
-                echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
-            done
-        done
-    fi
-}
-
-do_setup_uio:append:dra7xx() {
-
-    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
-    then
-        dtsi="am57xx-pru-uio.dtsi"
-        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
-
-        dts="am572x-idk-pru-excl-uio.dts"
-        cp ${S}/arch/arm/boot/dts/am572x-idk.dts ${S}/arch/arm/boot/dts/$dts
-        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
-
-        dts="am574x-idk-pru-excl-uio.dts"
-        cp ${S}/arch/arm/boot/dts/am574x-idk.dts ${S}/arch/arm/boot/dts/$dts
-        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
-
-        dts="am571x-idk-pru-excl-uio.dts"
-        dtsi="am571x-pru-uio.dtsi"
-        cp ${S}/arch/arm/boot/dts/am571x-idk.dts ${S}/arch/arm/boot/dts/$dts
-        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
-        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
-    fi
-}
-
-do_setup_uio:append:ti33x() {
-
-    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
-    then
-        dts="am335x-icev2-pru-excl-uio.dts"
-        dtsi="am335x-pru-uio.dtsi"
-        cp ${S}/arch/arm/boot/dts/am335x-icev2-prueth.dts ${S}/arch/arm/boot/dts/$dts
-        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
-        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
-    fi
-}
-
-do_setup_uio:append:ti43x() {
-
-    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
-    then
-        dts="am437x-idk-pru-excl-uio.dts"
-        dtsi="am437x-pru-uio.dtsi"
-        cp ${S}/arch/arm/boot/dts/am437x-idk-evm.dts ${S}/arch/arm/boot/dts/$dts
-        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
-        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
-    fi
-}
-
-do_patch[postfuncs] += "do_setup_uio"
diff --git a/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
deleted file mode 100644
index d9a420d8..00000000
--- a/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION = "Provides test pruss firmware for uio based tests"
-LICENSE = "BSD-3-Clause"
-PV = "1.0.2.0"
-require recipes-ti/includes/ti-paths.inc
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "ti-cgt-pru-native"
-
-BRANCH = "master"
-LIC_FILES_CHKSUM = "file://Makefile;startline=1;endline=31;md5=0ee4f2c42eb6b04e37859bb55a18b144"
-
-UIO_TEST_PRUSS_GIT_URI = "git://git.ti.com/git/processor-sdk/uio-test-pruss.git"
-UIO_TEST_PRUSS_GIT_PROTOCOL = "https"
-SRC_URI = "${UIO_TEST_PRUSS_GIT_URI};protocol=${UIO_TEST_PRUSS_GIT_PROTOCOL};branch=${BRANCH}"
-
-# Corresponds to version 01.00.02.00
-UIO_TEST_PRUSS_SRCREV = "e52a7b099d7203ca52519650df51419e9fef7e0c"
-
-SRCREV = "${UIO_TEST_PRUSS_SRCREV}"
-
-PR = "r0"
-
-COMPATIBLE_MACHINE = "omap-a15|ti33x|ti43x"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEVICE_NAME = ""
-DEVICE_NAME:append:am57xx-evm = "am57xx"
-DEVICE_NAME:append:ti33x = "am33xx"
-DEVICE_NAME:append:ti43x = "am43xx"
-
-EXTRA_OEMAKE = "CGT_PRU=${TI_CGT_PRU_INSTALL_DIR} DEVICE=${DEVICE_NAME}"
-
-do_install() {
-    install -d ${D}${bindir}/
-    cp -r *.bin ${D}${bindir}/
-}
-- 
2.39.1



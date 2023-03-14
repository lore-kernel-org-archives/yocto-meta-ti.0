Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C743C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 16:20:32 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1298.1678810829075490195
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Mar 2023 09:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Y9ARxcpF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32EGKRMW111381;
	Tue, 14 Mar 2023 11:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678810827;
	bh=brq6JmkPtYuaXheia1kbO8NQtxtgf9viJUT3Bmq+J5w=;
	h=From:To:CC:Subject:Date;
	b=Y9ARxcpFjoOPzWOtedGZDbfnQseXZax4ibG86AvaZWG2uygx3WhL1UYLa3J93cDOI
	 b/RPawQHzzy0sciUICDR5zCCPBfcsk9LJKFq5KWAgaP8nGAPasEouAED7ecAKDc33t
	 rUsRRTWcbTHnTo5a0kB0mQWVACE7aMCF0f4HAmS0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32EGKRaY006270
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Mar 2023 11:20:27 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 14
 Mar 2023 11:20:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 14 Mar 2023 11:20:27 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32EGKRhR116086;
	Tue, 14 Mar 2023 11:20:27 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] linux-ti-staging: Add 6.1 recipe
Date: Tue, 14 Mar 2023 11:20:27 -0500
Message-ID: <20230314162027.28974-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Mar 2023 16:20:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15977

Remove all non-upstream Device Tree Overlays. We could have filtered them
out like as done in mainline and next testing. The issue would be as they
are added back to 6.1 and upstream we would need to conditionally
re-enable each. Easier to get a clean start.

Switch to software rendering as the Rogue kernel mode driver does not
build yet for kernel v6.1.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am57xx-evm.conf      | 10 ----
 meta-ti-bsp/conf/machine/am62xx-evm.conf      |  1 -
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  1 -
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 51 -------------------
 meta-ti-bsp/conf/machine/dra7xx-evm.conf      |  8 ---
 meta-ti-bsp/conf/machine/include/am62xx.inc   |  2 +-
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  3 --
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 10 ----
 meta-ti-bsp/conf/machine/include/j721e.inc    |  2 +-
 meta-ti-bsp/conf/machine/include/j721s2.inc   |  2 +-
 meta-ti-bsp/conf/machine/include/j784s4.inc   |  2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    |  2 -
 meta-ti-bsp/conf/machine/j721e-evm.conf       |  1 -
 meta-ti-bsp/conf/machine/j721s2-evm.conf      |  1 -
 .../linux/linux-ti-staging-6.1/defconfig      |  2 +
 .../linux/linux-ti-staging-6.1/k3/defconfig   |  2 +
 .../linux-ti-staging-6.1/omapl138/defconfig   |  1 +
 .../linux/linux-ti-staging_6.1.bb             | 36 +++++++++++++
 18 files changed, 45 insertions(+), 92 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb

diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
index b3525a0b..7d190753 100644
--- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
@@ -13,19 +13,9 @@ KERNEL_DEVICETREE = " \
     am57xx-beagle-x15-revb1.dtb \
     am57xx-beagle-x15-revc.dtb \
     am5729-beagleboneai.dtb \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am57xx-evm.dtb', d)} \
-    ti/am57xx-evm-common.dtbo \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am57xx-evm-reva3.dtb', d)} \
-    ti/am57xx-evm-reva3.dtbo \
     am571x-idk.dtb \
-    ti/am571x-idk-touchscreen.dtbo \
     am572x-idk.dtb \
     am574x-idk.dtb \
-    ti/am57xx-idk-osd-lcd-common.dtbo \
-    ti/am572x-idk-touchscreen.dtbo \
-    ti/lcd-osd101t2587.dtbo \
-    ti/lcd-osd101t2045.dtbo \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'ti/ov10635.dtbo', d)} \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index 73859d5f..35910ff3 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -8,7 +8,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
     ti/k3-am625-skeleton.dtb \
     ti/k3-am625-sk-lpmdemo.dtb \
-    ti/k3-am625-sk-csi2-ov5640.dtbo \
 "
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index ec9ce596..32ffaaa0 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -8,7 +8,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-lp-sk.dtb \
     ti/k3-am625-skeleton.dtb \
     ti/k3-am625-sk-lpmdemo.dtb \
-    ti/k3-am625-sk-csi2-ov5640.dtbo \
 "
 
 UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
index 6e8c863c..10861c63 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -17,58 +17,7 @@ KERNEL_DEVICETREE = " \
 ti/k3-j721e-beagleboneai64.dtb \
 ti/k3-j721e-beagleboneai64-no-shared-mem.dtb \
 ti/k3-j721e-common-proc-board.dtb \
-ti/k3-j721e-common-proc-board-infotainment.dtbo \
-ti/k3-j721e-cpb-csi2-ov5640.dtbo \
-ti/k3-j721e-fpdlink-cpb-fusion.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
-ti/k3-j721e-fpdlink-sk-fusion.dtbo \
-ti/k3-j721e-gesi-exp-board.dtbo \
-ti/k3-j721e-proc-board-tps65917.dtb \
-ti/k3-j721e-quad-port-eth-exp.dtbo \
-ti/k3-j721e-sk-csi2-ov5640.dtbo \
 ti/k3-j721e-sk.dtb \
-ti/k3-j721e-sk-rpi-cam-imx219.dtbo \
-ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
-ti/overlays/BBAI64-CSI0-imx219.dtbo \
-ti/overlays/BBAI64-CSI1-imx219.dtbo \
-ti/overlays/BBAI64-DSI-RPi-7inch-panel.dtbo \
-ti/overlays/BBAI64-P8_37-ehrpwm5_a.dtbo \
-ti/overlays/BBAI64-P9_25-ehrpwm4_b.dtbo \
-ti/overlays/BB-I2C2-MPU6050.dtbo \
-ti/overlays/BBORG_LOAD-00A2.dtbo \
-ti/overlays/BBORG_RELAY-00A2.dtbo \
-ti/overlays/BBORG_SERVO-00A2.dtbo \
-ti/overlays/BONE-FAN.dtbo \
-ti/overlays/BONE-I2C1.dtbo \
-ti/overlays/BONE-I2C2.dtbo \
-ti/overlays/BONE-I2C3.dtbo \
-ti/overlays/BONE-LED_P8_03.dtbo \
-ti/overlays/BONE-LED_P9_11.dtbo \
-ti/overlays/BONE-PWM0.dtbo \
-ti/overlays/BONE-PWM1.dtbo \
-ti/overlays/BONE-PWM2.dtbo \
-ti/overlays/BONE-SPI0_0.dtbo \
-ti/overlays/BONE-SPI0_1.dtbo \
-ti/overlays/BONE-UART1.dtbo \
-ti/overlays/BONE-USB0-host.dtbo \
-ti/overlays/J721E-PRU-UIO-00A0.dtbo \
-ti/overlays/k3-j721e-beagleboneai64-RPi-7inch-panel.dtbo \
-ti/overlays/robotics-cape.dtbo \
 "
 
 IMAGE_BOOT_FILES += "sysfw.itb"
diff --git a/meta-ti-bsp/conf/machine/dra7xx-evm.conf b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
index 813e0e06..1944792e 100644
--- a/meta-ti-bsp/conf/machine/dra7xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
@@ -10,18 +10,10 @@ SERIAL_CONSOLES = "115200;ttyS0"
 
 KERNEL_DEVICETREE = " \
     dra7-evm.dtb \
-    ti/dra7x-evm-osd-lcd-common.dtbo \
     dra71-evm.dtb \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'dra71-evm-nand.dtb', d)} \
-    ti/dra71-evm-lcd-auo-g101evn01.0.dtbo \
     dra72-evm.dtb \
     dra72-evm-revc.dtb \
-    ti/dra72-evm-touchscreen.dtbo \
-    ti/dra74-evm-touchscreen.dtbo \
     dra76-evm.dtb \
-    ti/dra76-evm-tfp410.dtbo \
-    ti/lcd-osd101t2045.dtbo \
-    ti/lcd-osd101t2587.dtbo \
 "
 
 UBOOT_MACHINE = "dra7xx_evm_config"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index 98df24b2..c0f2adb2 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -6,7 +6,7 @@ MACHINE_FEATURES += "screen gpu"
 SERIAL_CONSOLES = "115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
-PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?= ""
 
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index a2e5d673..ff7f66e3 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -7,9 +7,6 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 KERNEL_DEVICETREE = " \
     ti/k3-am642-evm.dtb \
     ti/k3-am642-sk.dtb \
-    ti/k3-am642-evm-icssg1-dualemac.dtbo \
-    ti/k3-am642-evm-icssg1-dualemac-mii.dtbo \
-    ti/k3-am642-evm-nand.dtbo \
 "
 
 # Default tiboot3.bin on AM64x is for SR2.0 HS-FS
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 0ae00761..fef73da2 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -10,16 +10,6 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= ""
 
 KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb \
-    ti/k3-am654-base-board-sr1.dtbo \
-    ti/k3-am654-gp.dtbo \
-    ti/k3-am654-idk.dtbo \
-    ti/k3-am654-idk-sr1.dtbo \
-    ti/k3-am654-sr1.dtbo \
-    ti/k3-am654-pcie-usb2.dtbo \
-    ti/k3-am654-pcie-usb3.dtbo \
-    ti/k3-am654-evm-tc358876.dtbo \
-    ti/k3-am654-evm-oldi-lcd1evm.dtbo \
-    ti/k3-am654-evm-ov5640.dtbo \
 "
 
 # On AM65x the file tiboot3.bin comes from the bootloader not ti-sci-fw
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 8f9c24e6..46f9564e 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -3,7 +3,7 @@ SOC_FAMILY:append = ":j721e"
 
 MACHINE_FEATURES += "screen gpu"
 
-PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?= ""
 
 # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
 do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
index 70569a16..a23aed73 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -3,7 +3,7 @@ SOC_FAMILY:append = ":j721s2"
 
 MACHINE_FEATURES += "screen gpu"
 
-PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?= ""
 
 TFA_BOARD = "generic"
 
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index d03ee4a4..3066193b 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -3,7 +3,7 @@ SOC_FAMILY:append = ":j784s4"
 
 MACHINE_FEATURES += "screen gpu"
 
-PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?= ""
 
 TFA_BOARD = "j784s4"
 
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index ec6d9c07..3228418e 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -20,10 +20,8 @@ KERNEL_IMAGETYPE = "zImage"
 
 KERNEL_DEVICETREE = " \
     am437x-gp-evm.dtb \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am437x-gp-evm-hdmi.dtb', d)} \
     am437x-sk-evm.dtb am437x-idk-evm.dtb \
     am43x-epos-evm.dtb \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am43x-epos-evm-hdmi.dtb', d)} \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index fe28e6f5..f6af3b6d 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -9,7 +9,6 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
-    ti/k3-j721e-common-proc-board-infotainment.dtbo \
     ti/k3-j721e-sk.dtb \
 "
 
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 3576414d..740036b1 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -11,7 +11,6 @@ OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j721s2-common-proc-board.dtb \
-    ti/k3-j721s2-gesi-exp-board.dtbo \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
new file mode 100644
index 00000000..24b53cf7
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
new file mode 100644
index 00000000..ef1d3efd
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=defconfig
+config-fragment=kernel/configs/ti_arm64_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
new file mode 100644
index 00000000..099493af
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
@@ -0,0 +1 @@
+use-kernel-config=davinci_all_defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
new file mode 100644
index 00000000..2b2196c7
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -0,0 +1,36 @@
+SECTION = "kernel"
+SUMMARY = "Linux kernel for TI devices"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+inherit kernel
+
+require recipes-kernel/linux/setup-defconfig.inc
+require recipes-kernel/linux/kernel-rdepends.inc
+require recipes-kernel/linux/ti-kernel.inc
+
+DEPENDS += "gmp-native libmpc-native"
+
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
+		      ${EXTRA_DTC_ARGS}"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "ti-linux-6.1.y"
+
+SRCREV = "e553069c227ddeb22ac283676f7b5a6bf9d16cb8"
+PV = "v6.1+git${SRCPV}"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR:append = "b"
+PR = "${MACHINE_KERNEL_PR}"
+
+KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "https"
+SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
+            file://defconfig"
+
+FILES:${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
-- 
2.39.2



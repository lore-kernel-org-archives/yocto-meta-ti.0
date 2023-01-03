Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A0FC3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 17:17:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.69555.1672766212647922773
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 09:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ue6LxsVA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 303HGouO041489;
	Tue, 3 Jan 2023 11:16:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672766210;
	bh=mSnMqVoinJk9vtZnSh3zQUq6bYrDiwt91Z8iRbSm7fE=;
	h=From:To:CC:Subject:Date;
	b=ue6LxsVAfcMWEqUuxVctJmrYPVgfe7olATBkiB0we4/cIGvFLYU+ZW9+PBwc3Tz7J
	 Q8lh90vK70NC+Ja+4YCoDR8tRZpIAS702Otdr6qWVrvZoJDPQfobSKnZCrP79JY22U
	 MZWqALOlpP49VZPjgZISzp2Mj+i1U6dI00wjFNA4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 303HGoEm027550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Jan 2023 11:16:50 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 3
 Jan 2023 11:16:50 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 3 Jan 2023 11:16:49 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 303HGnnO044041;
	Tue, 3 Jan 2023 11:16:49 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] meta-ti-bsp: linux: Use filter to select KERNEL_DEVICETREE files
Date: Tue, 3 Jan 2023 11:16:49 -0600
Message-ID: <20230103171649.21428-1-afd@ti.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Jan 2023 17:17:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15509

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am335x-evm.conf      |  2 ++
 meta-ti-bsp/conf/machine/am437x-evm.conf      |  2 ++
 meta-ti-bsp/conf/machine/am57xx-evm.conf      | 15 +++-----------
 meta-ti-bsp/conf/machine/am62xx-evm.conf      |  7 +------
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  7 +------
 meta-ti-bsp/conf/machine/am64xx-evm.conf      |  2 ++
 meta-ti-bsp/conf/machine/am65xx-evm.conf      |  2 ++
 meta-ti-bsp/conf/machine/beagle-x15.conf      |  2 +-
 meta-ti-bsp/conf/machine/beaglebone.conf      |  4 +---
 meta-ti-bsp/conf/machine/dra7xx-evm.conf      | 10 +++-------
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  8 --------
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 14 -------------
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 11 ----------
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 10 ----------
 meta-ti-bsp/conf/machine/j7200-evm.conf       |  4 +---
 meta-ti-bsp/conf/machine/j721e-evm.conf       |  6 +-----
 meta-ti-bsp/conf/machine/j721s2-evm.conf      |  5 +----
 meta-ti-bsp/conf/machine/j784s4-evm.conf      |  4 +---
 meta-ti-bsp/conf/machine/omapl138-lcdk.conf   |  2 +-
 .../linux/linux-ti-mainline_git.bb            |  1 -
 .../recipes-kernel/linux/linux-ti-next_git.bb | 19 ------------------
 .../recipes-kernel/linux/ti-kernel.inc        | 20 +++++++++++++++++++
 22 files changed, 43 insertions(+), 114 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
index 9301406b..01e169d9 100644
--- a/meta-ti-bsp/conf/machine/am335x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
@@ -12,6 +12,8 @@ IMAGE_FSTYPES += "ubifs ubi"
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
+KERNEL_DEVICETREE_PREFIX = "am335x"
+
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/meta-ti-bsp/conf/machine/am437x-evm.conf b/meta-ti-bsp/conf/machine/am437x-evm.conf
index 98602add..4da29982 100644
--- a/meta-ti-bsp/conf/machine/am437x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am437x-evm.conf
@@ -10,6 +10,8 @@ IMAGE_FSTYPES += "ubifs ubi"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
+KERNEL_DEVICETREE_PREFIX = "am43"
+
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
index ca635f43..e320477b 100644
--- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
@@ -8,19 +8,12 @@ MACHINE_FEATURES += "touchscreen"
 
 SERIAL_CONSOLES = "115200;ttyS2"
 
-KERNEL_DEVICETREE = " \
-    am57xx-beagle-x15.dtb \
-    am57xx-beagle-x15-revb1.dtb \
-    am57xx-beagle-x15-revc.dtb \
-    am5729-beagleboneai.dtb \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am57xx-evm.dtb', d)} \
+KERNEL_DEVICETREE_PREFIX = "am57"
+
+KERNEL_DEVICETREE:append = " \
     ti/am57xx-evm-common.dtbo \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am57xx-evm-reva3.dtb', d)} \
     ti/am57xx-evm-reva3.dtbo \
-    am571x-idk.dtb \
     ti/am571x-idk-touchscreen.dtbo \
-    am572x-idk.dtb \
-    am574x-idk.dtb \
     ti/am57xx-idk-osd-lcd-common.dtbo \
     ti/am572x-idk-touchscreen.dtbo \
     ti/lcd-osd101t2587.dtbo \
@@ -28,8 +21,6 @@ KERNEL_DEVICETREE = " \
     ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'ti/ov10635.dtbo', d)} \
 "
 
-KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
-
 UBOOT_MACHINE = "am57xx_evm_config"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index 73859d5f..2316180b 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -4,11 +4,6 @@
 
 require conf/machine/include/am62xx.inc
 
-KERNEL_DEVICETREE = " \
-    ti/k3-am625-sk.dtb \
-    ti/k3-am625-skeleton.dtb \
-    ti/k3-am625-sk-lpmdemo.dtb \
-    ti/k3-am625-sk-csi2-ov5640.dtbo \
-"
+KERNEL_DEVICETREE_PREFIX = "ti/k3-am62"
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index ef8e8692..f1c5ee15 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -6,11 +6,6 @@ require conf/machine/include/am62xx.inc
 
 MACHINE_FEATURES += "gpu"
 
-KERNEL_DEVICETREE = " \
-    ti/k3-am62x-lp-sk.dtb \
-    ti/k3-am625-skeleton.dtb \
-    ti/k3-am625-sk-lpmdemo.dtb \
-    ti/k3-am625-sk-csi2-ov5640.dtbo \
-"
+KERNEL_DEVICETREE_PREFIX = "ti/k3-am62"
 
 UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm.conf b/meta-ti-bsp/conf/machine/am64xx-evm.conf
index c6ba2a87..af05ddf0 100644
--- a/meta-ti-bsp/conf/machine/am64xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-evm.conf
@@ -4,4 +4,6 @@
 
 require conf/machine/include/am64xx.inc
 
+KERNEL_DEVICETREE_PREFIX = "ti/k3-am642"
+
 UBOOT_MACHINE = "am64x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-evm.conf b/meta-ti-bsp/conf/machine/am65xx-evm.conf
index 8b6ef546..0a7f46e2 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm.conf
@@ -4,4 +4,6 @@
 
 require conf/machine/include/am65xx.inc
 
+KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
+
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
index c7503266..beb0d892 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/dra7xx.inc
 
-KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb"
+KERNEL_DEVICETREE_PREFIX = "am57xx-beagle-x15"
 
 MACHINE_GUI_CLASS = "bigscreen"
 
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
index 413a960d..145b261a 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
@@ -4,9 +4,7 @@
 
 require conf/machine/include/ti33x.inc
 
-KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblue.dtb \
-                    am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
-                    am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb"
+KERNEL_DEVICETREE_PREFIX = "am335x-bone"
 
 MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_FEATURES += "screen"
diff --git a/meta-ti-bsp/conf/machine/dra7xx-evm.conf b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
index 813e0e06..d944e860 100644
--- a/meta-ti-bsp/conf/machine/dra7xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
@@ -8,17 +8,13 @@ MACHINE_FEATURES += "touchscreen"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
-KERNEL_DEVICETREE = " \
-    dra7-evm.dtb \
+KERNEL_DEVICETREE_PREFIX = "dra7"
+
+KERNEL_DEVICETREE:append = " \
     ti/dra7x-evm-osd-lcd-common.dtbo \
-    dra71-evm.dtb \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'dra71-evm-nand.dtb', d)} \
     ti/dra71-evm-lcd-auo-g101evn01.0.dtbo \
-    dra72-evm.dtb \
-    dra72-evm-revc.dtb \
     ti/dra72-evm-touchscreen.dtbo \
     ti/dra74-evm-touchscreen.dtbo \
-    dra76-evm.dtb \
     ti/dra76-evm-tfp410.dtbo \
     ti/lcd-osd101t2045.dtbo \
     ti/lcd-osd101t2587.dtbo \
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 055f6036..bff443f7 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -6,14 +6,6 @@ MACHINE_FEATURES += "screen touchscreen"
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
-KERNEL_DEVICETREE = " \
-    ti/k3-am642-evm.dtb \
-    ti/k3-am642-sk.dtb \
-    ti/k3-am642-evm-icssg1-dualemac.dtbo \
-    ti/k3-am642-evm-icssg1-dualemac-mii.dtbo \
-    ti/k3-am642-evm-nand.dtbo \
-"
-
 # Default tiboot3.bin on AM64x is for SR2.0 HS-FS
 BBMULTICONFIG = "k3r5-sr2-hs-fs"
 do_image_wic[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 80aa6d27..5a2597e4 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -12,20 +12,6 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/libgbm ?= "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 
-KERNEL_DEVICETREE = " \
-    ti/k3-am654-base-board.dtb \
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
-"
-
 BBMULTICONFIG += "k3r5-sr2"
 
 # Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index cfacc30d..6182ddc4 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -19,17 +19,6 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 
 KERNEL_IMAGETYPE = "zImage"
 
-KERNEL_DEVICETREE = " \
-    am335x-evm.dtb am335x-evmsk.dtb \
-    am335x-icev2.dtb \
-    am335x-pocketbeagle.dtb am335x-bone.dtb am335x-boneblue.dtb \
-    am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb \
-    am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
-    am335x-sancloud-bbe.dtb \
-"
-
-KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
-
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am335x_evm_config"
 
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index 5509a54d..63821866 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -19,16 +19,6 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 
 KERNEL_IMAGETYPE = "zImage"
 
-KERNEL_DEVICETREE = " \
-    am437x-gp-evm.dtb \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am437x-gp-evm-hdmi.dtb', d)} \
-    am437x-sk-evm.dtb am437x-idk-evm.dtb \
-    am43x-epos-evm.dtb \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am43x-epos-evm-hdmi.dtb', d)} \
-"
-
-KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
-
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am43xx_evm_config"
 
diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
index 303ec182..3d465287 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
@@ -7,9 +7,7 @@ require conf/machine/include/j7200.inc
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
-KERNEL_DEVICETREE = " \
-    ti/k3-j7200-common-proc-board.dtb \
-"
+KERNEL_DEVICETREE_PREFIX = "ti/k3-j7200"
 
 UBOOT_MACHINE = "j7200_evm_a72_config"
 
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index d28d16d1..448ba584 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -10,10 +10,6 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
 IMAGE_BOOT_FILES += "sysfw.itb"
 
-KERNEL_DEVICETREE = " \
-    ti/k3-j721e-common-proc-board.dtb \
-    ti/k3-j721e-common-proc-board-infotainment.dtbo \
-    ti/k3-j721e-sk.dtb \
-"
+KERNEL_DEVICETREE_PREFIX = "ti/k3-j721e"
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 37353df4..0b10f139 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -10,10 +10,7 @@ TFA_K3_USART = "0x8"
 OPTEEMACHINE = "k3-j784s4"
 OPTEE_K3_USART = "0x8"
 
-KERNEL_DEVICETREE = " \
-    ti/k3-j721s2-common-proc-board.dtb \
-    ti/k3-j721s2-gesi-exp-board.dtbo \
-"
+KERNEL_DEVICETREE_PREFIX = "ti/k3-j721s2"
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
 
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 96acca13..a36db532 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -12,9 +12,7 @@ TFA_K3_USART = "0x8"
 OPTEEMACHINE = "k3-j784s4"
 OPTEE_K3_USART = "0x8"
 
-KERNEL_DEVICETREE = " \
-    ti/k3-j784s4-evm.dtb \
-"
+KERNEL_DEVICETREE_PREFIX = "ti/k3-j784s4"
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
 
diff --git a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
index b318f82d..7be214a7 100644
--- a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
+++ b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
@@ -15,4 +15,4 @@ IMAGE_FSTYPES += "tar.xz"
 
 SERIAL_CONSOLES = "115200;ttyS2"
 
-KERNEL_DEVICETREE = "da850-evm.dtb da850-lcdk.dtb"
+KERNEL_DEVICETREE_PREFIX = "da850"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 6c1b1825..54a2c176 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -42,7 +42,6 @@ SRCREV_FORMAT = "linux"
 KERNEL_DEVICETREE = ""
 
 kernel_do_compile:append() {
-	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 	oe_runmake -C ${S}/ti-upstream-tools LINUX=${S} DTC=${B}/scripts/dtc/dtc O=${B} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 }
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index e2908951..3aa1934d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -19,25 +19,6 @@ PV = "6.1.0-rc1+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git;protocol=https;branch=master"
 
-def list_dtbs(dts_dir, dts_subdir):
-    import os
-    import fnmatch
-    matches = []
-
-    for root,dirnames,filenames in os.walk(os.path.join(dts_dir, dts_subdir)):
-        for filename in fnmatch.filter(filenames, '*.dtb'):
-            matches.append(os.path.join(dts_subdir, filename))
-        for filename in fnmatch.filter(filenames, '*.dtbo'):
-            matches.append(os.path.join(dts_subdir, filename))
-    return ' '.join(matches)
-
-DTS_SUBDIR = ""
-DTS_SUBDIR:k3 = "ti"
-KERNEL_DEVICETREE = "${@list_dtbs('${B}/arch/${ARCH}/boot/dts', '${DTS_SUBDIR}')}"
 DEFCONFIG_NAME = "multi_v7_defconfig"
 DEFCONFIG_NAME:k3 = "defconfig"
 KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
-
-kernel_do_compile:append() {
-	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
-}
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
index a7eb476e..7b0f9a64 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
@@ -7,3 +7,23 @@ def get_extra_dtc_args(d):
         return ""
 
 EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
+
+def list_dtbs(dts_dir, dts_prefix):
+    import os
+    import glob
+    matches = []
+
+    filenames = glob.glob(dts_dir + dts_prefix + '*.dts')
+    filenames += glob.glob(dts_dir + dts_prefix + '*.dtso')
+    for filename in filenames:
+        # Before v6.2 kernels DTB Overlays shared the same name as DTB files
+        # so we need to search the file to find the type
+        with open(filename) as f:
+            file_postfix = '.dtbo' if '/plugin/;' in f.read() else '.dtb'
+        filename = os.path.split(filename)[1]
+        filename = os.path.splitext(filename)[0] + file_postfix
+        filename = os.path.join(os.path.split(dts_prefix)[0], filename)
+        matches.append(filename)
+    return ' '.join(matches)
+
+KERNEL_DEVICETREE ?= "${@list_dtbs('${S}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_PREFIX}')}"
-- 
2.38.1



Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E89C74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 15:20:59 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.22435.1679066458649868398
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 08:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QFvqmFUC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32HFKuEe049164;
	Fri, 17 Mar 2023 10:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679066456;
	bh=KwcbDlQrkOl9zOuTZ8bRLuqsJ1KTFwOETCQLHC3vmbg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QFvqmFUCOWS5QhsjiIXPO+qc1JTWcVw01RSdaBUFklxk2NVLlk9kCp5MjUoHinvGE
	 sPBy9F/C4C9P2jvE7UNig2vORwbkmKbjvZTEgQwtYHXb6lVPwnajPRYW4B1dL4uud9
	 6y6J+n8kfpOhlLOE8ZPFQYLJRcInBplS3HU1KPto=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32HFKunr123941
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Mar 2023 10:20:56 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 17
 Mar 2023 10:20:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 17 Mar 2023 10:20:55 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32HFKuCc064342;
	Fri, 17 Mar 2023 10:20:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pdBt2-0006iJ-0k; Fri, 17 Mar 2023 10:20:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v3 1/3] linux-ti-*: Add filtering for which dtb/dtbo to include
Date: Fri, 17 Mar 2023 10:20:53 -0500
Message-ID: <20230317152055.25762-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317152055.25762-1-reatmon@ti.com>
References: <20230317152055.25762-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Mar 2023 15:20:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16005

We often carry more dtbs/dtbos in our kernel than we have upstreamed.
The inclusion of all of the dtb/dtbo in the KERNEL_DEVICETREE has become
problematic as we start testing the linux-next and 6.1 as part of our
LTS migration.  To address this issue we are adding in two step method
for managing the KERNEL_DEVICETREE.

Going forward we will only accept dtb/dtbo in KERNEL_DEVICETREE if it is
available in upstream.  This way we ensure that the variable is more
accurate for whichever kernel you might be looking at.  We have also
added a new variable KERNEL_DEVICETREE_PREFIX which our kernel recipes
will use to auto set KERNEL_DEVICETREE based on what files are in the
kernel and not a fixed list in the conf files.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
v2: Removed the new prefix include for the mainline and next kernels
    since the value of KERNEL_DEVICETREE should reflect what they have
    anyway. This will help us keep the DEVICETREE up to date.

 meta-ti-bsp/conf/machine/am57xx-evm.conf      | 17 ++++++--------
 meta-ti-bsp/conf/machine/am62xx-evm.conf      |  5 ++--
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  5 ++--
 meta-ti-bsp/conf/machine/beagle-x15.conf      |  8 ++++++-
 meta-ti-bsp/conf/machine/beaglebone.conf      | 13 ++++++++---
 meta-ti-bsp/conf/machine/dra7xx-evm.conf      | 14 +++++------
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  5 ++--
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 12 ++--------
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 15 ++++++++----
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 10 +++++---
 meta-ti-bsp/conf/machine/j7200-evm.conf       |  2 ++
 meta-ti-bsp/conf/machine/j721e-evm.conf       |  3 ++-
 meta-ti-bsp/conf/machine/j721s2-evm.conf      |  3 ++-
 meta-ti-bsp/conf/machine/j784s4-evm.conf      |  6 ++---
 meta-ti-bsp/conf/machine/omapl138-lcdk.conf   |  8 ++++++-
 .../linux/linux-ti-mainline_git.bb            | 23 -------------------
 .../recipes-kernel/linux/linux-ti-next_git.bb | 15 ------------
 .../linux/linux-ti-staging_5.10.bb            |  1 +
 .../linux/ti-kernel-devicetree-prefix.inc     | 22 ++++++++++++++++++
 19 files changed, 95 insertions(+), 92 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc

diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
index b3525a0b..2ecabe63 100644
--- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
@@ -8,24 +8,21 @@ MACHINE_FEATURES += "touchscreen"
 
 SERIAL_CONSOLES = "115200;ttyS2"
 
+KERNEL_DEVICETREE_PREFIX = " \
+    am57 \
+    ti/am57 \
+    ti/lcd \
+    ti/ov10635 \
+"
+
 KERNEL_DEVICETREE = " \
     am57xx-beagle-x15.dtb \
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
index 73859d5f..c4357be3 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -4,11 +4,10 @@
 
 require conf/machine/include/am62xx.inc
 
+KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
+
 KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
-    ti/k3-am625-skeleton.dtb \
-    ti/k3-am625-sk-lpmdemo.dtb \
-    ti/k3-am625-sk-csi2-ov5640.dtbo \
 "
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index ec9ce596..2246cfc2 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -4,11 +4,10 @@
 
 require conf/machine/include/am62xx.inc
 
+KERNEL_DEVICETREE_PREFIX = "ti/k3-am62x"
+
 KERNEL_DEVICETREE = " \
     ti/k3-am62x-lp-sk.dtb \
-    ti/k3-am625-skeleton.dtb \
-    ti/k3-am625-sk-lpmdemo.dtb \
-    ti/k3-am625-sk-csi2-ov5640.dtbo \
 "
 
 UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
index b4279ae4..8efd6e60 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
@@ -4,7 +4,13 @@
 
 require conf/machine/include/am57xx.inc
 
-KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb"
+KERNEL_DEVICETREE_PREFIX = "am57xx-beagle-x15"
+
+KERNEL_DEVICETREE = " \
+    am57xx-beagle-x15.dtb \
+    am57xx-beagle-x15-revb1.dtb \
+    am57xx-beagle-x15-revc.dtb \
+"
 
 MACHINE_GUI_CLASS = "bigscreen"
 
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
index 413a960d..2a8dc6d7 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
@@ -4,9 +4,16 @@
 
 require conf/machine/include/ti33x.inc
 
-KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblue.dtb \
-                    am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
-                    am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb"
+KERNEL_DEVICETREE_PREFIX = "am335x-bone"
+
+KERNEL_DEVICETREE = " \
+    am335x-bone.dtb \
+    am335x-boneblue.dtb \
+    am335x-boneblack.dtb \
+    am335x-boneblack-wireless.dtb \
+    am335x-bonegreen.dtb \
+    am335x-bonegreen-wireless.dtb \
+"
 
 MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_FEATURES += "screen"
diff --git a/meta-ti-bsp/conf/machine/dra7xx-evm.conf b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
index 813e0e06..c47a1e80 100644
--- a/meta-ti-bsp/conf/machine/dra7xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
@@ -8,20 +8,18 @@ MACHINE_FEATURES += "touchscreen"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
+KERNEL_DEVICETREE_PREFIX = " \
+    dra7 \
+    ti/dra7 \
+    ti/lcd \
+"
+
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
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index a2e5d673..157bf5d5 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -4,12 +4,11 @@ SOC_FAMILY:append = ":am64xx"
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
+KERNEL_DEVICETREE_PREFIX = "ti/k3-am642"
+
 KERNEL_DEVICETREE = " \
     ti/k3-am642-evm.dtb \
     ti/k3-am642-sk.dtb \
-    ti/k3-am642-evm-icssg1-dualemac.dtbo \
-    ti/k3-am642-evm-icssg1-dualemac-mii.dtbo \
-    ti/k3-am642-evm-nand.dtbo \
 "
 
 # Default tiboot3.bin on AM64x is for SR2.0 HS-FS
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 0ae00761..564d61b0 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -8,18 +8,10 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 PREFERRED_PROVIDER_virtual/gpudriver ?= ""
 
+KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
+
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
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index 95499552..4f6d90bf 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -18,12 +18,19 @@ PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
 
 KERNEL_IMAGETYPE = "zImage"
 
+KERNEL_DEVICETREE_PREFIX = "am335x"
+
 KERNEL_DEVICETREE = " \
-    am335x-evm.dtb am335x-evmsk.dtb \
+    am335x-evm.dtb \
+    am335x-evmsk.dtb \
     am335x-icev2.dtb \
-    am335x-pocketbeagle.dtb am335x-bone.dtb am335x-boneblue.dtb \
-    am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb \
-    am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
+    am335x-pocketbeagle.dtb \
+    am335x-bone.dtb \
+    am335x-boneblue.dtb \
+    am335x-bonegreen.dtb \
+    am335x-bonegreen-wireless.dtb \
+    am335x-boneblack.dtb \
+    am335x-boneblack-wireless.dtb \
     am335x-sancloud-bbe.dtb \
 "
 
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index ec6d9c07..5b40925e 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -18,12 +18,16 @@ PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
 
+KERNEL_DEVICETREE_PREFIX = " \
+    am437x \
+    am43x \
+"
+
 KERNEL_DEVICETREE = " \
     am437x-gp-evm.dtb \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am437x-gp-evm-hdmi.dtb', d)} \
-    am437x-sk-evm.dtb am437x-idk-evm.dtb \
+    am437x-sk-evm.dtb \
+    am437x-idk-evm.dtb \
     am43x-epos-evm.dtb \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'am43x-epos-evm-hdmi.dtb', d)} \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
index 33c39a52..b17b65b7 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
@@ -7,6 +7,8 @@ require conf/machine/include/j7200.inc
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
+KERNEL_DEVICETREE_PREFIX = "ti/k3-j7200"
+
 KERNEL_DEVICETREE = " \
     ti/k3-j7200-common-proc-board.dtb \
 "
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index fe28e6f5..fd73458d 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -7,9 +7,10 @@ require conf/machine/include/j721e.inc
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
+KERNEL_DEVICETREE_PREFIX = "ti/k3-j721e"
+
 KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
-    ti/k3-j721e-common-proc-board-infotainment.dtbo \
     ti/k3-j721e-sk.dtb \
 "
 
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 3576414d..8ae21ac7 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -9,9 +9,10 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
 OPTEE_K3_USART = "0x8"
 
+KERNEL_DEVICETREE_PREFIX = "ti/k3-j721s2"
+
 KERNEL_DEVICETREE = " \
     ti/k3-j721s2-common-proc-board.dtb \
-    ti/k3-j721s2-gesi-exp-board.dtbo \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 73f3eb8c..717c36a2 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -9,8 +9,8 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
 OPTEE_K3_USART = "0x8"
 
-KERNEL_DEVICETREE = " \
-    ti/k3-j784s4-evm.dtb \
-"
+KERNEL_DEVICETREE_PREFIX = "ti/k3-j784s4"
+
+KERNEL_DEVICETREE = ""
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
index b318f82d..244144e1 100644
--- a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
+++ b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
@@ -15,4 +15,10 @@ IMAGE_FSTYPES += "tar.xz"
 
 SERIAL_CONSOLES = "115200;ttyS2"
 
-KERNEL_DEVICETREE = "da850-evm.dtb da850-lcdk.dtb"
+KERNEL_DEVICETREE_PREFIX = "da850"
+
+KERNEL_DEVICETREE = " \
+    da850-evm.dtb \
+    da850-lcdk.dtb \
+"
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 6c1b1825..be278d73 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -39,34 +39,11 @@ SRC_URI += " \
 SRCREV_ti-upstream-tools = "0f60697843bba6f8d721b14da92b1652563ccb95"
 SRCREV_FORMAT = "linux"
 
-KERNEL_DEVICETREE = ""
-
 kernel_do_compile:append() {
 	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 	oe_runmake -C ${S}/ti-upstream-tools LINUX=${S} DTC=${B}/scripts/dtc/dtc O=${B} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 }
 
-do_install:append() {
-	for dtbf in `find arch/${ARCH}/boot/dts/ \( -name '*.dtb' -or -name '*.dtbo' \)`; do
-		dtb="$dtbf"
-		dtb_ext=${dtb##*.}
-		dtb_base_name=`basename $dtb .$dtb_ext`
-		dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
-		install -m 0644 $dtbf ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
-	done
-}
-
-do_deploy:append() {
-	for dtbf in `find arch/${ARCH}/boot/dts/ \( -name '*.dtb' -or -name '*.dtbo' \) -printf '%P\n'`; do
-		dtb="$dtbf"
-		dtb_ext=${dtb##*.}
-		dtb_base_name=`basename $dtb .$dtb_ext`
-		dtb_dir=`dirname $dtb`
-		install -d ${DEPLOYDIR}
-		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext ${DEPLOYDIR}/$dtb_base_name.$dtb_ext
-	done
-}
-
 do_shared_workdir:prepend() {
 	cd ${B}
 	echo >> Module.symvers
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index e2908951..b540e508 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -19,21 +19,6 @@ PV = "6.1.0-rc1+git${SRCPV}"
 
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
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index e6d4b107..3951fe60 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -9,6 +9,7 @@ DEFCONFIG_BUILDER = "${S}/ti_config_fragments/defconfig_builder.sh"
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
+include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
 
 DEPENDS += "gmp-native libmpc-native"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
new file mode 100644
index 00000000..644c4793
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
@@ -0,0 +1,22 @@
+
+def get_dtbs_from_kernel(dts_dir, dts_prefix):
+    import os
+    import glob
+    matches = []
+
+    for prefix in dts_prefix.split():
+        filenames = glob.glob(dts_dir + prefix + '*.dts')
+        filenames += glob.glob(dts_dir + prefix + '*.dtso')
+        for filename in filenames:
+            # Before v6.2 kernels DTB Overlays shared the same name as DTB files
+            # so we need to search the file to find the type
+            with open(filename) as f:
+                file_postfix = '.dtbo' if '/plugin/;' in f.read() else '.dtb'
+            filename = os.path.split(filename)[1]
+            filename = os.path.splitext(filename)[0] + file_postfix
+            filename = os.path.join(os.path.split(prefix)[0], filename)
+            matches.append(filename)
+    return ' '.join(matches)
+
+KERNEL_DEVICETREE = "${@get_dtbs_from_kernel('${S}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_PREFIX}')}"
+
-- 
2.17.1



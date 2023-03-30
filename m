Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BF6C77B61
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:33:54 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.39491.1680212029952796629
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 14:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pRfbGspB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32ULXm58117364;
	Thu, 30 Mar 2023 16:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680212028;
	bh=jrdaHs2Yjn27tzr71z4UW/ybOSkRbvfbjLgBhsuHgyk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=pRfbGspBzuJJsp1A+vAZx64T048msL6OmOraG3pe5nXaKWNvVR1HpH6HZPfzUpg+n
	 ZTBfCepNvj4q2/OY8vYZkea6j+JEM6l4hem0cDSUbPJpKyWK2KjrTUoymlWNb12tjG
	 Kb9OAnajPh0lFhaMMULADKFo5vuXGHTXT8molM/w=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32ULXmDj022655
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Mar 2023 16:33:48 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 30
 Mar 2023 16:33:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 30 Mar 2023 16:33:47 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32ULXllh060125;
	Thu, 30 Mar 2023 16:33:47 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1phztz-0005Nx-Ht; Thu, 30 Mar 2023 16:33:47 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v6 1/3] linux-ti-*: Add filtering for which dtb/dtbo to include
Date: Thu, 30 Mar 2023 16:33:45 -0500
Message-ID: <20230330213347.20656-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230330213347.20656-1-reatmon@ti.com>
References: <20230330213347.20656-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Mar 2023 21:33:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16266

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
v5: A couple of the platforms use a dtb merge function to create dtb
    file by merging some dtb and dtbo together.  When the merge file
    is listed in KERNEL_DEVICETREE it is correctly made, but since
    there is no dts file, we cannot glob it.  So add a new
    KERNEL_DEVICETREE_DTBMERGE variable to collect that information
    and get it into the device tree. 
v4: Rebase on top of recent dunfell sync.
v2: Removed the new prefix include for the mainline and next kernels
    since the value of KERNEL_DEVICETREE should reflect what they have
    anyway. This will help us keep the DEVICETREE up to date.

 meta-ti-bsp/conf/machine/am57xx-evm.conf      | 22 +++++++------
 meta-ti-bsp/conf/machine/am62axx-evm.conf     | 20 +++--------
 meta-ti-bsp/conf/machine/am62xx-evm.conf      | 10 ++----
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  9 ++---
 meta-ti-bsp/conf/machine/beagle-x15.conf      |  8 ++++-
 meta-ti-bsp/conf/machine/beaglebone.conf      | 13 ++++++--
 meta-ti-bsp/conf/machine/dra7xx-evm.conf      | 14 ++++----
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  5 ++-
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 12 ++-----
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 15 ++++++---
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 10 ++++--
 meta-ti-bsp/conf/machine/j7200-evm.conf       |  4 +--
 meta-ti-bsp/conf/machine/j721e-evm.conf       | 29 +++-------------
 meta-ti-bsp/conf/machine/j721s2-evm.conf      | 32 +++---------------
 meta-ti-bsp/conf/machine/j784s4-evm.conf      | 33 +++----------------
 meta-ti-bsp/conf/machine/omapl138-lcdk.conf   |  7 +++-
 .../linux/linux-ti-mainline_git.bb            | 23 -------------
 .../recipes-kernel/linux/linux-ti-next_git.bb | 15 ---------
 .../linux/linux-ti-staging_5.10.bb            |  1 +
 .../linux/ti-kernel-devicetree-prefix.inc     | 22 +++++++++++++
 20 files changed, 115 insertions(+), 189 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc

diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
index b3525a0b..9b12f383 100644
--- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
@@ -8,24 +8,26 @@ MACHINE_FEATURES += "touchscreen"
 
 SERIAL_CONSOLES = "115200;ttyS2"
 
+KERNEL_DEVICETREE_PREFIX = " \
+    am57 \
+    ti/am57 \
+    ti/lcd \
+    ti/ov10635 \
+"
+
+KERNEL_DEVICETREE_DTBMERGE = " \
+    am57xx-evm.dtb \
+    am57xx-evm-reva3.dtb \
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
diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
index 2fd91bd7..691a074b 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -4,23 +4,13 @@
 
 require conf/machine/include/am62axx.inc
 
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-am62a7 \
+    ti/k3-j721e-fpdlink \
+"
+
 KERNEL_DEVICETREE = " \
     ti/k3-am62a7-sk.dtb \
-    ti/k3-am62a7-fpdlink-ov2312-0-0.dtbo \
-    ti/k3-am62a7-fpdlink-ov2312-0-1.dtbo \
-    ti/k3-am62a7-fpdlink-ov2312-0-2.dtbo \
-    ti/k3-am62a7-fpdlink-ov2312-0-3.dtbo \
-    ti/k3-am62a7-fpdlink-sk-fusion.dtbo \
-    ti/k3-am62a7-sk-csi2-imx219.dtbo \
-    ti/k3-am62a7-sk-ethernet-dc01.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
 "
 
 UBOOT_MACHINE = "am62ax_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index 8892a05f..d54213d4 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -4,16 +4,10 @@
 
 require conf/machine/include/am62xx.inc
 
+KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
+
 KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
-    ti/k3-am625-skeleton.dtb \
-    ti/k3-am625-sk-lpmdemo.dtb \
-    ti/k3-am625-sk-csi2-ov5640.dtbo \
-    ti/k3-am625-sk-csi2-tevi-ov5640.dtbo \
-    ti/k3-am625-sk-ecap-capture.dtbo \
-    ti/k3-am625-sk-hdmi-audio.dtbo \
-    ti/k3-am625-sk-mcan.dtbo \
-    ti/k3-am625-sk-oldi-panel.dtbo \
 "
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index cba05c4b..ba1a12a7 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -4,12 +4,13 @@
 
 require conf/machine/include/am62xx-lp.inc
 
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-am62x-lp \
+    ti/k3-am625-sk \
+"
+
 KERNEL_DEVICETREE = " \
     ti/k3-am62x-lp-sk.dtb \
-    ti/k3-am625-skeleton.dtb \
-    ti/k3-am625-sk-lpmdemo.dtb \
-    ti/k3-am625-sk-csi2-ov5640.dtbo \
-    ti/k3-am62x-lp-sk-oldi-panel.dtbo \
 "
 
 SPL_BINARY = "tispl.bin_HS"
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
index c01b318b..b17b65b7 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
@@ -7,10 +7,10 @@ require conf/machine/include/j7200.inc
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
+KERNEL_DEVICETREE_PREFIX = "ti/k3-j7200"
+
 KERNEL_DEVICETREE = " \
     ti/k3-j7200-common-proc-board.dtb \
-    ti/k3-j7200-mcspi-loopback.dtbo \
-    ti/k3-j7200-common-proc-board-uarts.dtbo \
 "
 
 UBOOT_MACHINE = "j7200_evm_a72_config"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index 029b1fe7..f602a77b 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -7,33 +7,14 @@ require conf/machine/include/j721e.inc
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-j721e \
+    ti/k3-j7200-mcspi-loopback \
+"
+
 KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
-    ti/k3-j721e-common-proc-board-infotainment.dtbo \
-    ti/k3-j721e-cpb-csi2-ov5640.dtbo \
-    ti/k3-j721e-fpdlink-cpb-fusion.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
     ti/k3-j721e-sk.dtb \
-    ti/k3-j721e-fpdlink-sk-fusion.dtbo \
-    ti/k3-j721e-sk-csi2-ov5640.dtbo \
-    ti/k3-j721e-sk-rpi-cam-imx219.dtbo \
-    ti/k3-j721e-common-proc-board-uarts.dtbo \
-    ti/k3-j7200-mcspi-loopback.dtbo \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 5a32e1b3..1f54c7b1 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -9,35 +9,13 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
 OPTEE_K3_USART = "0x8"
 
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-j721s2 \
+    ti/k3-j7200-mcspi-loopback \
+"
+
 KERNEL_DEVICETREE = " \
-    ti/k3-am68-sk-base-board.dtb \
-    ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
-    ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
-    ti/k3-am68-sk-fpdlink-fusion.dtbo \
-    ti/k3-am68-sk-rpi-hdr-ehrpwm.dtbo \
-    ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
     ti/k3-j721s2-common-proc-board.dtb \
-    ti/k3-j721s2-cpb-csi2-ov5640.dtbo \
-    ti/k3-j721s2-fpdlink-cpb-fusion.dtbo \
-    ti/k3-j721s2-gesi-exp-board.dtbo \
-    ti/k3-j721s2-common-proc-board-uarts.dtbo \
-    ti/k3-j7200-mcspi-loopback.dtbo \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 84fd4996..53bb4e4f 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -9,36 +9,13 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
 OPTEE_K3_USART = "0x8"
 
-KERNEL_DEVICETREE = " \
-    ti/k3-am69-sk.dtb \
-    ti/k3-am69-sk-csi2-ov5640.dtbo \
-    ti/k3-am69-sk-ddr-mem-carveout.dtbo \
-    ti/k3-am69-sk-fpdlink-fusion.dtbo \
-    ti/k3-am69-sk-rpi-hdr-ehrpwm.dtbo \
-    ti/k3-am69-sk-rpi-cam-imx219.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
-    ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
-    ti/k3-j784s4-evm.dtb \
-    ti/k3-j784s4-evm-csi2-ov5640.dtbo \
-    ti/k3-j784s4-fpdlink-fusion.dtbo \
-    ti/k3-j784s4-evm-uarts.dtbo \
-    ti/k3-j7200-mcspi-loopback.dtbo \
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-j784s4 \
+    ti/k3-j7200-mcspi-loopback \
 "
 
+KERNEL_DEVICETREE = ""
+
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
 
 # Default tiboot3.bin on J784S4 is for GP
diff --git a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
index b318f82d..a8b08964 100644
--- a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
+++ b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
@@ -15,4 +15,9 @@ IMAGE_FSTYPES += "tar.xz"
 
 SERIAL_CONSOLES = "115200;ttyS2"
 
-KERNEL_DEVICETREE = "da850-evm.dtb da850-lcdk.dtb"
+KERNEL_DEVICETREE_PREFIX = "da850"
+
+KERNEL_DEVICETREE = " \
+    da850-evm.dtb \
+    da850-lcdk.dtb \
+"
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
index f3793baf..2da66b67 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -11,6 +11,7 @@ DEFCONFIG_BUILDER = "${S}/ti_config_fragments/defconfig_builder.sh"
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
+include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
 
 DEPENDS += "gmp-native libmpc-native"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
new file mode 100644
index 00000000..1496a749
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
+KERNEL_DEVICETREE = "${@get_dtbs_from_kernel('${S}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_PREFIX}')} ${KERNEL_DEVICETREE_DTBMERGE}"
+
-- 
2.17.1



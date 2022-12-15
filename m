Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1105C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 15:38:02 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.136334.1671118682011870931
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Dec 2022 07:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EnefHraw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BFFc0fh101622;
	Thu, 15 Dec 2022 09:38:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1671118680;
	bh=y4sYFBbs0eztwKGm/ynOWfmdecTrE9WAeOfpy6O9UkI=;
	h=From:To:Subject:Date;
	b=EnefHrawBQdAbD/JFkeieK483YpeMXlGEQASYvVERqeNlFy2gCBpI1P87CCR7bq+i
	 JTCtEKJHg7LGsweEPTT+3Iyo1DXwTg83lxdFbDTqC+v6OH+y9Oa506/mfeya6eiRaH
	 PZGCb+tSI0pWeIXFrYUdjD4DrPC99tW8HTnC9Vg0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BFFc05L037606
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Dec 2022 09:38:00 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 15
 Dec 2022 09:38:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 15 Dec 2022 09:38:00 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BFFc0t2007015;
	Thu, 15 Dec 2022 09:38:00 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1p5qJ6-0003ke-CX; Thu, 15 Dec 2022 09:38:00 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] linux-ti-next: Add filtering for dtb/dtbo to include
Date: Thu, 15 Dec 2022 09:38:00 -0600
Message-ID: <20221215153800.14380-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Dec 2022 15:38:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15482

Add support for a new variable DEVICETREE_PATTERN that we
can set in each machine config that will let us choose
which dtb/dtbo files to include rather than picking
them all.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-evm.conf        |  2 ++
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf     |  2 ++
 meta-ti-bsp/conf/machine/beagle-x15.conf        |  2 ++
 meta-ti-bsp/conf/machine/beaglebone.conf        |  2 ++
 meta-ti-bsp/conf/machine/include/am64xx.inc     |  2 ++
 meta-ti-bsp/conf/machine/include/am65xx.inc     |  2 ++
 meta-ti-bsp/conf/machine/include/ti33x.inc      |  2 ++
 meta-ti-bsp/conf/machine/j7200-evm.conf         |  2 ++
 meta-ti-bsp/conf/machine/j721e-evm.conf         |  2 ++
 meta-ti-bsp/conf/machine/j721s2-evm.conf        |  2 ++
 meta-ti-bsp/conf/machine/j784s4-evm.conf        |  2 ++
 .../recipes-kernel/linux/linux-ti-next_git.bb   | 17 +++++++++++------
 12 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index 73859d5f..97927b48 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -11,4 +11,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-sk-csi2-ov5640.dtbo \
 "
 
+DEVICETREE_PATTERN = "ti/k3-am625-*"
+
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index ef8e8692..a29e1407 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -13,4 +13,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-sk-csi2-ov5640.dtbo \
 "
 
+DEVICETREE_PATTERN = "ti/k3-am62*"
+
 UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
index c7503266..14467f24 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
@@ -6,6 +6,8 @@ require conf/machine/include/dra7xx.inc
 
 KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb"
 
+DEVICETREE_PATTERN = "am57xx-beagle-*"
+
 MACHINE_GUI_CLASS = "bigscreen"
 
 SERIAL_CONSOLES = "115200;ttyS2"
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
index 413a960d..76035a4b 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
@@ -8,6 +8,8 @@ KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblue.dtb \
                     am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
                     am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb"
 
+DEVICETREE_PATTERN = "am335x-*"
+
 MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_FEATURES += "screen"
 
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 2fca1ac0..62c01347 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -14,6 +14,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-am642-evm-nand.dtbo \
 "
 
+DEVICETREE_PATTERN = "ti/k3-am642-*"
+
 # Default tiboot3.bin on AM64x is for SR2.0 HS-FS
 BBMULTICONFIG = "k3r5-sr2-hs-fs"
 do_image[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index ef31ea52..5bb84de5 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -26,6 +26,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-evm-ov5640.dtbo \
 "
 
+DEVICETREE_PATTERN = "ti/k3-am654-*"
+
 BBMULTICONFIG += "k3r5-sr2"
 
 # Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index d9381555..a327d29e 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -30,6 +30,8 @@ KERNEL_DEVICETREE = " \
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
 
+DEVICETREE_PATTERN = "am335x-*"
+
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am335x_evm_config"
 
diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
index 077d2f41..fdffd7a8 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
@@ -11,6 +11,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-j7200-common-proc-board.dtb \
 "
 
+DEVICETREE_PATTERN = "ti/k3-j7200-*"
+
 UBOOT_MACHINE = "j7200_evm_a72_config"
 
 do_image[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index d28d16d1..9a22cba9 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -16,4 +16,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-sk.dtb \
 "
 
+DEVICETREE_PATTERN = "ti/k3-j721e-*"
+
 UBOOT_MACHINE = "j721e_evm_a72_config"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index d02c8258..bd99728c 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -15,6 +15,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721s2-gesi-exp-board.dtbo \
 "
 
+DEVICETREE_PATTERN = "ti/k3-j721s2-*"
+
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
 
 do_image[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index f88006c3..a27c82ec 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -16,6 +16,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-j784s4-evm.dtb \
 "
 
+DEVICETREE_PATTERN = "ti/k3-j784s4-*"
+
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
 
 do_image[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index e2908951..6eb75673 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -19,21 +19,26 @@ PV = "6.1.0-rc1+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git;protocol=https;branch=master"
 
-def list_dtbs(dts_dir, dts_subdir):
+def list_dtbs(dts_dir, dts_subdir, dts_pattern):
     import os
     import fnmatch
-    matches = []
+    all_matches = []
+    final_matches = []
 
     for root,dirnames,filenames in os.walk(os.path.join(dts_dir, dts_subdir)):
         for filename in fnmatch.filter(filenames, '*.dtb'):
-            matches.append(os.path.join(dts_subdir, filename))
+            all_matches.append(os.path.join(dts_subdir, filename))
         for filename in fnmatch.filter(filenames, '*.dtbo'):
-            matches.append(os.path.join(dts_subdir, filename))
-    return ' '.join(matches)
+            all_matches.append(os.path.join(dts_subdir, filename))
+    for filename in fnmatch.filter(all_matches, dts_pattern):
+        final_matches.append(filename)
+    return ' '.join(final_matches)
+
+DEVICETREE_PATTERN ?= "*"
 
 DTS_SUBDIR = ""
 DTS_SUBDIR:k3 = "ti"
-KERNEL_DEVICETREE = "${@list_dtbs('${B}/arch/${ARCH}/boot/dts', '${DTS_SUBDIR}')}"
+KERNEL_DEVICETREE = "${@list_dtbs('${B}/arch/${ARCH}/boot/dts', '${DTS_SUBDIR}', '${DEVICETREE_PATTERN}')}"
 DEFCONFIG_NAME = "multi_v7_defconfig"
 DEFCONFIG_NAME:k3 = "defconfig"
 KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
-- 
2.17.1



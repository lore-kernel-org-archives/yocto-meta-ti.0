Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7BFC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 14:21:02 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.16219.1721312455230459027
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 07:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fv46HtN5;
 spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46IEKrVw010651;
	Thu, 18 Jul 2024 09:20:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721312453; i=@ti.com;
	bh=DBoXJbLBR8vOFr8IloOaGLZn4rG+9bFKIe6uJ1F4XWU=;
	h=From:To:Subject:Date;
	b=fv46HtN5zmD/XjEv8iTaN7+idBYKPC75v3IC/8v5WdwuVO5rz7xFDnJFWWymBkAKN
	 lmSZAseL4HUIlURD0lK7givhLTST6fJVyaSmRGp/VKJ+ZChp+nzvknvC9THyPDaK4E
	 J79fRiDFG1tj+YRlVkCGHsa1VxLokMGlHrjZBql8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46IEKrjY111990
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Jul 2024 09:20:53 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Jul 2024 09:20:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Jul 2024 09:20:53 -0500
Received: from fllvdckhpci035.itg.ti.com (fllvdckhpci035.itg.ti.com [10.248.132.247])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46IEKr8g042955;
	Thu, 18 Jul 2024 09:20:53 -0500
Received: by fllvdckhpci035.itg.ti.com (Postfix, from userid 60899)
	id 9AC7210F3324; Thu, 18 Jul 2024 09:20:53 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] linux-ti-mainline: Update to version: v6.10
Date: Thu, 18 Jul 2024 09:20:53 -0500
Message-ID: <1721312453-131291-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 14:21:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17887

Updated the value(s) for:
  am57xx-evm: KERNEL_DEVICETREE
  am62axx-evm: KERNEL_DEVICETREE
  am62pxx-evm: KERNEL_DEVICETREE
  am62xx-evm: KERNEL_DEVICETREE
  am62xx-lp-evm: KERNEL_DEVICETREE
  am68-sk: KERNEL_DEVICETREE
  am69-sk: KERNEL_DEVICETREE
  beagleplay: KERNEL_DEVICETREE
  am64xx-evm: KERNEL_DEVICETREE
  am65xx-evm: KERNEL_DEVICETREE
  am335x-evm: KERNEL_DEVICETREE
  am437x-evm: KERNEL_DEVICETREE
  j7200-evm: KERNEL_DEVICETREE
  j721e-evm: KERNEL_DEVICETREE
  j721e-sk: KERNEL_DEVICETREE
  j721s2-evm: KERNEL_DEVICETREE
  j722s-evm: KERNEL_DEVICETREE
  j784s4-evm: KERNEL_DEVICETREE
  linux-ti-mainline: PV,SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/conf/machine/am57xx-evm.conf           | 17 +++++++---
 meta-ti-bsp/conf/machine/am62axx-evm.conf          |  4 +++
 meta-ti-bsp/conf/machine/am62pxx-evm.conf          |  4 +++
 meta-ti-bsp/conf/machine/am62xx-evm.conf           | 16 +++++++++
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf        |  2 ++
 meta-ti-bsp/conf/machine/am68-sk.conf              |  1 +
 meta-ti-bsp/conf/machine/am69-sk.conf              |  1 +
 meta-ti-bsp/conf/machine/beagleplay.conf           | 20 ++++++++++--
 meta-ti-bsp/conf/machine/include/am64xx.inc        |  7 ++++
 meta-ti-bsp/conf/machine/include/am65xx.inc        |  9 +++++
 meta-ti-bsp/conf/machine/include/ti33x.inc         | 38 ++++++++++++++++++----
 meta-ti-bsp/conf/machine/include/ti43x.inc         |  4 ++-
 meta-ti-bsp/conf/machine/j7200-evm.conf            |  1 +
 meta-ti-bsp/conf/machine/j721e-evm.conf            |  5 +++
 meta-ti-bsp/conf/machine/j721e-sk.conf             |  1 +
 meta-ti-bsp/conf/machine/j721s2-evm.conf           |  3 ++
 meta-ti-bsp/conf/machine/j784s4-evm.conf           |  1 +
 .../recipes-kernel/linux/linux-ti-mainline_git.bb  |  6 ++--
 18 files changed, 123 insertions(+), 17 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
index 09eb470..f9ff90c 100644
--- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
@@ -25,13 +25,22 @@ KERNEL_DEVICETREE_DTBMERGE = " \
 "
 
 KERNEL_DEVICETREE = " \
-    ti/omap/am57xx-beagle-x15.dtb \
-    ti/omap/am57xx-beagle-x15-revb1.dtb \
-    ti/omap/am57xx-beagle-x15-revc.dtb \
-    ti/omap/am5729-beagleboneai.dtb \
+    ti/omap/am571x-idk-touchscreen.dtbo \
     ti/omap/am571x-idk.dtb \
+    ti/omap/am5729-beagleboneai.dtb \
+    ti/omap/am572x-idk-touchscreen.dtbo \
     ti/omap/am572x-idk.dtb \
     ti/omap/am574x-idk.dtb \
+    ti/omap/am57xx-beagle-x15-revb1.dtb \
+    ti/omap/am57xx-beagle-x15-revc.dtb \
+    ti/omap/am57xx-beagle-x15.dtb \
+    ti/omap/am57xx-cl-som-am57x.dtb \
+    ti/omap/am57xx-evm-reva3.dtb \
+    ti/omap/am57xx-evm.dtb \
+    ti/omap/am57xx-evm.dtbo \
+    ti/omap/am57xx-idk-lcd-osd101t2045.dtbo \
+    ti/omap/am57xx-idk-lcd-osd101t2587.dtbo \
+    ti/omap/am57xx-sbc-am57x.dtb \
 "
 
 UBOOT_MACHINE = "am57xx_evm_config"
diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
index 238718d..4828c9d 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -13,6 +13,10 @@ KERNEL_DEVICETREE_PREFIX = " \
 
 KERNEL_DEVICETREE = " \
     ti/k3-am62a7-sk.dtb \
+    ti/k3-am62x-sk-csi2-imx219.dtbo \
+    ti/k3-am62x-sk-csi2-ov5640.dtbo \
+    ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
+    ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
 UBOOT_MACHINE = "am62ax_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index 8d94c2b..676e64a 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -14,6 +14,10 @@ KERNEL_DEVICETREE_PREFIX = " \
 
 KERNEL_DEVICETREE = " \
     ti/k3-am62p5-sk.dtb \
+    ti/k3-am62x-sk-csi2-imx219.dtbo \
+    ti/k3-am62x-sk-csi2-ov5640.dtbo \
+    ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
+    ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
 UBOOT_MACHINE = "am62px_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index fadbc6f..31de4a1 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -11,7 +11,23 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
+    ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
+    ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
+    ti/k3-am625-beagleplay.dtb \
+    ti/k3-am625-phyboard-lyra-rdk.dtb \
     ti/k3-am625-sk.dtb \
+    ti/k3-am625-verdin-nonwifi-dahlia.dtb \
+    ti/k3-am625-verdin-nonwifi-dev.dtb \
+    ti/k3-am625-verdin-nonwifi-mallow.dtb \
+    ti/k3-am625-verdin-nonwifi-yavia.dtb \
+    ti/k3-am625-verdin-wifi-dahlia.dtb \
+    ti/k3-am625-verdin-wifi-dev.dtb \
+    ti/k3-am625-verdin-wifi-mallow.dtb \
+    ti/k3-am625-verdin-wifi-yavia.dtb \
+    ti/k3-am62x-sk-csi2-imx219.dtbo \
+    ti/k3-am62x-sk-csi2-ov5640.dtbo \
+    ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
+    ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 51e9972..e9271f5 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -15,6 +15,8 @@ KERNEL_DEVICETREE_PREFIX = " \
 
 KERNEL_DEVICETREE = " \
     ti/k3-am62-lp-sk.dtb \
+    ti/k3-am625-sk.dtb \
+    ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
 UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am68-sk.conf b/meta-ti-bsp/conf/machine/am68-sk.conf
index 894c4e8..feabbfd 100644
--- a/meta-ti-bsp/conf/machine/am68-sk.conf
+++ b/meta-ti-bsp/conf/machine/am68-sk.conf
@@ -17,6 +17,7 @@ KERNEL_DEVICETREE_PREFIX = " \
 
 KERNEL_DEVICETREE = " \
     ti/k3-am68-sk-base-board.dtb \
+    ti/k3-j721e-sk-csi2-dual-imx219.dtbo \
 "
 
 UBOOT_MACHINE = "am68_sk_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf b/meta-ti-bsp/conf/machine/am69-sk.conf
index aff06a0..9531cc2 100644
--- a/meta-ti-bsp/conf/machine/am69-sk.conf
+++ b/meta-ti-bsp/conf/machine/am69-sk.conf
@@ -18,6 +18,7 @@ KERNEL_DEVICETREE_PREFIX = " \
 
 KERNEL_DEVICETREE = " \
     ti/k3-am69-sk.dtb \
+    ti/k3-j721e-sk-csi2-dual-imx219.dtbo \
 "
 
 UBOOT_MACHINE = "am69_sk_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
index 8c83198..d420c6c 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -33,9 +33,23 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
-ti/k3-am625-beagleplay.dtb \
-ti/k3-am625-sk.dtb \
-ti/k3-am62x-sk-hdmi-audio.dtbo \
+    ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
+    ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
+    ti/k3-am625-beagleplay.dtb \
+    ti/k3-am625-phyboard-lyra-rdk.dtb \
+    ti/k3-am625-sk.dtb \
+    ti/k3-am625-verdin-nonwifi-dahlia.dtb \
+    ti/k3-am625-verdin-nonwifi-dev.dtb \
+    ti/k3-am625-verdin-nonwifi-mallow.dtb \
+    ti/k3-am625-verdin-nonwifi-yavia.dtb \
+    ti/k3-am625-verdin-wifi-dahlia.dtb \
+    ti/k3-am625-verdin-wifi-dev.dtb \
+    ti/k3-am625-verdin-wifi-mallow.dtb \
+    ti/k3-am625-verdin-wifi-yavia.dtb \
+    ti/k3-am62x-sk-csi2-imx219.dtbo \
+    ti/k3-am62x-sk-csi2-ov5640.dtbo \
+    ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
+    ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
 KERNEL_DEVICETREE:append:bsp-bb_org = " \
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index cfade2f..56b6df7 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -4,8 +4,15 @@ SOC_FAMILY:append = ":am64xx"
 KERNEL_DEVICETREE_PREFIX = "ti/k3-am642"
 
 KERNEL_DEVICETREE = " \
+    ti/k3-am642-evm-icssg1-dualemac.dtbo \
     ti/k3-am642-evm.dtb \
+    ti/k3-am642-hummingboard-t-pcie.dtbo \
+    ti/k3-am642-hummingboard-t-usb3.dtbo \
+    ti/k3-am642-hummingboard-t.dtb \
+    ti/k3-am642-phyboard-electra-gpio-fan.dtbo \
+    ti/k3-am642-phyboard-electra-rdk.dtb \
     ti/k3-am642-sk.dtb \
+    ti/k3-am642-tqma64xxl-mbax4xxl.dtb \
 "
 
 # Default tiboot3.bin on AM64x is for SR2.0 HS-FS
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index e033c09..4651314 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -9,7 +9,16 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
 KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
 
 KERNEL_DEVICETREE = " \
+    ti/k3-am654-base-board-rocktech-rk101-panel.dtbo \
     ti/k3-am654-base-board.dtb \
+    ti/k3-am654-icssg2.dtbo \
+    ti/k3-am654-idk.dtbo \
+    ti/k3-am654-pcie-usb2.dtbo \
+    ti/k3-am654-pcie-usb3.dtbo \
+    ti/k3-am6548-iot2050-advanced-m2.dtb \
+    ti/k3-am6548-iot2050-advanced-pg2.dtb \
+    ti/k3-am6548-iot2050-advanced-sm.dtb \
+    ti/k3-am6548-iot2050-advanced.dtb \
 "
 
 IMAGE_BOOT_FILES += "sysfw.itb"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index a8dc217..7e9eb48 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -19,17 +19,43 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
+    ti/omap/am335x-baltos-ir2110.dtb \
+    ti/omap/am335x-baltos-ir3220.dtb \
+    ti/omap/am335x-baltos-ir5221.dtb \
+    ti/omap/am335x-base0033.dtb \
+    ti/omap/am335x-bone.dtb \
+    ti/omap/am335x-boneblack-wireless.dtb \
+    ti/omap/am335x-boneblack.dtb \
+    ti/omap/am335x-boneblue.dtb \
+    ti/omap/am335x-bonegreen-wireless.dtb \
+    ti/omap/am335x-bonegreen.dtb \
+    ti/omap/am335x-chiliboard.dtb \
+    ti/omap/am335x-cm-t335.dtb \
     ti/omap/am335x-evm.dtb \
     ti/omap/am335x-evmsk.dtb \
+    ti/omap/am335x-guardian.dtb \
     ti/omap/am335x-icev2.dtb \
+    ti/omap/am335x-lxm.dtb \
+    ti/omap/am335x-moxa-uc-2101.dtb \
+    ti/omap/am335x-moxa-uc-8100-me-t.dtb \
+    ti/omap/am335x-myirtech-myd.dtb \
+    ti/omap/am335x-nano.dtb \
+    ti/omap/am335x-netcan-plus-1xx.dtb \
+    ti/omap/am335x-netcom-plus-2xx.dtb \
+    ti/omap/am335x-netcom-plus-8xx.dtb \
+    ti/omap/am335x-osd3358-sm-red.dtb \
+    ti/omap/am335x-pdu001.dtb \
+    ti/omap/am335x-pepper.dtb \
+    ti/omap/am335x-phycore-rdk.dtb \
     ti/omap/am335x-pocketbeagle.dtb \
-    ti/omap/am335x-bone.dtb \
-    ti/omap/am335x-boneblue.dtb \
-    ti/omap/am335x-bonegreen.dtb \
-    ti/omap/am335x-bonegreen-wireless.dtb \
-    ti/omap/am335x-boneblack.dtb \
-    ti/omap/am335x-boneblack-wireless.dtb \
+    ti/omap/am335x-regor-rdk.dtb \
+    ti/omap/am335x-sancloud-bbe-extended-wifi.dtb \
+    ti/omap/am335x-sancloud-bbe-lite.dtb \
     ti/omap/am335x-sancloud-bbe.dtb \
+    ti/omap/am335x-sbc-t335.dtb \
+    ti/omap/am335x-shc.dtb \
+    ti/omap/am335x-sl50.dtb \
+    ti/omap/am335x-wega-rdk.dtb \
 "
 
 UBOOT_ARCH = "arm"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index 6fb87f1..2621d19 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -21,9 +21,11 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
+    ti/omap/am437x-cm-t43.dtb \
     ti/omap/am437x-gp-evm.dtb \
-    ti/omap/am437x-sk-evm.dtb \
     ti/omap/am437x-idk-evm.dtb \
+    ti/omap/am437x-sbc-t43.dtb \
+    ti/omap/am437x-sk-evm.dtb \
     ti/omap/am43x-epos-evm.dtb \
 "
 
diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
index dff1da6..adfc637 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
@@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX = "ti/k3-j7200"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j7200-common-proc-board.dtb \
+    ti/k3-j7200-evm-quad-port-eth-exp.dtbo \
 "
 
 UBOOT_MACHINE = "j7200_evm_a72_config"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index 5e1f6dc..92144d3 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -11,7 +11,12 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
+    ti/k3-j721e-beagleboneai64.dtb \
     ti/k3-j721e-common-proc-board.dtb \
+    ti/k3-j721e-evm-gesi-exp-board.dtbo \
+    ti/k3-j721e-evm-pcie0-ep.dtbo \
+    ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
+    ti/k3-j721e-sk-csi2-dual-imx219.dtbo \
     ti/k3-j721e-sk.dtb \
 "
 
diff --git a/meta-ti-bsp/conf/machine/j721e-sk.conf b/meta-ti-bsp/conf/machine/j721e-sk.conf
index a7a9578..604f893 100644
--- a/meta-ti-bsp/conf/machine/j721e-sk.conf
+++ b/meta-ti-bsp/conf/machine/j721e-sk.conf
@@ -10,6 +10,7 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
+    ti/k3-j721e-sk-csi2-dual-imx219.dtbo \
     ti/k3-j721e-sk.dtb \
 "
 
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index c4e8af9..5cb2830 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -16,7 +16,10 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
+    ti/k3-am68-sk-base-board.dtb \
     ti/k3-j721s2-common-proc-board.dtb \
+    ti/k3-j721s2-evm-gesi-exp-board.dtbo \
+    ti/k3-j721s2-evm-pcie1-ep.dtbo \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 770701f..8858a91 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -18,6 +18,7 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
+    ti/k3-am69-sk.dtb \
     ti/k3-j784s4-evm.dtb \
 "
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 77ebb11..ffeaa2e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -13,9 +13,9 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
 
 S = "${WORKDIR}/git"
 
-# 6.6 Mainline version
-SRCREV = "ffc253263a1375a65fa6c9f62a893e9767fbebfa"
-PV = "6.6"
+# 6.10 Mainline version
+SRCREV = "d04e483db22823c13c0313b7c43a52529a2e2672"
+PV = "6.10"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=https;branch=master"
 
-- 
1.8.3.1



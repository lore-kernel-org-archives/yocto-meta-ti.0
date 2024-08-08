Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E4AC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 19:27:30 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.68331.1723145239915989664
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Aug 2024 12:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vyC/KN+6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 478JRJeb122482;
	Thu, 8 Aug 2024 14:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723145239;
	bh=zY5uR2Udam9fV8bImqhzk/emUL0hXapmohRtHBeI5t8=;
	h=From:To:Subject:Date;
	b=vyC/KN+6ECjXrjLz4BxcjJI2jhxK5q6u9FjYWHPza0LC5WZ7KCeajCfjE083zbrXz
	 VqSV6hkLp1Iq/AdeTz0EAJg3n6EXDP9t1NYU9uMG29KYIeyqKeRSP/1rLEzKsakaW4
	 UvrvuL3lBNirOREMGoeMfnXiwnvvE2mnL0I6sW/E=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 478JRJ9V028156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Aug 2024 14:27:19 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 14:27:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 14:27:18 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 478JRIgs073911;
	Thu, 8 Aug 2024 14:27:18 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sc8n8-0003gz-K1; Thu, 08 Aug 2024 14:27:18 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][RFC] conf: machine: am62xx-unified: Create new common am62xx machine
Date: Thu, 8 Aug 2024 14:27:18 -0500
Message-ID: <20240808192718.14154-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Aug 2024 19:27:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17931

To reduce the number of required builds for testing purposes, create a
common unified am62xx machine target that can produce all of the files
for all of the variant platforms related to am62xx (sip and lp).
Additionally, continue to support building the specific target if
desired.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf |  9 +---
 meta-ti-bsp/conf/machine/am62xx-evm.conf      |  5 +--
 .../conf/machine/am62xx-lp-evm-k3r5.conf      |  9 +---
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  5 +--
 .../conf/machine/am62xx-unified-k3r5.conf     | 20 +++++++++
 meta-ti-bsp/conf/machine/am62xx-unified.conf  | 43 +++++++++++++++++++
 .../conf/machine/am62xxsip-evm-k3r5.conf      |  8 ++--
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf   |  6 +--
 8 files changed, 76 insertions(+), 29 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-unified.conf

diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
index 548369ca..3a819835 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -2,11 +2,6 @@
 #@NAME: AM62XX EVM (R5F)
 #@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
 
-require conf/machine/include/k3r5.inc
-require conf/machine/include/ti-extras.inc
+require conf/machine/am62xx-unified-k3r5.conf
 
-SYSFW_SOC = "am62x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-
-UBOOT_MACHINE = "am62x_evm_r5_defconfig"
+UBOOT_CONFIG = "evm"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index 31de4a14..8c80cb1f 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -2,8 +2,7 @@
 #@NAME: AM62XX EVM
 #@DESCRIPTION: Machine configuration for the TI AM62XX EVM
 
-require conf/machine/include/am62xx.inc
-require conf/machine/include/ti-extras.inc
+require conf/machine/am62xx-unified.conf
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am625 \
@@ -30,4 +29,4 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
-UBOOT_MACHINE = "am62x_evm_a53_defconfig"
+UBOOT_CONFIG = "evm"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
index 52b69a72..fb760e99 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -2,11 +2,6 @@
 #@NAME: AM62XX LP GP EVM (R5F)
 #@DESCRIPTION: Machine configuration for the TI AM62xx LP GP EVM (R5F core)
 
-require conf/machine/include/k3r5.inc
-require conf/machine/include/ti-extras.inc
+require conf/machine/am62xx-unified-k3r5.conf
 
-SYSFW_SOC = "am62x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-
-UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
+UBOOT_CONFIG = "lpsk"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index e9271f5b..f7d89d68 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -2,8 +2,7 @@
 #@NAME: AM62XX LP EVM
 #@DESCRIPTION: Machine configuration for the TI AM62XX LP EVM
 
-require conf/machine/include/am62xx.inc
-require conf/machine/include/ti-extras.inc
+require conf/machine/am62xx-unified.conf
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62-lp \
@@ -19,4 +18,4 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
-UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
+UBOOT_CONFIG = "lpsk"
diff --git a/meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf
new file mode 100644
index 00000000..7d65e6af
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf
@@ -0,0 +1,20 @@
+#@TYPE: Machine
+#@NAME: AM62XX EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+require conf/machine/include/ti-extras.inc
+
+SYSFW_SOC = "am62x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE = ""
+# Last config in the list is default
+UBOOT_CONFIG ??= "sip lpsk evm"
+
+UBOOT_CONFIG:bsp-ti-6_1 ??= "evm"
+
+UBOOT_CONFIG[sip] = "am62xsip_evm_r5_defconfig"
+UBOOT_CONFIG[lpsk] = "am62x_lpsk_r5_defconfig"
+UBOOT_CONFIG[evm] = "am62x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-unified.conf b/meta-ti-bsp/conf/machine/am62xx-unified.conf
new file mode 100644
index 00000000..5b03239f
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xx-unified.conf
@@ -0,0 +1,43 @@
+#@TYPE: Machine
+#@NAME: AM62XX Unified EVM
+#@DESCRIPTION: Machine configuration for the TI AM62XX EVM and all of its variations
+
+require conf/machine/include/am62xx.inc
+require conf/machine/include/ti-extras.inc
+
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-am62-lp \
+    ti/k3-am625 \
+    ti/k3-am62x-sk \
+"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-am62-lp-sk.dtb \
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
+"
+
+UBOOT_MACHINE = ""
+# Last config in the list is default
+UBOOT_CONFIG ??= "sip lpsk evm"
+
+UBOOT_CONFIG:bsp-ti-6_1 ??= "lpsk evm"
+
+UBOOT_CONFIG[sip] = "am62xsip_evm_a53_defconfig"
+UBOOT_CONFIG[lpsk] = "am62x_lpsk_a53_defconfig"
+UBOOT_CONFIG[evm] = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
index 55bc530b..ab538ff3 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -2,13 +2,11 @@
 #@NAME: AM62XX SIP EVM (R5F)
 #@DESCRIPTION: Machine configuration for the TI AM62xx SIP EVM (R5F core)
 
-require conf/machine/include/k3r5.inc
+require conf/machine/am62xx-unified-k3r5.conf
 
-SYSFW_SOC = "am62x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
+UBOOT_CONFIG = "sip"
 
-UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
+UBOOT_CONFIG:bsp-ti-6_1 = ""
 
 UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
 
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index 8104329e..6b179b80 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: AM62XX SIP EVM
 #@DESCRIPTION: Machine configuration for the TI AM62XX SIP EVM
 
-require conf/machine/include/am62xx.inc
+require conf/machine/am62xx-unified.conf
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am625 \
@@ -13,6 +13,4 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
 "
 
-UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
-
-UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"
+UBOOT_CONFIG = "sip"
-- 
2.17.1



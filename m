Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C603E77194
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:54:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.139693.1734645244530111591
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=saptiJi5;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs3Gv017225;
	Thu, 19 Dec 2024 15:54:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645243;
	bh=Ad0nxwfhQYLFXM7zIMyfkORHNfDEGaQXgyamc7crVp0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=saptiJi5uQQjta83ZPb4yjTmyWkbRBI/OcoVyUGJY9ns5OHw+aAZA6OvR0ZoQRmJW
	 El6lJ6LFOgUG5OAZTqi47lFYYFWV8LyMTwzcpArhroJOYNaCb5WN9CTwy/1Qh/5HV2
	 QbFCPtEYTKX8ltbG2G3lweTiu3UNVnWnTdeEqZtY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs3GO130292
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:54:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:54:03 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs31S066790;
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOT5-0007XK-2E; Thu, 19 Dec 2024 15:54:03 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 05/13] conf/machine: split beagleplay config between meta-ti-bsp and meta-beagle
Date: Thu, 19 Dec 2024 15:53:54 -0600
Message-ID: <20241219215402.28324-6-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219215402.28324-1-reatmon@ti.com>
References: <20241219215402.28324-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 21:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18149

From: Denys Dmytriyenko <denys@konsulko.com>

Extract "bb_org" BSP specific settings from beagleplay-ti in meta-ti-bsp and
move them to own beagleplay machine config in meta-beagle.

The differences between 2 configs are minimal, hence beagleplay in meta-beagle
inherits beagleplay-ti from meta-ti-bsp as a base and only adjusts what's
needed.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/conf/machine/beagleplay-k3r5.conf |  8 +++
 meta-beagle/conf/machine/beagleplay.conf      | 45 ++++++++++++++++
 .../conf/machine/beagleplay-ti-k3r5.conf      |  1 -
 meta-ti-bsp/conf/machine/beagleplay-ti.conf   | 51 +------------------
 4 files changed, 55 insertions(+), 50 deletions(-)
 create mode 100644 meta-beagle/conf/machine/beagleplay-k3r5.conf
 create mode 100644 meta-beagle/conf/machine/beagleplay.conf

diff --git a/meta-beagle/conf/machine/beagleplay-k3r5.conf b/meta-beagle/conf/machine/beagleplay-k3r5.conf
new file mode 100644
index 00000000..1423aa10
--- /dev/null
+++ b/meta-beagle/conf/machine/beagleplay-k3r5.conf
@@ -0,0 +1,8 @@
+#@TYPE: Machine
+#@NAME: BeaglePlay (R5F)
+#@DESCRIPTION: Machine configuration for the BeaglePlay (R5F core)
+
+require conf/machine/beagleplay-ti-k3r5.conf
+require conf/machine/include/beagle-bsp.inc
+
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am625_beagleplay_r5.config"
diff --git a/meta-beagle/conf/machine/beagleplay.conf b/meta-beagle/conf/machine/beagleplay.conf
new file mode 100644
index 00000000..1977b4c1
--- /dev/null
+++ b/meta-beagle/conf/machine/beagleplay.conf
@@ -0,0 +1,45 @@
+#@TYPE: Machine
+#@NAME: BeaglePlay (A53)
+#@DESCRIPTION: Machine configuration for the BeaglePlay board (A53 core)
+
+require conf/machine/beagleplay-ti.conf
+require conf/machine/include/beagle-bsp.inc
+
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am625_beagleplay_a53.config"
+
+KERNEL_DEVICETREE:append:bsp-bb_org = " \
+ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
+ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
+ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
+ti/k3-am625-beaglemod.dtb \
+ti/k3-am625-beaglemod-audio.dtbo \
+ti/k3-am625-beaglemod-can0.dtbo \
+ti/k3-am625-beaglemod-can1.dtbo \
+ti/k3-am625-beaglemod-csi0-ov5640.dtbo \
+ti/k3-am625-beaglemod-eeprom.dtbo \
+ti/k3-am625-beaglemod-eth.dtbo \
+ti/k3-am625-beaglemod-hdmi.dtbo \
+ti/k3-am625-beaglemod-io-expand.dtbo \
+ti/k3-am625-beaglemod-lt-lcd185.dtbo \
+ti/k3-am625-beaglemod-ospi-flash.dtbo \
+ti/k3-am625-beaglemod-rs485-1.dtbo \
+ti/k3-am625-beaglemod-rs485-2.dtbo \
+ti/k3-am625-beaglemod-rtc.dtbo \
+ti/k3-am625-beaglemod-wl1835.dtbo \
+ti/k3-am625-sk-dmtimer-pwm.dtbo \
+ti/k3-am625-sk-ecap-capture.dtbo \
+ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
+ti/k3-am625-sk-mcspi-loopback.dtbo \
+ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
+ti/k3-am625-sk-microtips-mf103hie-lcd2.dtbo \
+ti/k3-am625-sk-pwm.dtbo \
+ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
+ti/k3-am62x-sk-csi2-imx219.dtbo \
+ti/k3-am62x-sk-csi2-ov5640.dtbo \
+ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
+ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
+ti/k3-am62x-sk-eqep.dtbo \
+ti/k3-am62x-sk-hdmi-disable-fastboot.dtbo \
+ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
+ti/k3-am62x-sk-mcan.dtbo \
+"
diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
index 3844ccfa..c27e0abc 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
@@ -12,6 +12,5 @@ UBOOT_MACHINE = "am62x_evm_r5_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 = "am62x_beagleplay_r5_defconfig"
 UBOOT_MACHINE:bsp-ti-6_12 = "am62x_beagleplay_r5_defconfig"
 
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am625_beagleplay_r5.config"
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_r5.config"
 UBOOT_CONFIG_FRAGMENTS:bsp-mainline = "beagleplay_r5.config"
diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
index 3ae10171..68d6dced 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-ti.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
@@ -24,14 +24,14 @@ UBOOT_MACHINE:bsp-ti-6_6 = "am62x_beagleplay_a53_defconfig"
 UBOOT_MACHINE:bsp-ti-6_12 = "am62x_beagleplay_a53_defconfig"
 
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_a53.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am625_beagleplay_a53.config"
 UBOOT_CONFIG_FRAGMENTS:bsp-mainline = "beagleplay_a53.config"
 
 SPL_BINARY:bsp-ti-6_6 = "tispl.bin_unsigned"
 SPL_BINARYNAME:bsp-ti-6_6 = "tispl.bin"
 
 KERNEL_DEVICETREE_PREFIX = " \
-    ti/k3-am625 \
+    ti/k3-am625-beagle \
+    ti/k3-am625-sk \
     ti/k3-am62x-sk \
 "
 
@@ -39,58 +39,11 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
     ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
     ti/k3-am625-beagleplay.dtb \
-    ti/k3-am625-phyboard-lyra-1-4-ghz-opp.dtbo \
-    ti/k3-am625-phyboard-lyra-rdk.dtb \
     ti/k3-am625-sk.dtb \
-    ti/k3-am625-verdin-nonwifi-dahlia.dtb \
-    ti/k3-am625-verdin-nonwifi-dev.dtb \
-    ti/k3-am625-verdin-nonwifi-mallow.dtb \
-    ti/k3-am625-verdin-nonwifi-yavia.dtb \
-    ti/k3-am625-verdin-wifi-dahlia.dtb \
-    ti/k3-am625-verdin-wifi-dev.dtb \
-    ti/k3-am625-verdin-wifi-mallow.dtb \
-    ti/k3-am625-verdin-wifi-yavia.dtb \
     ti/k3-am62x-sk-csi2-imx219.dtbo \
     ti/k3-am62x-sk-csi2-ov5640.dtbo \
     ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
-KERNEL_DEVICETREE:append:bsp-bb_org = " \
-ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
-ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
-ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
-ti/k3-am625-beaglemod.dtb \
-ti/k3-am625-beaglemod-audio.dtbo \
-ti/k3-am625-beaglemod-can0.dtbo \
-ti/k3-am625-beaglemod-can1.dtbo \
-ti/k3-am625-beaglemod-csi0-ov5640.dtbo \
-ti/k3-am625-beaglemod-eeprom.dtbo \
-ti/k3-am625-beaglemod-eth.dtbo \
-ti/k3-am625-beaglemod-hdmi.dtbo \
-ti/k3-am625-beaglemod-io-expand.dtbo \
-ti/k3-am625-beaglemod-lt-lcd185.dtbo \
-ti/k3-am625-beaglemod-ospi-flash.dtbo \
-ti/k3-am625-beaglemod-rs485-1.dtbo \
-ti/k3-am625-beaglemod-rs485-2.dtbo \
-ti/k3-am625-beaglemod-rtc.dtbo \
-ti/k3-am625-beaglemod-wl1835.dtbo \
-ti/k3-am625-sk-dmtimer-pwm.dtbo \
-ti/k3-am625-sk-ecap-capture.dtbo \
-ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
-ti/k3-am625-sk-mcspi-loopback.dtbo \
-ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
-ti/k3-am625-sk-microtips-mf103hie-lcd2.dtbo \
-ti/k3-am625-sk-pwm.dtbo \
-ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
-ti/k3-am62x-sk-csi2-imx219.dtbo \
-ti/k3-am62x-sk-csi2-ov5640.dtbo \
-ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
-ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
-ti/k3-am62x-sk-eqep.dtbo \
-ti/k3-am62x-sk-hdmi-disable-fastboot.dtbo \
-ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
-ti/k3-am62x-sk-mcan.dtbo \
-"
-
 MACHINE_GUI_CLASS = "bigscreen"
-- 
2.17.1



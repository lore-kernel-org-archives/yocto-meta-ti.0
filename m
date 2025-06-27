Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE92C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 19:24:59 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1431.1751052297993565150
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 12:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JB1mBenu;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RJOuNA2827459;
	Fri, 27 Jun 2025 14:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751052296;
	bh=LGtaQq2FfhxQJ/A/rbB/dDwO9hKcd2k1AyguKQtq3i4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JB1mBenuh9RxoY/JoLnTSbzxY66xJCQsVo+Aj/MpR8dC7+OFh63mOLh0B7XZNrXsx
	 bSGVedddiOnO33ACKj4SeEx5Zot4zOJ6kKahfGE9X3sJtBoyRwFJfYYI4Y1xQBa1VS
	 pnhzGJIaKqbd5BEtOEULEODpNWhB6orum6TS2qo0=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RJOu3j731245
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 14:24:56 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 14:24:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 14:24:55 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RJOt1a3323523;
	Fri, 27 Jun 2025 14:24:55 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 2/3] meta-beagle: Remove selectable DT_VENDOR_PREFIX
Date: Fri, 27 Jun 2025 14:24:53 -0500
Message-ID: <20250627192454.575458-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250627192454.575458-1-afd@ti.com>
References: <20250627192454.575458-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 19:24:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18708

This was used when the DT_VENDOR_PREFIX was different between supported
BSP versions. All supported now use the new prefix so drop this var.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-beagle/conf/machine/beagle-x15.conf      | 16 ++---
 meta-beagle/conf/machine/beaglebone.conf      | 28 ++++----
 .../recipes-kernel/linux/linux-bb.org_6.12.bb | 64 +++++++++----------
 .../recipes-kernel/linux/linux-bb.org_6.6.bb  | 64 +++++++++----------
 4 files changed, 84 insertions(+), 88 deletions(-)

diff --git a/meta-beagle/conf/machine/beagle-x15.conf b/meta-beagle/conf/machine/beagle-x15.conf
index 44e0daf6..60cb2183 100644
--- a/meta-beagle/conf/machine/beagle-x15.conf
+++ b/meta-beagle/conf/machine/beagle-x15.conf
@@ -5,19 +5,17 @@
 require conf/machine/include/am57xx.inc
 require conf/machine/include/beagle-bsp.inc
 
-DT_VENDOR_PREFIX = "ti/omap/"
-
 KERNEL_DEVICETREE_PREFIX = " \
-${DT_VENDOR_PREFIX}am57xx-beagle-x15 \
-${DT_VENDOR_PREFIX}am57xx-idk-lcd \
+    ti/omap/am57xx-beagle-x15 \
+    ti/omap/am57xx-idk-lcd \
 "
 
 KERNEL_DEVICETREE = " \
-${DT_VENDOR_PREFIX}am57xx-beagle-x15.dtb \
-${DT_VENDOR_PREFIX}am57xx-beagle-x15-revb1.dtb \
-${DT_VENDOR_PREFIX}am57xx-beagle-x15-revc.dtb \
-${DT_VENDOR_PREFIX}am57xx-idk-lcd-osd101t2045.dtbo \
-${DT_VENDOR_PREFIX}am57xx-idk-lcd-osd101t2587.dtbo \
+    ti/omap/am57xx-beagle-x15.dtb \
+    ti/omap/am57xx-beagle-x15-revb1.dtb \
+    ti/omap/am57xx-beagle-x15-revc.dtb \
+    ti/omap/am57xx-idk-lcd-osd101t2045.dtbo \
+    ti/omap/am57xx-idk-lcd-osd101t2587.dtbo \
 "
 
 MACHINE_GUI_CLASS = "bigscreen"
diff --git a/meta-beagle/conf/machine/beaglebone.conf b/meta-beagle/conf/machine/beaglebone.conf
index a4d11afe..63e52914 100644
--- a/meta-beagle/conf/machine/beaglebone.conf
+++ b/meta-beagle/conf/machine/beaglebone.conf
@@ -5,25 +5,23 @@
 require conf/machine/include/ti33x.inc
 require conf/machine/include/beagle-bsp.inc
 
-DT_VENDOR_PREFIX = "ti/omap/"
-
 KERNEL_DEVICETREE_PREFIX = " \
-${DT_VENDOR_PREFIX}am335x-bone \
-${DT_VENDOR_PREFIX}am335x-pocketbeagle \
-${DT_VENDOR_PREFIX}am335x-sancloud-bbe \
+    ti/omap/am335x-bone \
+    ti/omap/am335x-pocketbeagle \
+    ti/omap/am335x-sancloud-bbe \
 "
 
 KERNEL_DEVICETREE = " \
-${DT_VENDOR_PREFIX}am335x-bone.dtb \
-${DT_VENDOR_PREFIX}am335x-boneblack.dtb \
-${DT_VENDOR_PREFIX}am335x-boneblack-wireless.dtb \
-${DT_VENDOR_PREFIX}am335x-boneblue.dtb \
-${DT_VENDOR_PREFIX}am335x-bonegreen.dtb \
-${DT_VENDOR_PREFIX}am335x-bonegreen-wireless.dtb \
-${DT_VENDOR_PREFIX}am335x-pocketbeagle.dtb \
-${DT_VENDOR_PREFIX}am335x-sancloud-bbe.dtb \
-${DT_VENDOR_PREFIX}am335x-sancloud-bbe-extended-wifi.dtb \
-${DT_VENDOR_PREFIX}am335x-sancloud-bbe-lite.dtb \
+    ti/omap/am335x-bone.dtb \
+    ti/omap/am335x-boneblack.dtb \
+    ti/omap/am335x-boneblack-wireless.dtb \
+    ti/omap/am335x-boneblue.dtb \
+    ti/omap/am335x-bonegreen.dtb \
+    ti/omap/am335x-bonegreen-wireless.dtb \
+    ti/omap/am335x-pocketbeagle.dtb \
+    ti/omap/am335x-sancloud-bbe.dtb \
+    ti/omap/am335x-sancloud-bbe-extended-wifi.dtb \
+    ti/omap/am335x-sancloud-bbe-lite.dtb \
 "
 
 MACHINE_GUI_CLASS = "bigscreen"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index bdfd4646..52d5968a 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -19,38 +19,38 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
 
 # Extra DT overlays/capes
 KERNEL_DEVICETREE:append:armv7a = " \
-${DT_VENDOR_PREFIX}AM335X-PRU-UIO-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-ADC-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-BBBW-WL1835-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-BBGG-WL1835-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-BBGW-WL1835-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-BONE-4D5R-01-00A1.dtbo \
-${DT_VENDOR_PREFIX}BB-BONE-eMMC1-01-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-BONE-LCD4-01-00A1.dtbo \
-${DT_VENDOR_PREFIX}BB-BONE-NH7C-01-A0.dtbo \
-${DT_VENDOR_PREFIX}BB-CAPE-DISP-CT4-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-HDMI-TDA998x-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-I2C1-MCP7940X-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-I2C1-RTC-DS3231.dtbo \
-${DT_VENDOR_PREFIX}BB-I2C1-RTC-PCF8563.dtbo \
-${DT_VENDOR_PREFIX}BB-I2C2-BME680.dtbo \
-${DT_VENDOR_PREFIX}BB-I2C2-MPU6050.dtbo \
-${DT_VENDOR_PREFIX}BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-NHDMI-TDA998x-00A0.dtbo \
-${DT_VENDOR_PREFIX}BBORG_COMMS-00A2.dtbo \
-${DT_VENDOR_PREFIX}BBORG_FAN-A000.dtbo \
-${DT_VENDOR_PREFIX}BBORG_RELAY-00A2.dtbo \
-${DT_VENDOR_PREFIX}BB-SPIDEV0-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-SPIDEV1-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-UART1-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-UART2-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-UART4-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-W1-P9.12-00A0.dtbo \
-${DT_VENDOR_PREFIX}BONE-ADC.dtbo \
-${DT_VENDOR_PREFIX}M-BB-BBG-00A0.dtbo \
-${DT_VENDOR_PREFIX}M-BB-BBGG-00A0.dtbo \
-${DT_VENDOR_PREFIX}PB-MIKROBUS-0.dtbo \
-${DT_VENDOR_PREFIX}PB-MIKROBUS-1.dtbo \
+    ti/omap/AM335X-PRU-UIO-00A0.dtbo \
+    ti/omap/BB-ADC-00A0.dtbo \
+    ti/omap/BB-BBBW-WL1835-00A0.dtbo \
+    ti/omap/BB-BBGG-WL1835-00A0.dtbo \
+    ti/omap/BB-BBGW-WL1835-00A0.dtbo \
+    ti/omap/BB-BONE-4D5R-01-00A1.dtbo \
+    ti/omap/BB-BONE-eMMC1-01-00A0.dtbo \
+    ti/omap/BB-BONE-LCD4-01-00A1.dtbo \
+    ti/omap/BB-BONE-NH7C-01-A0.dtbo \
+    ti/omap/BB-CAPE-DISP-CT4-00A0.dtbo \
+    ti/omap/BB-HDMI-TDA998x-00A0.dtbo \
+    ti/omap/BB-I2C1-MCP7940X-00A0.dtbo \
+    ti/omap/BB-I2C1-RTC-DS3231.dtbo \
+    ti/omap/BB-I2C1-RTC-PCF8563.dtbo \
+    ti/omap/BB-I2C2-BME680.dtbo \
+    ti/omap/BB-I2C2-MPU6050.dtbo \
+    ti/omap/BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
+    ti/omap/BB-NHDMI-TDA998x-00A0.dtbo \
+    ti/omap/BBORG_COMMS-00A2.dtbo \
+    ti/omap/BBORG_FAN-A000.dtbo \
+    ti/omap/BBORG_RELAY-00A2.dtbo \
+    ti/omap/BB-SPIDEV0-00A0.dtbo \
+    ti/omap/BB-SPIDEV1-00A0.dtbo \
+    ti/omap/BB-UART1-00A0.dtbo \
+    ti/omap/BB-UART2-00A0.dtbo \
+    ti/omap/BB-UART4-00A0.dtbo \
+    ti/omap/BB-W1-P9.12-00A0.dtbo \
+    ti/omap/BONE-ADC.dtbo \
+    ti/omap/M-BB-BBG-00A0.dtbo \
+    ti/omap/M-BB-BBGG-00A0.dtbo \
+    ti/omap/PB-MIKROBUS-0.dtbo \
+    ti/omap/PB-MIKROBUS-1.dtbo \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
index e1a58b8c..a29fc5ae 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -19,38 +19,38 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
 
 # Extra DT overlays/capes
 KERNEL_DEVICETREE:append:armv7a = " \
-${DT_VENDOR_PREFIX}AM335X-PRU-UIO-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-ADC-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-BBBW-WL1835-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-BBGG-WL1835-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-BBGW-WL1835-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-BONE-4D5R-01-00A1.dtbo \
-${DT_VENDOR_PREFIX}BB-BONE-eMMC1-01-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-BONE-LCD4-01-00A1.dtbo \
-${DT_VENDOR_PREFIX}BB-BONE-NH7C-01-A0.dtbo \
-${DT_VENDOR_PREFIX}BB-CAPE-DISP-CT4-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-HDMI-TDA998x-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-I2C1-MCP7940X-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-I2C1-RTC-DS3231.dtbo \
-${DT_VENDOR_PREFIX}BB-I2C1-RTC-PCF8563.dtbo \
-${DT_VENDOR_PREFIX}BB-I2C2-BME680.dtbo \
-${DT_VENDOR_PREFIX}BB-I2C2-MPU6050.dtbo \
-${DT_VENDOR_PREFIX}BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-NHDMI-TDA998x-00A0.dtbo \
-${DT_VENDOR_PREFIX}BBORG_COMMS-00A2.dtbo \
-${DT_VENDOR_PREFIX}BBORG_FAN-A000.dtbo \
-${DT_VENDOR_PREFIX}BBORG_RELAY-00A2.dtbo \
-${DT_VENDOR_PREFIX}BB-SPIDEV0-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-SPIDEV1-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-UART1-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-UART2-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-UART4-00A0.dtbo \
-${DT_VENDOR_PREFIX}BB-W1-P9.12-00A0.dtbo \
-${DT_VENDOR_PREFIX}BONE-ADC.dtbo \
-${DT_VENDOR_PREFIX}M-BB-BBG-00A0.dtbo \
-${DT_VENDOR_PREFIX}M-BB-BBGG-00A0.dtbo \
-${DT_VENDOR_PREFIX}PB-MIKROBUS-0.dtbo \
-${DT_VENDOR_PREFIX}PB-MIKROBUS-1.dtbo \
+    ti/omap/AM335X-PRU-UIO-00A0.dtbo \
+    ti/omap/BB-ADC-00A0.dtbo \
+    ti/omap/BB-BBBW-WL1835-00A0.dtbo \
+    ti/omap/BB-BBGG-WL1835-00A0.dtbo \
+    ti/omap/BB-BBGW-WL1835-00A0.dtbo \
+    ti/omap/BB-BONE-4D5R-01-00A1.dtbo \
+    ti/omap/BB-BONE-eMMC1-01-00A0.dtbo \
+    ti/omap/BB-BONE-LCD4-01-00A1.dtbo \
+    ti/omap/BB-BONE-NH7C-01-A0.dtbo \
+    ti/omap/BB-CAPE-DISP-CT4-00A0.dtbo \
+    ti/omap/BB-HDMI-TDA998x-00A0.dtbo \
+    ti/omap/BB-I2C1-MCP7940X-00A0.dtbo \
+    ti/omap/BB-I2C1-RTC-DS3231.dtbo \
+    ti/omap/BB-I2C1-RTC-PCF8563.dtbo \
+    ti/omap/BB-I2C2-BME680.dtbo \
+    ti/omap/BB-I2C2-MPU6050.dtbo \
+    ti/omap/BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
+    ti/omap/BB-NHDMI-TDA998x-00A0.dtbo \
+    ti/omap/BBORG_COMMS-00A2.dtbo \
+    ti/omap/BBORG_FAN-A000.dtbo \
+    ti/omap/BBORG_RELAY-00A2.dtbo \
+    ti/omap/BB-SPIDEV0-00A0.dtbo \
+    ti/omap/BB-SPIDEV1-00A0.dtbo \
+    ti/omap/BB-UART1-00A0.dtbo \
+    ti/omap/BB-UART2-00A0.dtbo \
+    ti/omap/BB-UART4-00A0.dtbo \
+    ti/omap/BB-W1-P9.12-00A0.dtbo \
+    ti/omap/BONE-ADC.dtbo \
+    ti/omap/M-BB-BBG-00A0.dtbo \
+    ti/omap/M-BB-BBGG-00A0.dtbo \
+    ti/omap/PB-MIKROBUS-0.dtbo \
+    ti/omap/PB-MIKROBUS-1.dtbo \
 "
 
 S = "${WORKDIR}/git"
-- 
2.39.2



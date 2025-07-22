Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAACC83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 18:49:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.21635.1753210178938220908
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Jul 2025 11:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B7EA340C83;
	Tue, 22 Jul 2025 18:49:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbYbAzJOullv; Tue, 22 Jul 2025 18:49:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 744E640800;
	Tue, 22 Jul 2025 18:49:34 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id B8BE716C9EA;
	Tue, 22 Jul 2025 14:49:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Andrew Davis <afd@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Ryan Eatmon <reatmon@ti.com>
Subject: [master][PATCH v2 2/3] meta-beagle: Remove selectable DT_VENDOR_PREFIX
Date: Tue, 22 Jul 2025 14:49:16 -0400
Message-Id: <20250722184917.53901-2-denis@denix.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250722184917.53901-1-denis@denix.org>
References: <20250722184917.53901-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Jul 2025 18:49:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18806

From: Andrew Davis <afd@ti.com>

This was used when the DT_VENDOR_PREFIX was different between supported
BSP versions. All supported now use the new prefix so drop this var.

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - rebased on latest master

 meta-beagle/conf/machine/beagle-x15.conf      | 16 ++---
 meta-beagle/conf/machine/beaglebone.conf      | 28 ++++----
 .../recipes-kernel/linux/linux-bb.org_6.12.bb | 64 +++++++++----------
 .../recipes-kernel/linux/linux-bb.org_6.6.bb  | 64 +++++++++----------
 4 files changed, 84 insertions(+), 88 deletions(-)

diff --git a/meta-beagle/conf/machine/beagle-x15.conf b/meta-beagle/conf/=
machine/beagle-x15.conf
index 44e0daf6..60cb2183 100644
--- a/meta-beagle/conf/machine/beagle-x15.conf
+++ b/meta-beagle/conf/machine/beagle-x15.conf
@@ -5,19 +5,17 @@
 require conf/machine/include/am57xx.inc
 require conf/machine/include/beagle-bsp.inc
=20
-DT_VENDOR_PREFIX =3D "ti/omap/"
-
 KERNEL_DEVICETREE_PREFIX =3D " \
-${DT_VENDOR_PREFIX}am57xx-beagle-x15 \
-${DT_VENDOR_PREFIX}am57xx-idk-lcd \
+    ti/omap/am57xx-beagle-x15 \
+    ti/omap/am57xx-idk-lcd \
 "
=20
 KERNEL_DEVICETREE =3D " \
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
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-beagle/conf/machine/beaglebone.conf b/meta-beagle/conf/=
machine/beaglebone.conf
index a4d11afe..63e52914 100644
--- a/meta-beagle/conf/machine/beaglebone.conf
+++ b/meta-beagle/conf/machine/beaglebone.conf
@@ -5,25 +5,23 @@
 require conf/machine/include/ti33x.inc
 require conf/machine/include/beagle-bsp.inc
=20
-DT_VENDOR_PREFIX =3D "ti/omap/"
-
 KERNEL_DEVICETREE_PREFIX =3D " \
-${DT_VENDOR_PREFIX}am335x-bone \
-${DT_VENDOR_PREFIX}am335x-pocketbeagle \
-${DT_VENDOR_PREFIX}am335x-sancloud-bbe \
+    ti/omap/am335x-bone \
+    ti/omap/am335x-pocketbeagle \
+    ti/omap/am335x-sancloud-bbe \
 "
=20
 KERNEL_DEVICETREE =3D " \
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
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta=
-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index b7e609e6..625a4a39 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -19,38 +19,38 @@ KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT=
} ${EXTRA_DTC_ARGS}"
=20
 # Extra DT overlays/capes
 KERNEL_DEVICETREE:append:armv7a =3D " \
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
=20
 S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
index 6a1f7868..a6098712 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -19,38 +19,38 @@ KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT=
} ${EXTRA_DTC_ARGS}"
=20
 # Extra DT overlays/capes
 KERNEL_DEVICETREE:append:armv7a =3D " \
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
=20
 S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
--=20
2.35.3



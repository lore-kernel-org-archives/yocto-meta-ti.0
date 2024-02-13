Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C1FC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 03:33:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3717.1707795209337659244
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 19:33:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 96EEB40C56;
	Tue, 13 Feb 2024 03:33:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1vUHoBvu_mF; Tue, 13 Feb 2024 03:33:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BB40240C2E;
	Tue, 13 Feb 2024 03:33:26 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7F18D163E37;
	Mon, 12 Feb 2024 22:33:26 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] meta-ti-bsp: update BeagleBoard.org BSP to the latest
Date: Mon, 12 Feb 2024 22:33:24 -0500
Message-Id: <20240213033324.3884608-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Feb 2024 03:33:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17476

From: Denys Dmytriyenko <denys@konsulko.com>

* Update linux-bb.org to 6.1.69 for both 32 and 64 bit platforms
* Update u-boot-bb.org to the latest 2023.04 based on SDK 9.1 release
* Update DTB/DTBO lists to include latest renames and additions

Note: all changes are in a single commit for bisectability

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/beagle-x15.conf      |  8 ++-
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  4 +-
 meta-ti-bsp/conf/machine/beaglebone.conf      | 57 +++++++++++++++++--
 meta-ti-bsp/conf/machine/beagleplay.conf      |  6 +-
 .../recipes-bsp/u-boot/u-boot-bb.org_git.bb   | 12 ++--
 .../recipes-kernel/linux/linux-bb.org_git.bb  | 18 +++---
 6 files changed, 78 insertions(+), 27 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/=
machine/beagle-x15.conf
index be27705c..d368fe1a 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
@@ -9,9 +9,11 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org"
 KERNEL_DEVICETREE_PREFIX =3D "am57xx-beagle-x15"
=20
 KERNEL_DEVICETREE =3D " \
-    am57xx-beagle-x15.dtb \
-    am57xx-beagle-x15-revb1.dtb \
-    am57xx-beagle-x15-revc.dtb \
+am57xx-beagle-x15.dtb \
+am57xx-beagle-x15-revb1.dtb \
+am57xx-beagle-x15-revc.dtb \
+am57xx-idk-lcd-osd101t2045.dtbo \
+am57xx-idk-lcd-osd101t2587.dtbo \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/=
conf/machine/beaglebone-ai64.conf
index e529f565..31fb4ac4 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -11,16 +11,18 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org"
 KERNEL_DEVICETREE =3D " \
 ti/k3-j721e-beagleboneai64.dtb \
 ti/k3-j721e-common-proc-board.dtb \
+ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
 ti/k3-j721e-evm-csi2-ov5640.dtbo \
 ti/k3-j721e-evm-fusion.dtbo \
 ti/k3-j721e-evm-gesi-exp-board.dtbo \
+ti/k3-j721e-evm-pcie0-ep.dtbo \
 ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
 ti/k3-j721e-evm-virt-mac-client.dtbo \
+ti/k3-j721e-sk.dtb \
 ti/k3-j721e-sk-csi2-ov5640.dtbo \
 ti/k3-j721e-sk-csi2-rpi-imx219.dtbo \
 ti/k3-j721e-sk-fusion.dtbo \
 ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
-ti/k3-j721e-sk.dtb \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/=
machine/beaglebone.conf
index d9353e9b..7f78b297 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
@@ -9,12 +9,57 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org"
 KERNEL_DEVICETREE_PREFIX =3D "am335x-bone"
=20
 KERNEL_DEVICETREE =3D " \
-    am335x-bone.dtb \
-    am335x-boneblue.dtb \
-    am335x-boneblack.dtb \
-    am335x-boneblack-wireless.dtb \
-    am335x-bonegreen.dtb \
-    am335x-bonegreen-wireless.dtb \
+am335x-bone.dtb \
+am335x-boneblack.dtb \
+am335x-boneblack-pps.dtb \
+am335x-boneblack-uboot.dtb \
+am335x-boneblack-uboot-univ.dtb \
+am335x-boneblack-wireless.dtb \
+am335x-boneblue.dtb \
+am335x-bonegreen.dtb \
+am335x-bonegreen-gateway.dtb \
+am335x-bonegreen-wireless.dtb \
+am335x-bonegreen-wireless-uboot-univ.dtb \
+am335x-pocketbeagle.dtb \
+am335x-sancloud-bbe.dtb \
+am335x-sancloud-bbe-extended-wifi.dtb \
+am335x-sancloud-bbe-lite.dtb \
+"
+
+# Extra DT overlays/capes
+KERNEL_DEVICETREE +=3D " \
+AM335X-PRU-UIO-00A0.dtbo \
+BB-ADC-00A0.dtbo \
+BB-BBBW-WL1835-00A0.dtbo \
+BB-BBGG-WL1835-00A0.dtbo \
+BB-BBGW-WL1835-00A0.dtbo \
+BB-BONE-4D5R-01-00A1.dtbo \
+BB-BONE-eMMC1-01-00A0.dtbo \
+BB-BONE-LCD4-01-00A1.dtbo \
+BB-BONE-NH7C-01-A0.dtbo \
+BB-CAPE-DISP-CT4-00A0.dtbo \
+BB-HDMI-TDA998x-00A0.dtbo \
+BB-I2C1-MCP7940X-00A0.dtbo \
+BB-I2C1-RTC-DS3231.dtbo \
+BB-I2C1-RTC-PCF8563.dtbo \
+BB-I2C2-BME680.dtbo \
+BB-I2C2-MPU6050.dtbo \
+BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
+BB-NHDMI-TDA998x-00A0.dtbo \
+BBORG_COMMS-00A2.dtbo \
+BBORG_FAN-A000.dtbo \
+BBORG_RELAY-00A2.dtbo \
+BB-SPIDEV0-00A0.dtbo \
+BB-SPIDEV1-00A0.dtbo \
+BB-UART1-00A0.dtbo \
+BB-UART2-00A0.dtbo \
+BB-UART4-00A0.dtbo \
+BB-W1-P9.12-00A0.dtbo \
+BONE-ADC.dtbo \
+M-BB-BBG-00A0.dtbo \
+M-BB-BBGG-00A0.dtbo \
+PB-MIKROBUS-0.dtbo \
+PB-MIKROBUS-1.dtbo \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay.conf
index 7778ba1e..cf86dae2 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -32,9 +32,7 @@ ti/k3-am625-sk.dtb \
 ti/k3-am625-sk-dmtimer-pwm.dtbo \
 ti/k3-am625-sk-ecap-capture.dtbo \
 ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
-ti/k3-am625-sk-mcan.dtbo \
 ti/k3-am625-sk-mcspi-loopback.dtbo \
-ti/k3-am625-sk-mcu-gpio-wakeup.dtbo \
 ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
 ti/k3-am625-sk-microtips-mf103hie-lcd2.dtbo \
 ti/k3-am625-sk-pwm.dtbo \
@@ -42,7 +40,11 @@ ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
 ti/k3-am62x-sk-csi2-imx219.dtbo \
 ti/k3-am62x-sk-csi2-ov5640.dtbo \
 ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
+ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
+ti/k3-am62x-sk-eqep.dtbo \
 ti/k3-am62x-sk-hdmi-audio.dtbo \
+ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
+ti/k3-am62x-sk-mcan.dtbo \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-t=
i-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
index 5bb20213..13286564 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
@@ -8,10 +8,10 @@ PV =3D "2023.04"
=20
 UBOOT_GIT_URI =3D "git://github.com/beagleboard/u-boot.git"
 UBOOT_GIT_PROTOCOL =3D "https"
-BRANCH =3D "v2023.04-ti-09.00.00.011"
-SRCREV =3D "4b8f8be8870f03d92a2b01d0d30ab912118adc82"
+BRANCH =3D "v2023.04-ti-09.01.00.008"
+SRCREV =3D "b0d717b732ee28e446baf94522b3491e590f7fbb"
=20
-BRANCH:beagleplay =3D "v2023.04-ti-09.00.00.011-BeaglePlay"
-BRANCH:beagleplay-k3r5 =3D "v2023.04-ti-09.00.00.011-BeaglePlay"
-SRCREV:beagleplay =3D "10afea462ea1113701f6f0f8853fdff985aa275d"
-SRCREV:beagleplay-k3r5 =3D "10afea462ea1113701f6f0f8853fdff985aa275d"
+BRANCH:beagleplay =3D "v2023.04-ti-09.01.00.008-BeaglePlay"
+BRANCH:beagleplay-k3r5 =3D "v2023.04-ti-09.01.00.008-BeaglePlay"
+SRCREV:beagleplay =3D "43791d945f4e5c25bcc19b9c778e8f9d194dc16e"
+SRCREV:beagleplay-k3r5 =3D "43791d945f4e5c25bcc19b9c778e8f9d194dc16e"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-=
ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index 9d798b9f..d6c4b993 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -19,15 +19,15 @@ KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT=
} ${EXTRA_DTC_ARGS}"
=20
 S =3D "${WORKDIR}/git"
=20
-# 6.1.46 version for 32-bit
-SRCREV:armv7a =3D "0df74a0c083222077e8def3ec7e52c75f7eff2f0"
-PV:armv7a =3D "6.1.46+git${SRCPV}"
-BRANCH:armv7a =3D "v6.1.46-ti-r13"
-
-# 6.1.46 version for 64-bit
-SRCREV:aarch64 =3D "f47f74d11b19d8ae2f146de92c258f40e0930d86"
-PV:aarch64 =3D "6.1.46+git${SRCPV}"
-BRANCH:aarch64 =3D "v6.1.46-ti-arm64-r13"
+# 6.1.69 version for 32-bit
+SRCREV:armv7a =3D "a1f26a19581970f76220c68c438981796ce5b767"
+PV:armv7a =3D "6.1.69+git${SRCPV}"
+BRANCH:armv7a =3D "v6.1.69-ti-r22"
+
+# 6.1.69 version for 64-bit
+SRCREV:aarch64 =3D "bc76b5d278271f66a6faeb2d09cb09fc6c57dd3c"
+PV:aarch64 =3D "6.1.69+git${SRCPV}"
+BRANCH:aarch64 =3D "v6.1.69-ti-arm64-r24"
=20
 SRC_URI =3D " \
     git://github.com/beagleboard/linux.git;protocol=3Dhttps;branch=3D${B=
RANCH} \
--=20
2.25.1



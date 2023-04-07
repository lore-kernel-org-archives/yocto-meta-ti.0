Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9014DC77B6C
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 20:37:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.421.1680899814374425507
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Apr 2023 13:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8233740C52;
	Fri,  7 Apr 2023 20:36:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i1ioPdcBjipI; Fri,  7 Apr 2023 20:36:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5898440C60;
	Fri,  7 Apr 2023 20:36:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C1F8F1637FE;
	Fri,  7 Apr 2023 16:36:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Robert Nelson <robertcnelson@gmail.com>
Subject: [master/kirkstone][PATCH 4/5] machine: beagleplay: add new BeaglePlay platform
Date: Fri,  7 Apr 2023 20:36:35 +0000
Message-Id: <20230407203636.3265548-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407203636.3265548-1-denis@denix.org>
References: <20230407203636.3265548-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 20:37:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16326

From: Denys Dmytriyenko <denys@konsulko.com>

* Add configs for BeaglePlay Cortex-A53 and Cortex-R5F cores (am62xx SoC =
family)
* Uses corresponding linux-bb.org and u-boot-bb.org recipes
* U-boot for now uses a separate branch for BeaglePlay

Cc: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf | 14 ++++
 meta-ti-bsp/conf/machine/beagleplay.conf      | 70 +++++++++++++++++++
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  1 +
 .../recipes-bsp/u-boot/u-boot-bb.org_git.bb   |  5 ++
 4 files changed, 90 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/beagleplay.conf

diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/=
conf/machine/beagleplay-k3r5.conf
new file mode 100644
index 00000000..c40615c9
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: BeaglePlay (R5F)
+#@DESCRIPTION: Machine configuration for the BeaglePlay (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
+PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
+
+SYSFW_SOC =3D "am62x"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "gp"
+
+UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay.conf
new file mode 100644
index 00000000..e8d25cd9
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -0,0 +1,70 @@
+#@TYPE: Machine
+#@NAME: BeaglePlay (A53)
+#@DESCRIPTION: Machine configuration for the BeaglePlay board (A53 core)
+
+require conf/machine/include/k3.inc
+SOC_FAMILY:append =3D ":am62xx"
+
+MACHINE_FEATURES +=3D "screen gpu"
+
+SERIAL_CONSOLES =3D "115200;ttyS2"
+SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
+
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+
+TFA_BOARD =3D "lite"
+TFA_K3_SYSTEM_SUSPEND =3D "1"
+
+OPTEEMACHINE =3D "k3-am62x"
+
+UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
+
+PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org"
+PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
+PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
+
+KERNEL_DEVICETREE =3D " \
+ti/k3-am625-beagleplay.dtb \
+ti/k3-am625-sk-csi2-ov5640.dtbo \
+ti/k3-am625-sk-csi2-tevi-ov5640.dtbo \
+ti/k3-am625-sk.dtb \
+ti/k3-am625-sk-ecap-capture.dtbo \
+ti/k3-am625-skeleton.dtb \
+ti/k3-am625-sk-hdmi-audio.dtbo \
+ti/k3-am625-sk-lpmdemo.dtb \
+ti/k3-am625-sk-mcan.dtbo \
+ti/k3-am625-sk-oldi-panel.dtbo \
+ti/k3-am625-sk-qspi-flash.dtbo \
+ti/k3-am625-sk-rpi-hdr-pwm.dtbo \
+ti/k3-am625-sk-rpi-hdr-spi.dtbo \
+ti/overlays/BBAI64-CSI0-imx219.dtbo \
+ti/overlays/BBAI64-CSI1-imx219.dtbo \
+ti/overlays/BBAI64-DSI-RPi-7inch-panel.dtbo \
+ti/overlays/BBAI64-P8_37-ehrpwm5_a.dtbo \
+ti/overlays/BBAI64-P9_25-ehrpwm4_b.dtbo \
+ti/overlays/BB-I2C2-MPU6050.dtbo \
+ti/overlays/BBORG_LOAD-00A2.dtbo \
+ti/overlays/BBORG_RELAY-00A2.dtbo \
+ti/overlays/BBORG_SERVO-00A2.dtbo \
+ti/overlays/BONE-FAN.dtbo \
+ti/overlays/BONE-I2C1.dtbo \
+ti/overlays/BONE-I2C2.dtbo \
+ti/overlays/BONE-I2C3.dtbo \
+ti/overlays/BONE-LED_P8_03.dtbo \
+ti/overlays/BONE-LED_P9_11.dtbo \
+ti/overlays/BONE-PWM0.dtbo \
+ti/overlays/BONE-PWM1.dtbo \
+ti/overlays/BONE-PWM2.dtbo \
+ti/overlays/BONE-SPI0_0.dtbo \
+ti/overlays/BONE-SPI0_1.dtbo \
+ti/overlays/BONE-SPI1_0.dtbo \
+ti/overlays/BONE-UART1.dtbo \
+ti/overlays/BONE-USB0-host.dtbo \
+ti/overlays/k3-am625-beagleplay-bcfserial-no-firmware.dtbo \
+ti/overlays/k3-am625-beagleplay-csi2-ov5640.dtbo \
+ti/overlays/k3-am625-beagleplay-lt-lcd185.dtbo \
+ti/overlays/robotics-cape.dtbo \
+"
+
+MACHINE_GUI_CLASS =3D "bigscreen"
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree kernel-image-im=
age"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 31b2910a..cde768df 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -42,6 +42,7 @@ SYSFW_PREFIX:j784s4-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5-gp =3D "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5-hs-se =3D "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5-hs-fs =3D "fs"
+SYSFW_PREFIX:beagleplay-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-lp-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-lp-evm-k3r5-hs-se =3D "fs"
 SYSFW_PREFIX:am62xx-lp-evm-k3r5-hs-fs =3D "fs"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-t=
i-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
index 579b5570..4e4688aa 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
@@ -17,3 +17,8 @@ BRANCH:beaglebone-ai64 =3D "v2021.01-ti-08.05.00.001"
 BRANCH:beaglebone-ai64-k3r5 =3D "v2021.01-ti-08.05.00.001"
 SRCREV:beaglebone-ai64 =3D "ea96725b5156135d5875415f75d2188f6f56622a"
 SRCREV:beaglebone-ai64-k3r5 =3D "ea96725b5156135d5875415f75d2188f6f56622=
a"
+
+BRANCH:beagleplay =3D "v2021.01-ti-BeaglePlay-Release"
+BRANCH:beagleplay-k3r5 =3D "v2021.01-ti-BeaglePlay-Release"
+SRCREV:beagleplay =3D "f036fbdc25941d7585182d2552c767edb9b04114"
+SRCREV:beagleplay-k3r5 =3D "f036fbdc25941d7585182d2552c767edb9b04114"
--=20
2.25.1



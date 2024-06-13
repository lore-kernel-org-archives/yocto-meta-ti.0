Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6A5C27C78
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 17:23:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.185.1718299386214139884
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Jun 2024 10:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E8F2740CCC;
	Thu, 13 Jun 2024 17:23:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77zq9tyYBKJj; Thu, 13 Jun 2024 17:23:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C736240CC6;
	Thu, 13 Jun 2024 17:23:03 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7F6F9163FA4;
	Thu, 13 Jun 2024 13:23:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH 3/4] conf/machine/beagle*, linux-bb.org: update for multi-BSP support
Date: Thu, 13 Jun 2024 13:22:53 -0400
Message-Id: <20240613172254.770920-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613172254.770920-1-denis@denix.org>
References: <20240613172254.770920-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Jun 2024 17:23:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17721

From: Denys Dmytriyenko <denys@konsulko.com>

Update all Beagle platform configurations to support multiple BSPs.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/beagle-x15.conf      | 18 ++--
 .../conf/machine/beaglebone-ai64-k3r5.conf    |  8 +-
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 23 ++++-
 meta-ti-bsp/conf/machine/beaglebone.conf      | 30 ++++---
 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf |  9 +-
 meta-ti-bsp/conf/machine/beagleplay.conf      | 48 ++++++++++-
 .../recipes-kernel/linux/linux-bb.org_git.bb  | 84 -------------------
 7 files changed, 100 insertions(+), 120 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/=
machine/beagle-x15.conf
index 706f999a..15815119 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
@@ -5,17 +5,21 @@
 require conf/machine/include/beagle.inc
 require conf/machine/include/am57xx.inc
=20
+DT_VENDOR_PREFIX =3D "ti/omap/"
+DT_VENDOR_PREFIX:bsp-ti-6_1 =3D ""
+DT_VENDOR_PREFIX:bsp-bb_org =3D ""
+
 KERNEL_DEVICETREE_PREFIX =3D " \
-ti/omap/am57xx-beagle-x15 \
-ti/omap/am57xx-idk-lcd \
+${DT_VENDOR_PREFIX}am57xx-beagle-x15 \
+${DT_VENDOR_PREFIX}am57xx-idk-lcd \
 "
=20
 KERNEL_DEVICETREE =3D " \
-ti/omap/am57xx-beagle-x15.dtb \
-ti/omap/am57xx-beagle-x15-revb1.dtb \
-ti/omap/am57xx-beagle-x15-revc.dtb \
-ti/omap/am57xx-idk-lcd-osd101t2045.dtbo \
-ti/omap/am57xx-idk-lcd-osd101t2587.dtbo \
+${DT_VENDOR_PREFIX}am57xx-beagle-x15.dtb \
+${DT_VENDOR_PREFIX}am57xx-beagle-x15-revb1.dtb \
+${DT_VENDOR_PREFIX}am57xx-beagle-x15-revc.dtb \
+${DT_VENDOR_PREFIX}am57xx-idk-lcd-osd101t2045.dtbo \
+${DT_VENDOR_PREFIX}am57xx-idk-lcd-osd101t2587.dtbo \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti=
-bsp/conf/machine/beaglebone-ai64-k3r5.conf
index 2bf58bce..85669cca 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
@@ -2,6 +2,7 @@
 #@NAME: BeagleBone AI-64 (R5F)
 #@DESCRIPTION: Machine configuration for the BeagleBone AI-64 (R5F core)
=20
+require conf/machine/include/beagle.inc
 require conf/machine/include/k3r5.inc
=20
 SYSFW_SOC =3D "j721e"
@@ -15,8 +16,7 @@ UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${U=
BOOT_SUFFIX}"
 UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
=20
 UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"
+UBOOT_MACHINE:bsp-ti-6_6 =3D "j721e_beagleboneai64_r5_defconfig"
=20
-# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which=
 has to be build
-# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot=
-mergeconfig.inc
-# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
-UBOOT_CONFIG_FRAGMENTS =3D "j721e_beagleboneai64_r5.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "j721e_beagleboneai64_r5.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "j721e_beagleboneai64_r5.config"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/=
conf/machine/beaglebone-ai64.conf
index aaf94fa5..618e27d7 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -6,11 +6,13 @@ require conf/machine/include/beagle.inc
 require conf/machine/include/j721e.inc
=20
 UBOOT_MACHINE =3D "j721e_evm_a72_config"
+UBOOT_MACHINE:bsp-ti-6_6 =3D "j721e_beagleboneai64_a72_defconfig"
=20
-# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which=
 has to be build
-# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot=
-mergeconfig.inc
-# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
-UBOOT_CONFIG_FRAGMENTS =3D "j721e_beagleboneai64_a72.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "j721e_beagleboneai64_a72.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "j721e_beagleboneai64_a72.config"
+
+SPL_BINARY:bsp-ti-6_6 =3D "tispl.bin_unsigned"
+SPL_BINARYNAME:bsp-ti-6_6 =3D "tispl.bin"
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-j721e \
@@ -24,4 +26,17 @@ ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
 ti/k3-j721e-sk.dtb \
 "
=20
+KERNEL_DEVICETREE:append:bsp-bb_org =3D " \
+ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
+ti/k3-j721e-common-proc-board-infotainment.dtbo \
+ti/k3-j721e-evm-csi2-ov5640.dtbo \
+ti/k3-j721e-evm-fusion.dtbo \
+ti/k3-j721e-evm-pcie0-ep.dtbo \
+ti/k3-j721e-evm-virt-mac-client.dtbo \
+ti/k3-j721e-sk-csi2-ov5640.dtbo \
+ti/k3-j721e-sk-csi2-rpi-imx219.dtbo \
+ti/k3-j721e-sk-fusion.dtbo \
+ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
+"
+
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/=
machine/beaglebone.conf
index 9d001599..9f5f41e0 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
@@ -5,23 +5,27 @@
 require conf/machine/include/beagle.inc
 require conf/machine/include/ti33x.inc
=20
+DT_VENDOR_PREFIX =3D "ti/omap/"
+DT_VENDOR_PREFIX:bsp-ti-6_1 =3D ""
+DT_VENDOR_PREFIX:bsp-bb_org =3D ""
+
 KERNEL_DEVICETREE_PREFIX =3D " \
-ti/omap/am335x-bone \
-ti/omap/am335x-pocketbeagle \
-ti/omap/am335x-sancloud-bbe \
+${DT_VENDOR_PREFIX}am335x-bone \
+${DT_VENDOR_PREFIX}am335x-pocketbeagle \
+${DT_VENDOR_PREFIX}am335x-sancloud-bbe \
 "
=20
 KERNEL_DEVICETREE =3D " \
-ti/omap/am335x-bone.dtb \
-ti/omap/am335x-boneblack.dtb \
-ti/omap/am335x-boneblack-wireless.dtb \
-ti/omap/am335x-boneblue.dtb \
-ti/omap/am335x-bonegreen.dtb \
-ti/omap/am335x-bonegreen-wireless.dtb \
-ti/omap/am335x-pocketbeagle.dtb \
-ti/omap/am335x-sancloud-bbe.dtb \
-ti/omap/am335x-sancloud-bbe-extended-wifi.dtb \
-ti/omap/am335x-sancloud-bbe-lite.dtb \
+${DT_VENDOR_PREFIX}am335x-bone.dtb \
+${DT_VENDOR_PREFIX}am335x-boneblack.dtb \
+${DT_VENDOR_PREFIX}am335x-boneblack-wireless.dtb \
+${DT_VENDOR_PREFIX}am335x-boneblue.dtb \
+${DT_VENDOR_PREFIX}am335x-bonegreen.dtb \
+${DT_VENDOR_PREFIX}am335x-bonegreen-wireless.dtb \
+${DT_VENDOR_PREFIX}am335x-pocketbeagle.dtb \
+${DT_VENDOR_PREFIX}am335x-sancloud-bbe.dtb \
+${DT_VENDOR_PREFIX}am335x-sancloud-bbe-extended-wifi.dtb \
+${DT_VENDOR_PREFIX}am335x-sancloud-bbe-lite.dtb \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/=
conf/machine/beagleplay-k3r5.conf
index e38029ff..16503f09 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
@@ -2,6 +2,7 @@
 #@NAME: BeaglePlay (R5F)
 #@DESCRIPTION: Machine configuration for the BeaglePlay (R5F core)
=20
+require conf/machine/include/beagle.inc
 require conf/machine/include/k3r5.inc
=20
 SYSFW_SOC =3D "am62x"
@@ -9,8 +10,8 @@ SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "gp"
=20
 UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
+UBOOT_MACHINE:bsp-ti-6_6 =3D "am62x_beagleplay_r5_defconfig"
=20
-# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which=
 has to be build
-# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot=
-mergeconfig.inc
-# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
-UBOOT_CONFIG_FRAGMENTS =3D "am625_beagleplay_r5.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "am625_beagleplay_r5.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "am625_beagleplay_r5.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-mainline =3D "beagleplay_r5.config"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay.conf
index a09c0d13..6f042d03 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -19,11 +19,14 @@ TFA_K3_SYSTEM_SUSPEND =3D "1"
 OPTEEMACHINE =3D "k3-am62x"
=20
 UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
+UBOOT_MACHINE:bsp-ti-6_6 =3D "am62x_beagleplay_a53_defconfig"
=20
-# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which=
 has to be build
-# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot=
-mergeconfig.inc
-# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
-UBOOT_CONFIG_FRAGMENTS =3D "am625_beagleplay_a53.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "am625_beagleplay_a53.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "am625_beagleplay_a53.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-mainline =3D "beagleplay_a53.config"
+
+SPL_BINARY:bsp-ti-6_6 =3D "tispl.bin_unsigned"
+SPL_BINARYNAME:bsp-ti-6_6 =3D "tispl.bin"
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am625 \
@@ -36,4 +39,41 @@ ti/k3-am625-sk.dtb \
 ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
=20
+KERNEL_DEVICETREE:append:bsp-bb_org =3D " \
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
+
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-=
ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index 534fc047..cee9c7cb 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -14,32 +14,6 @@ DEPENDS +=3D "gmp-native libmpc-native"
=20
 KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}=
"
=20
-KERNEL_DEVICETREE:beaglebone =3D " \
-am335x-bone.dtb \
-am335x-boneblack.dtb \
-am335x-boneblack-pps.dtb \
-am335x-boneblack-uboot.dtb \
-am335x-boneblack-uboot-univ.dtb \
-am335x-boneblack-wireless.dtb \
-am335x-boneblue.dtb \
-am335x-bonegreen.dtb \
-am335x-bonegreen-gateway.dtb \
-am335x-bonegreen-wireless.dtb \
-am335x-bonegreen-wireless-uboot-univ.dtb \
-am335x-pocketbeagle.dtb \
-am335x-sancloud-bbe.dtb \
-am335x-sancloud-bbe-extended-wifi.dtb \
-am335x-sancloud-bbe-lite.dtb \
-"
-
-KERNEL_DEVICETREE:beagle-x15 =3D " \
-am57xx-beagle-x15.dtb \
-am57xx-beagle-x15-revb1.dtb \
-am57xx-beagle-x15-revc.dtb \
-am57xx-idk-lcd-osd101t2045.dtbo \
-am57xx-idk-lcd-osd101t2587.dtbo \
-"
-
 # Extra DT overlays/capes
 KERNEL_DEVICETREE:append:armv7a =3D " \
 AM335X-PRU-UIO-00A0.dtbo \
@@ -76,64 +50,6 @@ PB-MIKROBUS-0.dtbo \
 PB-MIKROBUS-1.dtbo \
 "
=20
-KERNEL_DEVICETREE:beaglebone-ai64 =3D " \
-ti/k3-j721e-beagleboneai64.dtb \
-ti/k3-j721e-common-proc-board.dtb \
-ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
-ti/k3-j721e-common-proc-board-infotainment.dtbo \
-ti/k3-j721e-evm-csi2-ov5640.dtbo \
-ti/k3-j721e-evm-fusion.dtbo \
-ti/k3-j721e-evm-gesi-exp-board.dtbo \
-ti/k3-j721e-evm-pcie0-ep.dtbo \
-ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
-ti/k3-j721e-evm-virt-mac-client.dtbo \
-ti/k3-j721e-sk.dtb \
-ti/k3-j721e-sk-csi2-ov5640.dtbo \
-ti/k3-j721e-sk-csi2-rpi-imx219.dtbo \
-ti/k3-j721e-sk-fusion.dtbo \
-ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
-"
-
-KERNEL_DEVICETREE:beagleplay =3D " \
-ti/k3-am625-beagleplay.dtb \
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
-ti/k3-am625-sk.dtb \
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
-ti/k3-am62x-sk-hdmi-audio.dtbo \
-ti/k3-am62x-sk-hdmi-disable-fastboot.dtbo \
-ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
-ti/k3-am62x-sk-mcan.dtbo \
-"
-
 S =3D "${WORKDIR}/git"
=20
 # 6.1.80 version for 32-bit
--=20
2.25.1



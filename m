Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013F9D36119
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 19:11:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.28543.1730833879916223829
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 11:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4115540CD7;
	Tue,  5 Nov 2024 19:11:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_3ya87YteMd; Tue,  5 Nov 2024 19:11:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2AC0740CDD;
	Tue,  5 Nov 2024 19:11:18 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7E65F1640CF;
	Tue,  5 Nov 2024 14:11:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][RFC PATCH 4/6] conf/machine: split beagleplay config between meta-ti-bsp and meta-beagle
Date: Tue,  5 Nov 2024 14:10:58 -0500
Message-Id: <20241105191100.532413-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105191100.532413-1-denis@denix.org>
References: <20241105191100.532413-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Nov 2024 19:11:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18044

From: Denys Dmytriyenko <denys@konsulko.com>

Extract "bb_org" BSP specific settings from beagleplay-ti in meta-ti-bsp =
and
move them to own beagleplay machine config in meta-beagle.

The differences between 2 configs are minimal, hence beagleplay in meta-b=
eagle
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

diff --git a/meta-beagle/conf/machine/beagleplay-k3r5.conf b/meta-beagle/=
conf/machine/beagleplay-k3r5.conf
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
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "am625_beagleplay_r5.config"
diff --git a/meta-beagle/conf/machine/beagleplay.conf b/meta-beagle/conf/=
machine/beagleplay.conf
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
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "am625_beagleplay_a53.config"
+
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
diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-ti-b=
sp/conf/machine/beagleplay-ti-k3r5.conf
index 3844ccfa..c27e0abc 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
@@ -12,6 +12,5 @@ UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 =3D "am62x_beagleplay_r5_defconfig"
 UBOOT_MACHINE:bsp-ti-6_12 =3D "am62x_beagleplay_r5_defconfig"
=20
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "am625_beagleplay_r5.config"
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "am625_beagleplay_r5.config"
 UBOOT_CONFIG_FRAGMENTS:bsp-mainline =3D "beagleplay_r5.config"
diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-ti-bsp/co=
nf/machine/beagleplay-ti.conf
index 3ae10171..68d6dced 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-ti.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
@@ -24,14 +24,14 @@ UBOOT_MACHINE:bsp-ti-6_6 =3D "am62x_beagleplay_a53_de=
fconfig"
 UBOOT_MACHINE:bsp-ti-6_12 =3D "am62x_beagleplay_a53_defconfig"
=20
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "am625_beagleplay_a53.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "am625_beagleplay_a53.config"
 UBOOT_CONFIG_FRAGMENTS:bsp-mainline =3D "beagleplay_a53.config"
=20
 SPL_BINARY:bsp-ti-6_6 =3D "tispl.bin_unsigned"
 SPL_BINARYNAME:bsp-ti-6_6 =3D "tispl.bin"
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
-    ti/k3-am625 \
+    ti/k3-am625-beagle \
+    ti/k3-am625-sk \
     ti/k3-am62x-sk \
 "
=20
@@ -39,58 +39,11 @@ KERNEL_DEVICETREE =3D " \
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
=20
-KERNEL_DEVICETREE:append:bsp-bb_org =3D " \
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
 MACHINE_GUI_CLASS =3D "bigscreen"
--=20
2.25.1



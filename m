Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69D9C87FCF
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 23:46:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.17027.1754783198499236301
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 09 Aug 2025 16:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E9E5540CB1;
	Sat,  9 Aug 2025 23:46:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Wj70BulvopO; Sat,  9 Aug 2025 23:46:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C4E8640CB4;
	Sat,  9 Aug 2025 23:46:36 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 8054816F95F;
	Sat,  9 Aug 2025 19:46:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 4/4] meta-beagle: conf/machine rework all DTB lists
Date: Sat,  9 Aug 2025 19:46:35 -0400
Message-Id: <20250809234635.3626366-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250809234635.3626366-1-denis@denix.org>
References: <20250809234635.3626366-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 09 Aug 2025 23:46:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18920

From: Denys Dmytriyenko <denys@konsulko.com>

Improve KERNEL_DEVICETREE lists for all Beagle platforms:
* Expand the list with more overlays and related DTBs
* Since in many cases the lists are slightly different between
  6.6 and 6.12 kernels, explicitly provide both separate lists
* PocketBeagle2 is only supported by 6.12, so one list for now

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/conf/machine/beagle-x15.conf      | 35 +++++--
 meta-beagle/conf/machine/beaglebone-ai64.conf | 68 ++++++++++++-
 meta-beagle/conf/machine/beaglebone.conf      | 54 ++++++++---
 meta-beagle/conf/machine/beagleplay.conf      | 30 +++++-
 meta-beagle/conf/machine/beagley-ai.conf      | 97 ++++++++++++++++++-
 meta-beagle/conf/machine/pocketbeagle2.conf   | 34 ++++++-
 6 files changed, 292 insertions(+), 26 deletions(-)

diff --git a/meta-beagle/conf/machine/beagle-x15.conf b/meta-beagle/conf/=
machine/beagle-x15.conf
index 60cb2183..d0368924 100644
--- a/meta-beagle/conf/machine/beagle-x15.conf
+++ b/meta-beagle/conf/machine/beagle-x15.conf
@@ -10,12 +10,35 @@ KERNEL_DEVICETREE_PREFIX =3D " \
     ti/omap/am57xx-idk-lcd \
 "
=20
-KERNEL_DEVICETREE =3D " \
-    ti/omap/am57xx-beagle-x15.dtb \
-    ti/omap/am57xx-beagle-x15-revb1.dtb \
-    ti/omap/am57xx-beagle-x15-revc.dtb \
-    ti/omap/am57xx-idk-lcd-osd101t2045.dtbo \
-    ti/omap/am57xx-idk-lcd-osd101t2587.dtbo \
+KERNEL_DEVICETREE:bsp-bb_org-6_6 =3D " \
+ti/omap/am571x-idk.dtb \
+ti/omap/am571x-idk-touchscreen.dtbo \
+ti/omap/am5729-beagleboneai.dtb \
+ti/omap/am572x-idk.dtb \
+ti/omap/am572x-idk-touchscreen.dtbo \
+ti/omap/am574x-idk.dtb \
+ti/omap/am57xx-beagle-x15.dtb \
+ti/omap/am57xx-beagle-x15-revb1.dtb \
+ti/omap/am57xx-beagle-x15-revc.dtb \
+ti/omap/am57xx-evm.dtbo \
+ti/omap/am57xx-idk-lcd-osd101t2045.dtbo \
+ti/omap/am57xx-idk-lcd-osd101t2587.dtbo \
+"
+
+KERNEL_DEVICETREE:bsp-bb_org-6_12 =3D " \
+ti/omap/am571x-idk.dtb \
+ti/omap/am571x-idk-touchscreen.dtbo \
+ti/omap/am5729-beagleboneai.dtb \
+ti/omap/am572x-idk.dtb \
+ti/omap/am572x-idk-touchscreen.dtbo \
+ti/omap/am574x-idk.dtb \
+ti/omap/am57xx-beagle-x15.dtb \
+ti/omap/am57xx-beagle-x15-revb1.dtb \
+ti/omap/am57xx-beagle-x15-revc.dtb \
+ti/omap/am57xx-evm.dtbo \
+ti/omap/am57xx-evm-ov10635.dtbo \
+ti/omap/am57xx-idk-lcd-osd101t2045.dtbo \
+ti/omap/am57xx-idk-lcd-osd101t2587.dtbo \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/=
conf/machine/beaglebone-ai64.conf
index 0f15c712..e05c6aff 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
@@ -18,12 +18,78 @@ KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-j721e \
 "
=20
-KERNEL_DEVICETREE =3D " \
+KERNEL_DEVICETREE:bsp-bb_org-6_6 =3D " \
+ti/k3-j721e-beagleboneai64-BBORG_MOTOR.dtbo \
+ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
 ti/k3-j721e-beagleboneai64.dtb \
+ti/k3-j721e-beagleboneai64-microtips-mf070zima-lcd3.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm0-p8_13.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm0-p8_13-p8_19.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm0-p8_19.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm2-p9_14.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm2-p9_14-p9_16.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm2-p9_16.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm4-p9_25.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi1-cs0.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi1-cs0-no-miso.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi2-cs0.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi3-cs0-no-miso.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi6-cs0-cs1.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi6-cs0.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi6-cs1-no-miso.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi7-cs0.dtbo \
 ti/k3-j721e-common-proc-board.dtb \
+ti/k3-j721e-common-proc-board-infotainment.dtbo \
+ti/k3-j721e-evm-csi2-ov5640.dtbo \
+ti/k3-j721e-evm-ethfw.dtbo \
+ti/k3-j721e-evm-fusion.dtbo \
 ti/k3-j721e-evm-gesi-exp-board.dtbo \
+ti/k3-j721e-evm-ina2xx.dtbo \
+ti/k3-j721e-evm-pcie0-ep.dtbo \
+ti/k3-j721e-evm-pcie1-ep.dtbo \
 ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
+ti/k3-j721e-sk-csi2-dual-imx219.dtbo \
+ti/k3-j721e-sk-csi2-ov5640.dtbo \
 ti/k3-j721e-sk.dtb \
+ti/k3-j721e-sk-fpdlink-fusion.dtbo \
+ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
+"
+
+KERNEL_DEVICETREE:bsp-bb_org-6_12 =3D " \
+ti/k3-j721e-beagleboneai64-BBORG_MOTOR.dtbo \
+ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
+ti/k3-j721e-beagleboneai64.dtb \
+ti/k3-j721e-beagleboneai64-microtips-mf070zima-lcd3.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm0-p8_13.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm0-p8_13-p8_19.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm0-p8_19.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm2-p9_14.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm2-p9_14-p9_16.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm2-p9_16.dtbo \
+ti/k3-j721e-beagleboneai64-pwm-epwm4-p9_25.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi1-cs0.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi1-cs0-no-miso.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi2-cs0.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi3-cs0-no-miso.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi6-cs0-cs1.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi6-cs0.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi6-cs1-no-miso.dtbo \
+ti/k3-j721e-beagleboneai64-spi-mcspi7-cs0.dtbo \
+ti/k3-j721e-common-proc-board.dtb \
+ti/k3-j721e-common-proc-board-infotainment.dtbo \
+ti/k3-j721e-evm-csi2-ov5640.dtbo \
+ti/k3-j721e-evm-ethfw.dtbo \
+ti/k3-j721e-evm-fusion.dtbo \
+ti/k3-j721e-evm-gesi-exp-board.dtbo \
+ti/k3-j721e-evm-pcie0-ep.dtbo \
+ti/k3-j721e-evm-pcie1-ep.dtbo \
+ti/k3-j721e-evm-pcie-ntb.dtbo \
+ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
+ti/k3-j721e-evm-ub954.dtbo \
+ti/k3-j721e-sk-csi2-dual-imx219.dtbo \
+ti/k3-j721e-sk-csi2-ov5640.dtbo \
+ti/k3-j721e-sk.dtb \
+ti/k3-j721e-sk-fpdlink-fusion.dtbo \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-beagle/conf/machine/beaglebone.conf b/meta-beagle/conf/=
machine/beaglebone.conf
index 63e52914..50d09e3e 100644
--- a/meta-beagle/conf/machine/beaglebone.conf
+++ b/meta-beagle/conf/machine/beaglebone.conf
@@ -11,17 +11,49 @@ KERNEL_DEVICETREE_PREFIX =3D " \
     ti/omap/am335x-sancloud-bbe \
 "
=20
-KERNEL_DEVICETREE =3D " \
-    ti/omap/am335x-bone.dtb \
-    ti/omap/am335x-boneblack.dtb \
-    ti/omap/am335x-boneblack-wireless.dtb \
-    ti/omap/am335x-boneblue.dtb \
-    ti/omap/am335x-bonegreen.dtb \
-    ti/omap/am335x-bonegreen-wireless.dtb \
-    ti/omap/am335x-pocketbeagle.dtb \
-    ti/omap/am335x-sancloud-bbe.dtb \
-    ti/omap/am335x-sancloud-bbe-extended-wifi.dtb \
-    ti/omap/am335x-sancloud-bbe-lite.dtb \
+KERNEL_DEVICETREE:bsp-bb_org-6_6 =3D " \
+ti/omap/am335x-boneblack.dtb \
+ti/omap/am335x-boneblack-revd.dtb \
+ti/omap/am335x-boneblack-uboot.dtb \
+ti/omap/am335x-boneblack-uboot-univ.dtb \
+ti/omap/am335x-boneblack-wireless.dtb \
+ti/omap/am335x-boneblue.dtb \
+ti/omap/am335x-bone.dtb \
+ti/omap/am335x-bonegreen.dtb \
+ti/omap/am335x-bonegreen-gateway.dtb \
+ti/omap/am335x-bonegreen-wireless.dtb \
+ti/omap/am335x-bonegreen-wireless-uboot-univ.dtb \
+ti/omap/am335x-evm.dtb \
+ti/omap/am335x-evmsk.dtb \
+ti/omap/am335x-icev2.dtb \
+ti/omap/am335x-osd3358-sm-red.dtb \
+ti/omap/am335x-pocketbeagle.dtb \
+ti/omap/am335x-sancloud-bbe.dtb \
+ti/omap/am335x-sancloud-bbe-extended-wifi.dtb \
+ti/omap/am335x-sancloud-bbe-lite.dtb \
+"
+
+KERNEL_DEVICETREE:bsp-bb_org-6_12 =3D " \
+ti/omap/am335x-boneblack.dtb \
+ti/omap/am335x-boneblack-revd.dtb \
+ti/omap/am335x-boneblack-uboot.dtb \
+ti/omap/am335x-boneblack-uboot-univ.dtb \
+ti/omap/am335x-boneblack-wireless.dtb \
+ti/omap/am335x-boneblue.dtb \
+ti/omap/am335x-bone.dtb \
+ti/omap/am335x-bonegreen.dtb \
+ti/omap/am335x-bonegreen-eco.dtb \
+ti/omap/am335x-bonegreen-gateway.dtb \
+ti/omap/am335x-bonegreen-wireless.dtb \
+ti/omap/am335x-bonegreen-wireless-uboot-univ.dtb \
+ti/omap/am335x-evm.dtb \
+ti/omap/am335x-evmsk.dtb \
+ti/omap/am335x-icev2.dtb \
+ti/omap/am335x-osd3358-sm-red.dtb \
+ti/omap/am335x-pocketbeagle.dtb \
+ti/omap/am335x-sancloud-bbe.dtb \
+ti/omap/am335x-sancloud-bbe-extended-wifi.dtb \
+ti/omap/am335x-sancloud-bbe-lite.dtb \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-beagle/conf/machine/beagleplay.conf b/meta-beagle/conf/=
machine/beagleplay.conf
index 87d4942e..06f0e123 100644
--- a/meta-beagle/conf/machine/beagleplay.conf
+++ b/meta-beagle/conf/machine/beagleplay.conf
@@ -6,7 +6,7 @@ require conf/machine/beagleplay-ti.conf
=20
 require conf/machine/include/beagle-bsp.inc
=20
-KERNEL_DEVICETREE:append:bsp-bb_org-6_6 =3D " \
+KERNEL_DEVICETREE:bsp-bb_org-6_6 =3D " \
 ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
 ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
 ti/k3-am625-beagleplay.dtb \
@@ -32,3 +32,31 @@ ti/k3-am62x-sk-mcan.dtbo \
 ti/k3-am62x-sk-microtips-mf103hie-lcd2.dtbo \
 ti/k3-am62x-sk-pwm.dtbo \
 "
+
+KERNEL_DEVICETREE:bsp-bb_org-6_12 =3D " \
+ti/k3-am625-beagleplay-bcfserial-no-firmware.dtbo \
+ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
+ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
+ti/k3-am625-beagleplay.dtb \
+ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
+ti/k3-am625-sk.dtb \
+ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
+ti/k3-am625-sk-m2-cc3351.dtbo \
+ti/k3-am625-sk-mcspi-loopback.dtbo \
+ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
+ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
+ti/k3-am62x-sk-csi2-imx219.dtbo \
+ti/k3-am62x-sk-csi2-ov5640.dtbo \
+ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
+ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
+ti/k3-am62x-sk-dmtimer-pwm.dtbo \
+ti/k3-am62x-sk-ecap-capture.dtbo \
+ti/k3-am62x-sk-eqep.dtbo \
+ti/k3-am62x-sk-fastboot-disable-hdmi.dtbo \
+ti/k3-am62x-sk-hdmi-audio.dtbo \
+ti/k3-am62x-sk-lpm-io-ddr-wkup-sources.dtbo \
+ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
+ti/k3-am62x-sk-mcan.dtbo \
+ti/k3-am62x-sk-microtips-mf103hie-lcd2.dtbo \
+ti/k3-am62x-sk-pwm.dtbo \
+"
diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/=
machine/beagley-ai.conf
index 9e9e33b6..f7e7ec44 100644
--- a/meta-beagle/conf/machine/beagley-ai.conf
+++ b/meta-beagle/conf/machine/beagley-ai.conf
@@ -5,18 +5,105 @@
 require conf/machine/include/j722s.inc
 require conf/machine/include/beagle-bsp.inc
=20
-UBOOT_MACHINE =3D "j722s_evm_a53_config"
-UBOOT_MACHINE:bsp-bb_org-6_12 =3D "am67a_beagley_ai_a53_defconfig"
+IMAGE_SR1_HS_SE_FILES:bsp-bb_org-6_6 =3D ""
+
+UBOOT_MACHINE:bsp-bb_org-6_6 =3D "j722s_evm_a53_config"
+
+UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
+    ti/k3-am67a \
     ti/k3-j722s \
 "
=20
-KERNEL_DEVICETREE =3D ""
-
-KERNEL_DEVICETREE:append:bsp-bb_org-6_12 =3D " \
+KERNEL_DEVICETREE:bsp-bb_org-6_6 =3D " \
+ti/k3-am67a-beagley-ai.dtb \
+ti/k3-am67a-beagley-ai-i2c1-400000.dtbo \
+ti/k3-am67a-beagley-ai-i2c1-ads1115.dtbo \
+ti/k3-am67a-beagley-ai-i2c1-rtc-rv3028.dtbo \
+ti/k3-am67a-beagley-ai-i2c1-ssd1306.dtbo \
+ti/k3-am67a-beagley-ai-mikroe-eth.dtbo \
+ti/k3-am67a-beagley-ai-mikroe-microsd.dtbo \
+ti/k3-am67a-beagley-ai-pps-gpio18.dtbo \
+ti/k3-am67a-beagley-ai-pwm-ecap0-gpio12.dtbo \
+ti/k3-am67a-beagley-ai-pwm-ecap1-gpio16.dtbo \
+ti/k3-am67a-beagley-ai-pwm-ecap1-gpio21.dtbo \
+ti/k3-am67a-beagley-ai-pwm-ecap2-gpio17.dtbo \
+ti/k3-am67a-beagley-ai-pwm-ecap2-gpio18.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio12.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio14.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio15.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio15-gpio12.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio15-gpio14.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio5.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio5-gpio12.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio5-gpio14.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio13.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio20.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio21.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio21-gpio13.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio21-gpio20.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio6.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio6-gpio13.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio6-gpio20.dtbo \
+ti/k3-am67a-beagley-ai-spi0-1cs.dtbo \
+ti/k3-am67a-beagley-ai-spi0-2cs.dtbo \
+ti/k3-am67a-beagley-ai-spidev0.dtbo \
+ti/k3-am67a-beagley-ai-uart-ttyama0.dtbo \
+ti/k3-j722s-evm-csi2-ov5640.dtbo \
+ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo \
+ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo \
+ti/k3-j722s-evm-dsi-rpi-7inch-panel.dtbo \
 ti/k3-j722s-evm.dtb \
+ti/k3-j722s-evm-fpdlink-fusion.dtbo \
+ti/k3-j722s-evm-microtips-mf101hie-panel.dtbo \
+ti/k3-j722s-evm-pwm.dtbo \
+ti/k3-j722s-evm-v3link-fusion.dtbo \
+"
+
+KERNEL_DEVICETREE:bsp-bb_org-6_12 =3D " \
 ti/k3-am67a-beagley-ai.dtb \
+ti/k3-am67a-beagley-ai-i2c1-400000.dtbo \
+ti/k3-am67a-beagley-ai-i2c1-ads1115.dtbo \
+ti/k3-am67a-beagley-ai-i2c1-rtc-rv3028.dtbo \
+ti/k3-am67a-beagley-ai-i2c1-ssd1306.dtbo \
+ti/k3-am67a-beagley-ai-mikroe-eth.dtbo \
+ti/k3-am67a-beagley-ai-mikroe-microsd.dtbo \
+ti/k3-am67a-beagley-ai-pps-gpio18.dtbo \
+ti/k3-am67a-beagley-ai-pwm-ecap0-gpio12.dtbo \
+ti/k3-am67a-beagley-ai-pwm-ecap1-gpio16.dtbo \
+ti/k3-am67a-beagley-ai-pwm-ecap1-gpio21.dtbo \
+ti/k3-am67a-beagley-ai-pwm-ecap2-gpio17.dtbo \
+ti/k3-am67a-beagley-ai-pwm-ecap2-gpio18.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio12.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio14.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio15.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio15-gpio12.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio15-gpio14.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio5.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio5-gpio12.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm0-gpio5-gpio14.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio13.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio20.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio21.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio21-gpio13.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio21-gpio20.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio6.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio6-gpio13.dtbo \
+ti/k3-am67a-beagley-ai-pwm-epwm1-gpio6-gpio20.dtbo \
+ti/k3-am67a-beagley-ai-spi0-1cs.dtbo \
+ti/k3-am67a-beagley-ai-spi0-2cs.dtbo \
+ti/k3-am67a-beagley-ai-spidev0.dtbo \
+ti/k3-am67a-beagley-ai-uart-ttyama0.dtbo \
+ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo \
+ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo \
+ti/k3-j722s-evm-dsi-rpi-7inch-panel.dtbo \
+ti/k3-j722s-evm.dtb \
+ti/k3-j722s-evm-fpdlink-fusion.dtbo \
+ti/k3-j722s-evm-fpdlink-iv-fusion.dtbo \
+ti/k3-j722s-evm-microtips-mf101hie-panel.dtbo \
+ti/k3-j722s-evm-pwm.dtbo \
+ti/k3-j722s-evm-v3link-fusion.dtbo \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-beagle/conf/machine/pocketbeagle2.conf b/meta-beagle/co=
nf/machine/pocketbeagle2.conf
index 3d9651bd..6cbfeac4 100644
--- a/meta-beagle/conf/machine/pocketbeagle2.conf
+++ b/meta-beagle/conf/machine/pocketbeagle2.conf
@@ -20,9 +20,39 @@ UBOOT_MACHINE =3D "am6232_pocketbeagle2_a53_defconfig"
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am6232 \
+    ti/k3-am62-pocket \
 "
=20
 KERNEL_DEVICETREE =3D " \
-    ti/k3-am6232-pocketbeagle2.dtb \
-    ti/k3-am6232-pocketbeagle2-techlab-cape.dtbo \
+ti/k3-am6232-pocketbeagle2.dtb \
+ti/k3-am6232-pocketbeagle2-techlab-cape.dtbo \
+ti/k3-am625-beagleplay-bcfserial-no-firmware.dtbo \
+ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
+ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
+ti/k3-am625-beagleplay.dtb \
+ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
+ti/k3-am625-sk.dtb \
+ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
+ti/k3-am625-sk-m2-cc3351.dtbo \
+ti/k3-am625-sk-mcspi-loopback.dtbo \
+ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
+ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
+ti/k3-am62-pocketbeagle2-ardupilot-cape.dtbo \
+ti/k3-am62-pocketbeagle2.dtb \
+ti/k3-am62-pocketbeagle2-leds-off.dtbo \
+ti/k3-am62-pocketbeagle2-techlab-cape.dtbo \
+ti/k3-am62x-sk-csi2-imx219.dtbo \
+ti/k3-am62x-sk-csi2-ov5640.dtbo \
+ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
+ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
+ti/k3-am62x-sk-dmtimer-pwm.dtbo \
+ti/k3-am62x-sk-ecap-capture.dtbo \
+ti/k3-am62x-sk-eqep.dtbo \
+ti/k3-am62x-sk-fastboot-disable-hdmi.dtbo \
+ti/k3-am62x-sk-hdmi-audio.dtbo \
+ti/k3-am62x-sk-lpm-io-ddr-wkup-sources.dtbo \
+ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
+ti/k3-am62x-sk-mcan.dtbo \
+ti/k3-am62x-sk-microtips-mf103hie-lcd2.dtbo \
+ti/k3-am62x-sk-pwm.dtbo \
 "
--=20
2.25.1



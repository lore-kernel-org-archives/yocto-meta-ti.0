Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02762C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 03:46:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8031.1716522386254256659
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 May 2024 20:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 68A2140BA8;
	Fri, 24 May 2024 03:46:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VB1c-rGw27BR; Fri, 24 May 2024 03:46:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C6EB5408CD;
	Fri, 24 May 2024 03:46:23 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B9F22163F67;
	Thu, 23 May 2024 23:46:22 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap/kirkstone][PATCH] meta-ti-bsp: update BeagleBoard.org BSP to the latest
Date: Thu, 23 May 2024 23:46:20 -0400
Message-Id: <20240524034620.4048281-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 May 2024 03:46:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17680

From: Denys Dmytriyenko <denys@konsulko.com>

* Update linux-bb.org to 6.1.80 for both 32 and 64 bit platforms
* Update DTB/DTBO lists to include latest renames and additions
* Re-enable vendored DTB layout by default

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  1 +
 meta-ti-bsp/conf/machine/beagleplay.conf      | 16 ++++++++++++++++
 .../recipes-kernel/linux/linux-bb.org_git.bb  | 19 ++++++++-----------
 3 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/=
conf/machine/beaglebone-ai64.conf
index a19a3e29..7e0fb4f1 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -18,6 +18,7 @@ KERNEL_DEVICETREE =3D " \
 ti/k3-j721e-beagleboneai64.dtb \
 ti/k3-j721e-common-proc-board.dtb \
 ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
+ti/k3-j721e-common-proc-board-infotainment.dtbo \
 ti/k3-j721e-evm-csi2-ov5640.dtbo \
 ti/k3-j721e-evm-fusion.dtbo \
 ti/k3-j721e-evm-gesi-exp-board.dtbo \
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay.conf
index 9ea7ff75..fae67f98 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -34,6 +34,21 @@ ti/k3-am625-beagleplay.dtb \
 ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
 ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
 ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
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
 ti/k3-am625-sk.dtb \
 ti/k3-am625-sk-dmtimer-pwm.dtbo \
 ti/k3-am625-sk-ecap-capture.dtbo \
@@ -49,6 +64,7 @@ ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
 ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
 ti/k3-am62x-sk-eqep.dtbo \
 ti/k3-am62x-sk-hdmi-audio.dtbo \
+ti/k3-am62x-sk-hdmi-disable-fastboot.dtbo \
 ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
 ti/k3-am62x-sk-mcan.dtbo \
 "
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-=
ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index d6c4b993..81a26783 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -10,24 +10,21 @@ inherit kernel
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
=20
-# BB.org hasn't switched to "vendored" DTB layout by default yet
-KERNEL_DTBVENDORED =3D "0"
-
 DEPENDS +=3D "gmp-native libmpc-native"
=20
 KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}=
"
=20
 S =3D "${WORKDIR}/git"
=20
-# 6.1.69 version for 32-bit
-SRCREV:armv7a =3D "a1f26a19581970f76220c68c438981796ce5b767"
-PV:armv7a =3D "6.1.69+git${SRCPV}"
-BRANCH:armv7a =3D "v6.1.69-ti-r22"
+# 6.1.80 version for 32-bit
+SRCREV:armv7a =3D "4ca9ea30768d58c8d4d56d03dd1eaf8c8feb7ef9"
+PV:armv7a =3D "6.1.80+git${SRCPV}"
+BRANCH:armv7a =3D "v6.1.80-ti-r34"
=20
-# 6.1.69 version for 64-bit
-SRCREV:aarch64 =3D "bc76b5d278271f66a6faeb2d09cb09fc6c57dd3c"
-PV:aarch64 =3D "6.1.69+git${SRCPV}"
-BRANCH:aarch64 =3D "v6.1.69-ti-arm64-r24"
+# 6.1.80 version for 64-bit
+SRCREV:aarch64 =3D "977c75e082620f15c06c72bcced30f787c14b390"
+PV:aarch64 =3D "6.1.80+git${SRCPV}"
+BRANCH:aarch64 =3D "v6.1.80-ti-arm64-r49"
=20
 SRC_URI =3D " \
     git://github.com/beagleboard/linux.git;protocol=3Dhttps;branch=3D${B=
RANCH} \
--=20
2.25.1



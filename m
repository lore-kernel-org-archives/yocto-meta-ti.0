Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA310CD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 00:28:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9642.1780446528042451363
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 17:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0F08840C50;
	Wed,  3 Jun 2026 00:28:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4iw5IMG0l2u; Wed,  3 Jun 2026 00:28:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DD4C440C16;
	Wed,  3 Jun 2026 00:28:45 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 078DA17E6BE;
	Tue,  2 Jun 2026 20:28:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master/wrynose/scarthgap][PATCH] meta-beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.57
Date: Tue,  2 Jun 2026 20:28:44 -0400
Message-Id: <20260603002844.2413801-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 00:28:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19954

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

* Bump linux-bb.org from 6.12.43 to 6.12.57
* Update DTs for am62 platforms, such as beagleplay and pocketbeagle2

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
Since it's 6.12 and not yet 6.18, also cover scarthgap LTS

 meta-beagle/conf/machine/beagleplay.conf            |  4 +++-
 meta-beagle/conf/machine/pocketbeagle2.conf         | 13 +++++++------
 .../recipes-kernel/linux/linux-bb.org_6.12.bb       |  8 ++++----
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta-beagle/conf/machine/beagleplay.conf b/meta-beagle/conf/=
machine/beagleplay.conf
index 06f0e123..218dcc63 100644
--- a/meta-beagle/conf/machine/beagleplay.conf
+++ b/meta-beagle/conf/machine/beagleplay.conf
@@ -39,10 +39,10 @@ ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
 ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
 ti/k3-am625-beagleplay.dtb \
 ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
+ti/k3-am625-minimal.dtb \
 ti/k3-am625-sk.dtb \
 ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
 ti/k3-am625-sk-m2-cc3351.dtbo \
-ti/k3-am625-sk-mcspi-loopback.dtbo \
 ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
 ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
 ti/k3-am62x-sk-csi2-imx219.dtbo \
@@ -55,8 +55,10 @@ ti/k3-am62x-sk-eqep.dtbo \
 ti/k3-am62x-sk-fastboot-disable-hdmi.dtbo \
 ti/k3-am62x-sk-hdmi-audio.dtbo \
 ti/k3-am62x-sk-lpm-io-ddr-wkup-sources.dtbo \
+ti/k3-am62x-sk-lpm-standby.dtbo \
 ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
 ti/k3-am62x-sk-mcan.dtbo \
+ti/k3-am62x-sk-mcspi-loopback.dtbo \
 ti/k3-am62x-sk-microtips-mf103hie-lcd2.dtbo \
 ti/k3-am62x-sk-pwm.dtbo \
 "
diff --git a/meta-beagle/conf/machine/pocketbeagle2.conf b/meta-beagle/co=
nf/machine/pocketbeagle2.conf
index cc7957fc..bf10d565 100644
--- a/meta-beagle/conf/machine/pocketbeagle2.conf
+++ b/meta-beagle/conf/machine/pocketbeagle2.conf
@@ -25,20 +25,19 @@ KERNEL_DEVICETREE_PREFIX =3D " \
 KERNEL_DEVICETREE =3D " \
 ti/k3-am6232-pocketbeagle2.dtb \
 ti/k3-am6232-pocketbeagle2-techlab-cape.dtbo \
-ti/k3-am625-beagleplay-bcfserial-no-firmware.dtbo \
-ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
-ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
-ti/k3-am625-beagleplay.dtb \
-ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
+ti/k3-am625-minimal.dtb \
 ti/k3-am625-sk.dtb \
 ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
 ti/k3-am625-sk-m2-cc3351.dtbo \
-ti/k3-am625-sk-mcspi-loopback.dtbo \
 ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
 ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
 ti/k3-am62-pocketbeagle2-ardupilot-cape.dtbo \
 ti/k3-am62-pocketbeagle2.dtb \
+ti/k3-am62-pocketbeagle2-led-all.dtbo \
 ti/k3-am62-pocketbeagle2-leds-off.dtbo \
+ti/k3-am62-pocketbeagle2-mspm0swd.dtbo \
+ti/k3-am62-pocketbeagle2-pru0-out.dtbo \
+ti/k3-am62-pocketbeagle2-spi2-eth-wiz-click.dtbo \
 ti/k3-am62-pocketbeagle2-techlab-cape.dtbo \
 ti/k3-am62x-sk-csi2-imx219.dtbo \
 ti/k3-am62x-sk-csi2-ov5640.dtbo \
@@ -50,8 +49,10 @@ ti/k3-am62x-sk-eqep.dtbo \
 ti/k3-am62x-sk-fastboot-disable-hdmi.dtbo \
 ti/k3-am62x-sk-hdmi-audio.dtbo \
 ti/k3-am62x-sk-lpm-io-ddr-wkup-sources.dtbo \
+ti/k3-am62x-sk-lpm-standby.dtbo \
 ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
 ti/k3-am62x-sk-mcan.dtbo \
+ti/k3-am62x-sk-mcspi-loopback.dtbo \
 ti/k3-am62x-sk-microtips-mf103hie-lcd2.dtbo \
 ti/k3-am62x-sk-pwm.dtbo \
 "
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta=
-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index 77097d83..b61eddce 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -59,10 +59,10 @@ SRCREV:armv7a =3D "9e419b26243bd7efcd103ae0f6456f8285=
92b34b"
 PV:armv7a =3D "6.12.34+git"
 BRANCH:armv7a =3D "v6.12.34-ti-arm32-r12"
=20
-# 6.12.43 version for 64-bit
-SRCREV:aarch64 =3D "84c4b4613a852db269620a3fdfed65de90569fa1"
-PV:aarch64 =3D "6.12.43+git"
-BRANCH:aarch64 =3D "v6.12.43-ti-arm64-r54"
+# 6.12.57 version for 64-bit
+SRCREV:aarch64 =3D "2eea568f445af33f3280261904bf1027b02512d8"
+PV:aarch64 =3D "6.12.57+git"
+BRANCH:aarch64 =3D "v6.12.57-ti-arm64-r64"
=20
 KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
=20
--=20
2.25.1



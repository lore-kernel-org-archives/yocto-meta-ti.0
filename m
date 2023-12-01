Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAF7C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 23:38:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.7460.1701473879155193108
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Dec 2023 15:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E19B840C52;
	Fri,  1 Dec 2023 23:37:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ldAoZaep5PiM; Fri,  1 Dec 2023 23:37:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B6F8D40C3A;
	Fri,  1 Dec 2023 23:37:56 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.16.1.2])
	by mail.denix.org (Postfix) with ESMTP id 59013163D7E;
	Fri,  1 Dec 2023 18:37:56 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] linux-bb.org: update to the latest
Date: Fri,  1 Dec 2023 18:37:55 -0500
Message-Id: <20231201233755.17721-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Dec 2023 23:38:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17342

From: Denys Dmytriyenko <denys@konsulko.com>

Update the BB.org kernel to the latest. Also update BeaglePlay device
tree list, as there were some renames and new additions.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/beagleplay.conf            | 13 +++++++++----
 .../recipes-kernel/linux/linux-bb.org_git.bb        | 12 ++++++------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay.conf
index 978bbc5a..ac4a202a 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -28,17 +28,22 @@ KERNEL_DEVICETREE =3D " \
 ti/k3-am625-beagleplay.dtb \
 ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
 ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
+ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
 ti/k3-am625-sk.dtb \
-ti/k3-am625-sk-csi2-ov5640.dtbo \
-ti/k3-am625-sk-csi2-tevi-ov5640.dtbo \
 ti/k3-am625-sk-dmtimer-pwm.dtbo \
 ti/k3-am625-sk-ecap-capture.dtbo \
-ti/k3-am625-sk-hdmi-audio.dtbo \
+ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
 ti/k3-am625-sk-mcan.dtbo \
 ti/k3-am625-sk-mcspi-loopback.dtbo \
 ti/k3-am625-sk-mcu-gpio-wakeup.dtbo \
 ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
-ti/k3-am625-sk-rpi-hdr-pwm.dtbo \
+ti/k3-am625-sk-microtips-mf103hie-lcd2.dtbo \
+ti/k3-am625-sk-pwm.dtbo \
+ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
+ti/k3-am62x-sk-csi2-imx219.dtbo \
+ti/k3-am62x-sk-csi2-ov5640.dtbo \
+ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
+ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-=
ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index 4048e106..9d798b9f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -19,15 +19,15 @@ KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT=
} ${EXTRA_DTC_ARGS}"
=20
 S =3D "${WORKDIR}/git"
=20
-# 6.1.33 version for 32-bit
-SRCREV:armv7a =3D "feb1c153a9693d44dec5772d134bd2c7986ff95d"
-PV:armv7a =3D "6.1.33+git${SRCPV}"
-BRANCH:armv7a =3D "v6.1.33-ti-r7"
+# 6.1.46 version for 32-bit
+SRCREV:armv7a =3D "0df74a0c083222077e8def3ec7e52c75f7eff2f0"
+PV:armv7a =3D "6.1.46+git${SRCPV}"
+BRANCH:armv7a =3D "v6.1.46-ti-r13"
=20
 # 6.1.46 version for 64-bit
-SRCREV:aarch64 =3D "0a1e93a38c699fdd3c629d57f5cd015f90ab0d36"
+SRCREV:aarch64 =3D "f47f74d11b19d8ae2f146de92c258f40e0930d86"
 PV:aarch64 =3D "6.1.46+git${SRCPV}"
-BRANCH:aarch64 =3D "v6.1.46-ti-arm64-r9"
+BRANCH:aarch64 =3D "v6.1.46-ti-arm64-r13"
=20
 SRC_URI =3D " \
     git://github.com/beagleboard/linux.git;protocol=3Dhttps;branch=3D${B=
RANCH} \
--=20
2.35.3



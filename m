Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF2DC0032E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 20:45:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.65452.1697834726046504134
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 13:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0CFED41210;
	Fri, 20 Oct 2023 20:45:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pImY0nZaOHN1; Fri, 20 Oct 2023 20:45:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E956C4121F;
	Fri, 20 Oct 2023 20:45:22 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 8145A163D18;
	Fri, 20 Oct 2023 16:45:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 2/5] conf: beagleplay: trim down the DTB list
Date: Fri, 20 Oct 2023 20:44:55 +0000
Message-Id: <20231020204458.546852-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020204458.546852-1-denis@denix.org>
References: <20231020204458.546852-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Oct 2023 20:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17161

From: Denys Dmytriyenko <denys@konsulko.com>

Update DTB/DTBO list to only upstreamed devicetrees and overlays. This
help with migration to kernel 6.1, which doesn't have BB.org specific
overlays.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/beagleplay.conf | 40 +++++-------------------
 1 file changed, 7 insertions(+), 33 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay.conf
index 23f44c3f..106019c4 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -24,45 +24,19 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org"
=20
 KERNEL_DEVICETREE =3D " \
 ti/k3-am625-beagleplay.dtb \
+ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
+ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
+ti/k3-am625-sk.dtb \
 ti/k3-am625-sk-csi2-ov5640.dtbo \
 ti/k3-am625-sk-csi2-tevi-ov5640.dtbo \
-ti/k3-am625-sk.dtb \
+ti/k3-am625-sk-dmtimer-pwm.dtbo \
 ti/k3-am625-sk-ecap-capture.dtbo \
-ti/k3-am625-skeleton.dtb \
 ti/k3-am625-sk-hdmi-audio.dtbo \
-ti/k3-am625-sk-lpmdemo.dtb \
 ti/k3-am625-sk-mcan.dtbo \
-ti/k3-am625-sk-oldi-panel.dtbo \
-ti/k3-am625-sk-qspi-flash.dtbo \
+ti/k3-am625-sk-mcspi-loopback.dtbo \
+ti/k3-am625-sk-mcu-gpio-wakeup.dtbo \
+ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
 ti/k3-am625-sk-rpi-hdr-pwm.dtbo \
-ti/k3-am625-sk-rpi-hdr-spi.dtbo \
-ti/overlays/BBAI64-CSI0-imx219.dtbo \
-ti/overlays/BBAI64-CSI1-imx219.dtbo \
-ti/overlays/BBAI64-DSI-RPi-7inch-panel.dtbo \
-ti/overlays/BBAI64-P8_37-ehrpwm5_a.dtbo \
-ti/overlays/BBAI64-P9_25-ehrpwm4_b.dtbo \
-ti/overlays/BB-I2C2-MPU6050.dtbo \
-ti/overlays/BBORG_LOAD-00A2.dtbo \
-ti/overlays/BBORG_RELAY-00A2.dtbo \
-ti/overlays/BBORG_SERVO-00A2.dtbo \
-ti/overlays/BONE-FAN.dtbo \
-ti/overlays/BONE-I2C1.dtbo \
-ti/overlays/BONE-I2C2.dtbo \
-ti/overlays/BONE-I2C3.dtbo \
-ti/overlays/BONE-LED_P8_03.dtbo \
-ti/overlays/BONE-LED_P9_11.dtbo \
-ti/overlays/BONE-PWM0.dtbo \
-ti/overlays/BONE-PWM1.dtbo \
-ti/overlays/BONE-PWM2.dtbo \
-ti/overlays/BONE-SPI0_0.dtbo \
-ti/overlays/BONE-SPI0_1.dtbo \
-ti/overlays/BONE-SPI1_0.dtbo \
-ti/overlays/BONE-UART1.dtbo \
-ti/overlays/BONE-USB0-host.dtbo \
-ti/overlays/k3-am625-beagleplay-bcfserial-no-firmware.dtbo \
-ti/overlays/k3-am625-beagleplay-csi2-ov5640.dtbo \
-ti/overlays/k3-am625-beagleplay-lt-lcd185.dtbo \
-ti/overlays/robotics-cape.dtbo \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
--=20
2.25.1


